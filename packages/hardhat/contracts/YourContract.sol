pragma solidity >=0.6.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "./hashVerifier.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


// `commitToNumberAndThreshold(uint256 commitment)`
//  - check that `playerCommit == 0`
//  - updates `playerCommit` to `commitment`. Sets `threshold = blockhash(block.number - 1)`


contract YourContract {
  uint256 playerCommit = 0;
  uint256 threshold;
  constructor() public {
  }
  function setThreshold(uint commitment) public {
        require(playerCommit == 0, "You have already played.");
        require(1<=commitment && commitment<=13, "Invalid card.");
        uint block_hash = uint(
            keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))
        );
        playerCommit = commitment;
        threshold = block_hash % 13 + 1;
  }
}