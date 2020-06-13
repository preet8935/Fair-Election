pragma solidity ^0.5.0;
// We have to specify what version of compiler this code will compile with

contract Voting {
  
  mapping (bytes32 => uint8) public totalVotes; //map of bytes32 to uint8
  
  bytes32[] public candidates;//store candidate names

  constructor(bytes32[] memory candidateNames) public {
    candidates = candidateNames;//adding names to array
  }

  function totalVotesFor(bytes32 candidate) validity(candidate) public returns (uint8) {
    return totalVotes[candidate];//return totalvotes
  }

  function voteForCandidate(bytes32 candidate) validity(candidate) public {
    totalVotes[candidate] += 1;}
    
  modifier validity(bytes32 candidate){
      require(isValidCandidate(candidate));
      _;
  }
  
  //checks valid candidate
  function isValidCandidate (bytes32 candidate) public returns (bool) {
    for(uint i = 0; i < candidates.length; i++) {
      if (candidates[i] == candidate) {
        return true;
      }
    }
    return false;
  }

}
