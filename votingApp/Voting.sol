pragma solidity ^0.4.18;

contract Voting {
  mapping (bytes32 => uint8) public votingReceived;
  bytes32[] public candidateList;

  function Voting(bytes32[] candidateNames) public {
    candidateList = candidateNames;
  }

  function totalVotesFor(bytes32 candidate) view public returns (uint8) {
    require(validCandidate(candidate));
    return votingReceived[candidate];
  }

  function voteForCandidate(bytes32 candidate) public {
      require(validCandidate(candidate));
      votingReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i<candidateList.length; i++) {
      if(candidateList[i] == candidate){
        return true;
      }
    }
    return false;
  }
}
