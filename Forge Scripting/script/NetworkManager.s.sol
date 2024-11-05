// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Bank.sol";

contract NetworkManager is Script {
    string public constant GOERLI = "goerli";
    string public constant MUMBAI = "mumbai";

    function run(string memory network) external {
        if (keccak256(bytes(network)) == keccak256(bytes(GOERLI))) {
            deployGoerli();
        } else if (keccak256(bytes(network)) == keccak256(bytes(MUMBAI))) {
            deployMumbai();
        } else {
            revert("Unsupported network");
        }
    }

    function deployGoerli() internal {
        vm.startBroadcast();
        new Bank();
        vm.stopBroadcast();
    }

    function deployMumbai() internal {
        vm.startBroadcast();
        new Bank();
        vm.stopBroadcast();
    }
}
