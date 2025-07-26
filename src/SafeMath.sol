// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: underflow");
        return a - b;
    }
}
