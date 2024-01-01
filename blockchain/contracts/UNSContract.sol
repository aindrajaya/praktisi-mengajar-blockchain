// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract TokenUNS {
  string public name = "The UNS Token";
  string public symbol = "TUT";

  // A variable to keep track of all balances, the fixed keyword is used to make sure that the totalSupply is not changed, stored in unsigned integer of 256 bits
  uint256 public totalSupplies = 500;

  // A mapping is essentially a hash table data structure. And is used to store Ethereum accounts]
  address public owner;

  //A mapping is a key-value store for storing and looking up data
  mapping(address => uint256) balances;

  // This is the Transfer event that will be emitted each time a transfer occurs. It helps off-chain applications to know when the state within your contract changes.
  event Transfer(address indexed _from, address indexed _to, uint256 _value);

  constructor() {
    // The totalSupply is assigned to transaction sender, which is the account that is deploying the contract
    owner = msg.sender;
    balances[owner] = totalSupplies;
  }

  function transfer(address to, uint256 amount) external{
     // Check if the sender has enough, if the require statement evaluates to false, the execution terminates and reverts all changes to the state and Ether balances.
    require(balances[msg.sender] >= amount, "Not enough tokens");

    // Check for overflows, this is need to prevent an integer overflow attack where the recipient balance could be manipulated to any value by an attacker.
    require(balances[to] + amount >= balances[to], "Overflow error");

    console.log(
      "Transferring from %s to %s %s tokens",
      msg.sender,
      to,
      amount
    );


    // Subtract from the sender, it means that the sender will lose the amount of tokens that are being transferred.
    balances[msg.sender] -= amount;

    // Add the same to the recipient, this mean that the recipient will gain the amount of tokens that are being transferred.
    balances[to] += amount;

    // Emit the Transfer event and notify off-chain applications of the transfer
    emit Transfer(msg.sender, to, amount);
  }

  function balanceOf(address account) external view returns (uint256){
    // The balance of an account is simply the value of the `balances` mapping for that account:
    return balances[account];
  }
}