// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./VaultBase.sol";
import "./SafeMath.sol";

contract VaultManager is VaultBase {
    using SafeMath for uint256;

    // Deposit ETH into the vault
    function deposit() external payable {
        require(msg.value > 0, "Cannot deposit 0 ETH");
        balances[msg.sender] = balances[msg.sender].add(msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    // Withdraw ETH from the vault
    function withdraw(uint256 amount) external {
        require(amount > 0, "Cannot withdraw 0 ETH");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] = balances[msg.sender].sub(amount);

        (bool success,) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");

        emit Withdraw(msg.sender, amount);
    }

    // Public view function for external access
    function getUserBalance(address user) public view returns (uint256) {
        return balances[user];
    }
}
