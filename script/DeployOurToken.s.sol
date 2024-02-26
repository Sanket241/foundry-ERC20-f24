// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract DeployOurToken is Script{
        uint256 public constant INITIAL_SUPPLY = 100 ether;
    function run() external returns(OurToken){
        // OurToken ourToken;
        vm.startBroadcast();
        OurToken OT = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return OurToken(OT);
    }
}