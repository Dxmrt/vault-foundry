// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../lib/forge-std/src/Script.sol";
import "../src/VaultManager.sol";

contract DepositScript is Script {
    function run() public payable {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(pk);

        string memory vaultStr = vm.readFile("./vault_address.txt");
        address payable vaultAddress = payable(vm.parseAddress(vaultStr));
        uint256 valueToSend = 1 ether;

        (bool success, ) = vaultAddress.call{value: valueToSend}(
            abi.encodeWithSignature("deposit()")
        );
        require(success, "Deposit failed");

        vm.stopBroadcast();
    }
}
