// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract ManaualToken {
    mapping(address => uint256) balance;

    // string public name = "MAnual Token";

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balance[_owner];
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) { 
        uint256 previousBalance = balanceOf(msg.sender)+balanceOf(_to); // Get the balance of the sender and the recipient
        balance[msg.sender] -= _value; // Deduct from the sender
        balance[_to] += _value; // Add the same to the recipient  
        assert(balanceOf(msg.sender)+balanceOf(_to) == previousBalance); // Ensure that the total supply remains the same
        return true;
    }
}
