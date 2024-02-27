// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract OurTokenTest is Test{
    OurToken public ourToken;
    DeployOurToken public deployourToken;
    uint256 public constant STARTING_BALANCE = 100 ether;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() public {
        deployourToken = new DeployOurToken();
        ourToken = deployourToken.run();

        vm.prank(msg.sender);
        ourToken.transfer(bob,STARTING_BALANCE);
    }
    function testBobBalance() public {
        assertEq(ourToken.balanceOf(bob),STARTING_BALANCE);
    }
    function testAllowancesWorks() public {
       
        uint256 initialAllowance = 1000;
        vm.prank(bob);
        ourToken.approve(alice,initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        ourToken.transferFrom(bob,alice,transferAmount);
        assertEq(ourToken.balanceOf(alice),transferAmount);
        assertEq(ourToken.balanceOf(bob),STARTING_BALANCE-transferAmount);
    }
}
