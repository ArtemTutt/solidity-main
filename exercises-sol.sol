// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract simpleStorage{

    uint public storeData;
    string public name;
    bool switchOn = true;

    function setData(uint x) public {
        storeData = x;
    }

    function getData() public view returns(uint){
        return storeData;
    }

    function getDataMulti() public view returns(uint){
        return storeData * 5;
    }
}
