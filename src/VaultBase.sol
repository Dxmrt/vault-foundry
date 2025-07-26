// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VaultBase {
    mapping(address => uint256) internal balances;

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);
}
