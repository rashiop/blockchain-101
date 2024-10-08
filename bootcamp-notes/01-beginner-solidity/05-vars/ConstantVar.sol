// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Their value is hard coded and using constants can save gas cost.
contract Constants {
    // coding convention to uppercase constant variables
    address public constant MY_ADDRESS =
        0x0000000000000000000000000000000000000000;
    uint256 public constant MY_UINT = 123;
}
