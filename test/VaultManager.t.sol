// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../lib/forge-std/src/Test.sol";
import "../src/VaultManager.sol";

contract VaultManagerTest is Test {
    VaultManager public vault;
    address user = address(1);

    function setUp() public {
        vault = new VaultManager();
        vm.deal(user, 10 ether); // Darle ETH al usuario para test
    }

    function testDeposit() public {
        vm.prank(user);
        vault.deposit{value: 1 ether}();

        uint256 balance = vault.getUserBalance(user);
        assertEq(balance, 1 ether);
    }

    function testWithdraw() public {
        // Primero depositamos
        vm.prank(user);
        vault.deposit{value: 2 ether}();

        // Ahora retiramos
        vm.prank(user);
        vault.withdraw(1 ether);

        uint256 balance = vault.getUserBalance(user);
        assertEq(balance, 1 ether);
    }

    function testWithdrawFailsWithoutBalance() public {
        vm.expectRevert("Insufficient balance");
        vm.prank(user);
        vault.withdraw(1 ether);
    }
}
