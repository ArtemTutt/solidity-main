// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Test1{
    uint test = 42;

    // Чистые функции
    // pure работает только с областью видимостью только внутри самой функции мы не можем вернуть то что лежит не внутри функции
    // не модеж читать внешние переменные
    function myFunc(uint i, uint j) public pure returns(uint) {
        return i + j;
    }

}