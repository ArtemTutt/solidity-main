// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Tree {
    bytes32[] public hashes;
    string[4] transactions = ["alice -> bob", "bob -> dave", "carol -> alice", "dave -> bob"];

    function encode(string memory input) public pure returns(bytes memory) {
        return abi.encodePacked(input);
    }

    function makeHash(string memory input) public pure returns(bytes32) {
        keccak256(
           
        );
    }
}