// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Demo {

    struct Payment {
        uint amount;
        uint timestemp;
        address from;
        string message;
    }

    struct Balance {
        uint totalPayment;
        mapping(uint => Payment) payments; // по инедку сможем достать любую транзакцию (оплату)
    }

    mapping(address => Balance) balances;

    function getPayments(address _addr, uint _index) public view returns(Payment memory) {
        return balances[_addr].payments[_index];
    }

    function pay(string memory message) public payable {
        uint paymentNum = balances[msg.sender].totalPayment;
        balances[msg.sender].totalPayment++;

        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp,
            msg.sender,
            message
        );

        balances[msg.sender].payments[paymentNum] = newPayment;
    }

}