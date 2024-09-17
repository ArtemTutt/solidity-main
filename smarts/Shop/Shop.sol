// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract MopedShop {

    uint256 public price = 2 ether;
    address public owner;
    address public shopAddress;
    mapping (address => bool) buyers;
    bool fullyPaid = false;

    constructor() {
        // Адресс владельца контракта
        owner = msg.sender;
        // адресс самого смарт контракта 
        shopAddress = address(this);
    }

    // модификатор view говорит нам о том, что функция будет только читить и ничего менять не будет 
    function getBalance() public view returns(uint) {
        return shopAddress.balance;
    }
    // Чтение адресов покупателей
    function getAddressBuyer (address _addr) public view returns(bool) {
        require(owner == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "You are not an owner!!!");

        return buyers[_addr];
    }

    // добавления адреса в покупатели
    function addBuyer(address _addr) public {

        require(owner == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "You are not an owner!!!");

        buyers[_addr] = true;
    }

    // external обозначает что эта функция будет вызывается только из смарт контратка
    // функция по приему денег
    //receive() external payable {
    //    emit Received(msg.sender, msg.value);
    //}

    // function payForItem() public payable { }

    // вторая функция по приему денег
    function payMe() external payable {
        // проверка на наличие адреса покупателя в покупателях
        require(buyers[msg.sender] && msg.value <= price && !fullyPaid, "Rejected");

        if (shopAddress.balance >= price) {
            fullyPaid = true;
        }
    }


    function withdrawAll() public {
        require(owner == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 && fullyPaid, "You are not an owner!!!");
        
        // Правильное привидение типов для того чтобы выводить деньги с контракта владельцу
        address payable _to = payable(owner);

        _to.transfer(shopAddress.balance);
    }
}