// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SayHallo} from "./lib.sol";

contract FundMe {

    address immutable owner;
    using SayHallo for uint;

    constructor() {
        owner = msg.sender;
    }

    struct InfoPay {
        uint amount;
        address sendor;
        uint timestamp;
    }

    InfoPay[] infopay;

    mapping(address => uint[]) balances;

    // отправлять деньги на смарт контракт
    function fund() public payable  {
        require(msg.value >= 2 ether, "didnt send enough money");

        InfoPay memory newPay = InfoPay(
            msg.value,
            msg.sender,
            block.timestamp
        );

        infopay.push(newPay);
        balances[msg.sender].push(msg.value);
    }

    receive() external payable { 
        fund();
    }

    fallback() external payable {
        fund();
     }

    function getFund(address _addr, uint _index) public view returns(uint) {
        return balances[_addr][_index];
    }

    function getMyNumber(uint _number) public pure returns(uint) {
        return  _number.multiM();
    }

    // Вывод денег владельцу контракта
    function withdraw() public {
        require(msg.sender == owner);
        require(address(this).balance > 0);
        address payable _to = payable(owner);
        uint ball = address(this).balance;
        // _to.transfer(ball);
        // bool sent_ = _to.send(ball);
        (bool sent, ) = _to.call{value: ball}("");
        require(sent, "Failed to send Ether");
    }
}