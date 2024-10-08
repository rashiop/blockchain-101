// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FunctionIntro {
    function addNumber (uint x, uint y) external pure returns(uint) {
        return x + y;
    }

    function substractNumber(uint x, uint y) external pure returns(uint) {
        if (x > y) {
            return x - y;
        }
        return y - x;
    }
}