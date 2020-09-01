#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#

# This is a collection of bash functions used by different scripts

export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

export PEER0_ORG1_CA=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export PEER1_ORG1_CA=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt
export PEER2_ORG1_CA=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer2.org1.example.com/tls/ca.crt
export PEER3_ORG1_CA=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer3.org1.example.com/tls/ca.crt
export PEER4_ORG1_CA=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer4.org1.example.com/tls/ca.crt

export PEER0_ORG2_CA=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export PEER1_ORG2_CA=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt
export PEER2_ORG2_CA=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer2.org2.example.com/tls/ca.crt
export PEER3_ORG2_CA=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer3.org2.example.com/tls/ca.crt
export PEER4_ORG2_CA=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer4.org2.example.com/tls/ca.crt

export PEER0_ORG3_CA=${PWD}/organizations/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt
export PEER1_ORG3_CA=${PWD}/organizations/peerOrganizations/org3.example.com/peers/peer1.org3.example.com/tls/ca.crt
export PEER2_ORG3_CA=${PWD}/organizations/peerOrganizations/org3.example.com/peers/peer2.org3.example.com/tls/ca.crt
export PEER3_ORG3_CA=${PWD}/organizations/peerOrganizations/org3.example.com/peers/peer3.org3.example.com/tls/ca.crt
export PEER4_ORG3_CA=${PWD}/organizations/peerOrganizations/org3.example.com/peers/peer4.org3.example.com/tls/ca.crt


# Set OrdererOrg.Admin globals
setOrdererGlobals() {
  export CORE_PEER_LOCALMSPID="OrdererMSP"
  export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
  export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/ordererOrganizations/example.com/users/Admin@example.com/msp
}

# Set environment variables for the peer org
setGlobals() {
  local USING_ORG=""
  local USING_PEER=""
  if [ -z "$OVERRIDE_ORG" ]; then
    USING_ORG=$1
  else
    USING_ORG="${OVERRIDE_ORG}"
  fi

  if [ -z "$OVERRIDE_PEER" ]; then
    USING_PEER=$2
  else
    USING_PEER="${OVERRIDE_PEER}"
  fi

  echo "Using organization ${USING_ORG}"
  echo "Using peer ${USING_PEER}"
  if [ $USING_ORG -eq 1 ]; then
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
    export CORE_PEER_LOCALMSPID="Org1MSP"
    if [ ${USING_PEER} -eq 0 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
      export CORE_PEER_ADDRESS=localhost:17051
    elif [ $USING_PEER -eq 1 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER1_ORG1_CA
      export CORE_PEER_ADDRESS=localhost:18051
    elif [ $USING_PEER -eq 2 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER2_ORG1_CA
      export CORE_PEER_ADDRESS=localhost:19051
    elif [ $USING_PEER -eq 3 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER3_ORG1_CA
      export CORE_PEER_ADDRESS=localhost:20051
    elif [ $USING_PEER -eq 4 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER4_ORG1_CA
      export CORE_PEER_ADDRESS=localhost:21051
    fi
  elif [ $USING_ORG -eq 2 ]; then
    export CORE_PEER_LOCALMSPID="Org2MSP"
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
    if [ $USING_PEER -eq 0 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
      export CORE_PEER_ADDRESS=localhost:27051
    elif [ $USING_PEER -eq 1 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER1_ORG2_CA
      export CORE_PEER_ADDRESS=localhost:28051
    elif [ $USING_PEER -eq 2 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER2_ORG2_CA
      export CORE_PEER_ADDRESS=localhost:29051
    elif [ $USING_PEER -eq 3 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER3_ORG2_CA
      export CORE_PEER_ADDRESS=localhost:30051
    elif [ $USING_PEER -eq 4 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER4_ORG2_CA
      export CORE_PEER_ADDRESS=localhost:31051
    fi

  elif [ $USING_ORG -eq 3 ]; then
    export CORE_PEER_LOCALMSPID="Org3MSP"
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp
    if [ $USING_PEER -eq 0 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG3_CA
      export CORE_PEER_ADDRESS=localhost:37051
    elif [ $USING_PEER -eq 1 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER1_ORG3_CA
      export CORE_PEER_ADDRESS=localhost:38051
    elif [ $USING_PEER -eq 2 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER2_ORG3_CA
      export CORE_PEER_ADDRESS=localhost:39051
    elif [ $USING_PEER -eq 3 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER3_ORG3_CA
      export CORE_PEER_ADDRESS=localhost:40051
    elif [ $USING_PEER -eq 4 ]; then
      export CORE_PEER_TLS_ROOTCERT_FILE=$PEER4_ORG3_CA
      export CORE_PEER_ADDRESS=localhost:41051
    fi
  else
    echo "================== ERROR !!! ORG Unknown =================="
  fi

  if [ "$VERBOSE" == "true" ]; then
    env | grep CORE
  fi
}

# parsePeerConnectionParameters $@
# Helper function that sets the peer connection parameters for a chaincode
# operation
parsePeerConnectionParameters() {
  PEER_CONN_PARMS=""
  PEERS=""
  while [ "$#" -gt 0 ]; do
    setGlobals $1 0
    PEER="peer0.org$1"
    ## Set peer adresses
    PEERS="$PEERS $PEER"
    PEER_CONN_PARMS="$PEER_CONN_PARMS --peerAddresses $CORE_PEER_ADDRESS"
    ## Set path to TLS certificate
    TLSINFO=$(eval echo "--tlsRootCertFiles \$PEER0_ORG$1_CA")
    PEER_CONN_PARMS="$PEER_CONN_PARMS $TLSINFO"
    # shift by one to get to the next organization
    shift
  done
  # remove leading space for output
  PEERS="$(echo -e "$PEERS" | sed -e 's/^[[:space:]]*//')"
}

verifyResult() {
  if [ $1 -ne 0 ]; then
    echo $'\e[1;31m'!!!!!!!!!!!!!!! $2 !!!!!!!!!!!!!!!!$'\e[0m'
    echo
    exit 1
  fi
}
