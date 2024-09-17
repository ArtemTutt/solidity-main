// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Coin {

    address public owner;
    mapping(address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not owner!");
        _;
    }

    function mintCoin(uint amount, address reciever) public onlyOwner {
        balances[reciever] += amount;
    }

    error insufficientBalances(uint requested, uint available);

    // It can do anybody
    function sendCoin(address reciever, uint amount) public {

        if(amount > balances[msg.sender])
        // отменяет все изменения, если человек пытается отправить большее количество монет чем имеет.
        revert insufficientBalances({
            requested: amount,
            available: balances[msg.sender]
        });

        balances[msg.sender] -= amount;
        balances[reciever] += amount;

        emit Sent(msg.sender, reciever, amount);
    }

}