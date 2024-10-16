// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PrecomputeContract {
    address public owner;
    uint256 public foo;

    constructor(address _owner, uint256 _foo) payable {
        owner = _owner;
        foo = _foo;
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
