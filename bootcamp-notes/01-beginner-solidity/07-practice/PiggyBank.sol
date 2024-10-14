// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// self destruct
// only owner
contract PiggyBank {
    address public owner = msg.sender; // cheaper, but if multiple assignment, we might want to use ctor
    event Withdraw(address);
    event Deposit(uint amount);

    receive() external payable {
        emit Deposit(msg.value);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized");
        _;
    }

    function withdraw() external onlyOwner {
        emit Withdraw(msg.sender);
        selfdestruct(payable(msg.sender));
    }
}
