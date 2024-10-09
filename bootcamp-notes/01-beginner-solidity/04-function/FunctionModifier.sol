// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FunctionModifier {
    // modifiers are reusable code to modify the behaviour of a function or contract
    // before or after call
    // usage: restrict access, validate input, guard against reentrancy hack

    uint256 public num = 10;
    bool public paused;

    modifier whenNotPaused() {
        require(!paused, "Pausing not allowed");
        _; // resume function
    }

    modifier smaller(uint256 _lowerLimit) {
        require(num > _lowerLimit, "Too small");
        _; // resume function
    }

    modifier sandwiched() {
        num++; // pre
        _; // resume function
        num--; // post
    }
    function inc() external whenNotPaused  returns(uint256)  {
        return num++;    
    }

    function dec() external whenNotPaused smaller(0) returns(uint256) {
        return num--;
    }

    function sandwichedTest() external sandwiched returns(uint256)    {
        return num;
    }
 }