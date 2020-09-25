/*
SPDX-License-Identifier: Apache-2.0
*/

package edu.hit.sirtian;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

import io.netty.util.concurrent.RejectedExecutionHandlers;
import org.hyperledger.fabric.gateway.*;
import org.hyperledger.fabric.sdk.Peer;

public class ClientApp {

//	static {
//		System.setProperty("org.hyperledger.fabric.sdk.service_discovery.as_localhost", "true");
//	}

	private static AtomicInteger count = new AtomicInteger(0);

	private static class FabcarThread implements Runnable{

		private static Wallet wallet;

		private static final Path networkConfigPath =
				Paths.get("test-network", "organizations", "peerOrganizations", "org1.example.com", "connection-org1.yaml");

		private CountDownLatch latch;

		private int carNo;

		static {
			try {
				wallet = Wallets.newFileSystemWallet(Paths.get("wallet"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		public FabcarThread(CountDownLatch latch,int carNo) {
			this.latch = latch;
			this.carNo = carNo;
		}

		@Override
		public void run() {
			try{
				Gateway.Builder builder = Gateway.createBuilder();
				builder.identity(wallet, "appUser").networkConfig(networkConfigPath).discovery(true);

				// create a gateway connection
				try (Gateway gateway = builder.connect()) {

					// get the network and contract
					Network network = gateway.getNetwork("mychannel");
					Contract contract = network.getContract("fabcar");

					ArrayList<Peer> peerList = new ArrayList(network.getChannel().getPeers());
					Collections.shuffle(peerList);

					List<Peer> endorsers = new ArrayList<>(2);

					for(Peer peer:peerList){
						if(peer.getName().contains("org1")){
							endorsers.add(peer);
							break;
						}
					}

					for(Peer peer:peerList){
						if(peer.getName().contains("org2")){
							endorsers.add(peer);
							break;
						}
					}

					Transaction transaction  = contract.createTransaction("createCar");

					transaction.setEndorsingPeers(endorsers);

					transaction.submit("CAR" + carNo, "VW" + carNo, "Polo", "Grey", "Mary");

					byte[] result = contract.evaluateTransaction("queryCar", "CAR" + carNo);

					System.out.println(new String(result));

					count.getAndIncrement();
				}
			}catch (Exception e){
				System.out.printf("Thread execution failed on : %s,caused by %s\n","CAR" + carNo,e.getMessage());
			}finally {
				latch.countDown();
			}
		}
	}

	public static void main(String[] args) throws Exception {


		int taskCount = 3000;

		ExecutorService executor = Executors.newCachedThreadPool();

		CountDownLatch countDownLatch = new CountDownLatch(taskCount);

		for(int i = 0;i < taskCount;i++){
			executor.submit(new FabcarThread(countDownLatch, i));
			Thread.sleep(10);
		}
		countDownLatch.await();
		executor.shutdown();
		System.out.printf("++++++++++++%d Threads finished++++++++++++\n",count.get());
	}

}
