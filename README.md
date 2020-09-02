### 启动
需要先根据 hyperledger-fabric 官网提示进行基础环境搭建
1. 进入 `scripts`目录，运行`./startFabric.sh`进行网络搭建
2. 返回到项目目录，执行`mvn test`进行测试

### 端口分配

|          域名          |    端口     |
| :--------------------: | :---------: |
|  orderer0.example.com  | 17050:17050 |
|  orderer1.example.com  | 18050:18050 |
|  orderer2.example.com  | 19050:19050 |
|  orderer3.example.com  | 20050:20050 |
|  orderer4.example.com  | 21050:21050 |
|                        |             |
| peer0.org1.example.com | 17051:17051 |
| peer1.org1.example.com | 18051:18051 |
| peer2.org1.example.com | 19051:19051 |
| peer3.org1.example.com | 20051:20051 |
| peer4.org1.example.com | 21051:21051 |
|                        |             |
| peer0.org2.example.com | 27051:27051 |
| peer1.org2.example.com | 28051:28051 |
| peer2.org2.example.com | 29051:29051 |
| peer3.org2.example.com | 30051:30051 |
| peer4.org2.example.com | 31051:31051 |
|                        |             |
| peer0.org3.example.com | 37051:37051 |
| peer1.org3.example.com | 38051:38051 |
| peer2.org3.example.com | 39051:39051 |
| peer3.org3.example.com | 40051:40051 |
| peer4.org2.example.com | 41051:41051 |
|                        |             |
|        couchdb0        |    15984    |
|        couchdb1        |    16984    |
|        couchdb2        |    17984    |
|        couchdb3        |    18984    |
|        couchdb4        |    19984    |
|        couchdb5        |    20984    |
|                        |             |
|        couchdb6        |    21984    |
|        couchdb7        |    22984    |
|        couchdb8        |    23984    |
|        ouchdb9         |    24984    |
|       couchdb10        |    25984    |
|       couchdb11        |    26984    |
|                        |             |
|       couchdb12        |    27984    |
|       couchdb13        |    28984    |
|       couchdb14        |    29984    |
|                        |             |
|        ca_org1         | 17054:17054 |
|        ca_org2         | 18054:18054 |
|       ca_orderer       | 19054:19054 |
|        ca_org3         | 20054:20054 |