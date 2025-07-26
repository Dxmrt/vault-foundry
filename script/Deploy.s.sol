// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../lib/forge-std/src/Script.sol";
import "../src/VaultManager.sol";

contract DeployVaultManager is Script {
    function run() public {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(pk);

        VaultManager vault = new VaultManager();
        console.log("VaultManager deployed at:", address(vault));

        // Save the address to file for reuse
        string memory path = string.concat(vm.projectRoot(), "/vault_address.txt");
        vm.writeFile(path, vm.toString(address(vault)));

        vm.stopBroadcast();
    }
}
