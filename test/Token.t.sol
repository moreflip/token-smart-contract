// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

contract TokenTest is Test {
    Token token;
    address owner = address(0x123); // Initialize owner address
    address user1 = address(0x456); // Initialize user1 address
    address user2 = address(0x789); // Initialize user2 address

    function setUp() public {
        token = new Token();   
        vm.prank(owner);
        token.mint(owner, 1000 * 10 ** token.decimals());
    }

    function testInitialBalance() public {
        uint256 balance = token.checkBalance(owner);
        assertEq(balance, 1000 * 10 ** token.decimals());
    }

    function testTransfer() public {
        vm.prank(owner);
        token.transfer(owner, user1, 100 * 10 ** token.decimals());
        uint256 balanceUser1 = token.checkBalance(user1);
        assertEq(balanceUser1, 100 * 10 ** token.decimals());
    }

    function testBurn() public {
        vm.prank(owner);
        token.burn(owner, 50 * 10 ** token.decimals());
        uint256 balance = token.checkBalance(owner);
        assertEq(balance, 950 * 10 ** token.decimals());
    }

    function testMint() public {
        vm.prank(owner);
        token.mint(user2, 100 * 10 ** token.decimals());
        uint256 balance = token.checkBalance(user2);
        assertEq(balance, 100 * 10 ** token.decimals());
    }

    function testCheckBalance() public {
        uint256 balance = token.checkBalance(owner);
        assertEq(balance, 1000 * 10 ** token.decimals());
    }


}