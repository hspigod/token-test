// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {StandardToken} from "../src/token.sol";

contract StandardTokenScript is Script {
    StandardToken public standardToken;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("optimism_sepolia"));
    }

    function run() public {
        uint256 privateKey = vm.envUint("DEPLOYER_WALLET_PRIVATE_KEY");
        vm.startBroadcast(privateKey);
        standardToken = new StandardToken("AZKA", "AZ", 18, 100000);
        vm.stopBroadcast();
    }
}
