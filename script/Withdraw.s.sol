// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../lib/forge-std/src/Script.sol";
import "../src/VaultManager.sol";

contract WithdrawScript is Script {
    function run() public {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        address user = vm.addr(pk);

        string memory vaultStr = vm.readFile("./vault_address.txt");
        address vaultAddress = vm.parseAddress(vaultStr);
        VaultManager vault = VaultManager(vaultAddress);

        vm.startBroadcast(pk);

        uint256 balanceBefore = vault.getUserBalance(user);
        console.log("Balance bef withdraw:", balanceBefore);

        vault.withdraw(0.1 ether);

        uint256 balanceAfter = vault.getUserBalance(user);
        console.log("Balance after withdraw:", balanceAfter);

        vm.stopBroadcast();
    }
}
