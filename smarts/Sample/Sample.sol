
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SampleContract{
    // address has 20 byte
    // state 
    address public owner;
    // dict with key and value, where key is address and value is who send eth
    mapping (address => uint256) public payments;


    // 0xd9145CCE52D386f254917e481eB44e9943F39138

    constructor() {
        // code for deployment 

        owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    }

    // fixed info about pay from address(people who payed) and count of value
    function payForItem() public payable {

        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {

        require(owner == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

        address payable _to = payable(owner);
        // this это привязка к текущему контракту
        address _thiscontract = address(this);
        
        // выводим владельцу (owner) все деньги которые хранятся на контракте нашего смарт контракта
        _to.transfer(_thiscontract.balance);

    }

}