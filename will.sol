// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Will {
    address owner;
    // состояние (денежный эквивалент) 
    uint fortune;
    bool deceased;

    constructor() payable {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }

    modifier onlyownwer{
        require(msg.sender == owner, "You are not owner!");
        _;
    }

    modifier chechDesease {
        require(deceased == true, "Deceased not a true");
        _;
    }

    // All address which we can send eth
    //это массив адресов, каждый из которых может принимать Ether.
    address payable[] familyAddres;

    // кто сколько денег скинул
    mapping(address => uint) inheritance;

    function setInheritance(address payable _addr, uint amount) public onlyownwer {
        familyAddres.push(_addr);
        inheritance[_addr] = amount;
    }

    function getFamAddres() public view onlyownwer returns(uint) {
        return familyAddres.length;
    }

    function getAmountOfAddress(address _addr) public view onlyownwer returns(uint) {
        return inheritance[_addr];
    }

    // функция для выплаты всем кошелькам из массива их деньги
    // выплата идет со смарт контракта адресу который находится в массиве
    function payout() private chechDesease {
        for (uint i = 0; i < familyAddres.length; i++) {
            familyAddres[i].transfer(inheritance[familyAddres[i]]);
        }
    }

    function hasDeceased() public onlyownwer {
        deceased = true;
        payout();
    }
}  