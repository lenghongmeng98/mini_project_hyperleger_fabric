export FABRIC_CFG_PATH=${PWD}/config/
export PEER0_ORG1_CA=${PWD}/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export PEER0_ORG2_CA=${PWD}/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt


setGlobalsForPeer0Org1(){
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_ID="Org1MSP"
    export ORDERER_CA=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

setGlobalsForPeer0Org2(){
    export CORE_PEER_LOCALMSPID="Org2MSP"
    export CORE_PEER_ID="Org2MSP"
    export ORDERER_CA=${PWD}/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/peerOrganizations/org2.example.com/users/Admin@org1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:7053
}

updateAnchorPeers1(){
    setGlobalsForPeer0Org1
    peer channel update -o localhost:7050 -c mychannel -f ./artifact/Org1Anchor.tx --tls --cafile ${PWD}/crypto-config/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem
}

# updateAnchorPeers2(){
#     setGlobalsForPeer0Org2
#     peer channel update -o localhost:7050 -c mychannel -f ./artifact/Org2Anchor.tx --tls --cafile ${PWD}/crypto-config/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem
# }

updateAnchorPeers1
# updateAnchorPeers2