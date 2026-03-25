// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import {Token} from "../src/Token.sol";

contract TokenScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        Token token = new Token();
        token.mint(msg.sender, 1000 * 10 ** token.decimals());

        vm.stopBroadcast();
    }
}