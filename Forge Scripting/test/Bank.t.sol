// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {
    Bank bank;

    function setUp() public {
        bank = new Bank();
    }

    function testDeposit() public {
        bank.deposit{value: 1 ether}();
        assertEq(bank.getBalance(address(this)), 1 ether);
    }

    function testWithdraw() public {
        bank.deposit{value: 2 ether}();
        bank.withdraw(1 ether);
        assertEq(bank.getBalance(address(this)), 1 ether);
    }

    function testWithdrawFailsOnInsufficientBalance() public {
        vm.expectRevert("Insufficient balance");
        bank.withdraw(1 ether);
    }

    // Pruebas Fuzzing
    function testFuzzDeposit(uint256 amount) public {
        vm.assume(amount > 0 && amount <= 1e18); // asegurarse de que sea un valor válido
        bank.deposit{value: amount}();
        assertEq(bank.getBalance(address(this)), amount);
    }

    function testFuzzWithdraw(uint256 depositAmount, uint256 withdrawAmount) public {
        vm.assume(depositAmount > 0 && depositAmount <= 1e18);
        vm.assume(withdrawAmount <= depositAmount);
        
        bank.deposit{value: depositAmount}();
        bank.withdraw(withdrawAmount);
        
        assertEq(bank.getBalance(address(this)), depositAmount - withdrawAmount);
    }
}
