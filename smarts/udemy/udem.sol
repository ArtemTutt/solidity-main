// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract DecentralBank {
  address public owner;
  string public name = "Decentral Bank";


    constructor () {
        owner = msg.sender;
    }


  mapping(address => uint) public stakingBalance;
  mapping(address => bool) public hasStaked;
  mapping(address => bool) public isStaked;
  address[] public stakers;

  function deleteStakers(address _address) public {
    for (uint i = 0; i < stakers.length; i++) {
      if(stakers[i] == _address) {
        stakers[i] = stakers[stakers.length - 1];
        stakers.pop();
      }
    }
  }

  function stakingTokens(uint _amount) public {
    

    stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;
    

    if(!hasStaked[msg.sender]) {
      stakers.push(msg.sender);   
    }

    isStaked[msg.sender] = true;
    hasStaked[msg.sender] = true;
  }
}
