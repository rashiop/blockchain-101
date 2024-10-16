// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/*
Any contract that follow the ERC20 standard is a ERC20 token.

ERC20 tokens provide functionalities to

transfer tokens
allow others to transfer tokens on behalf of the token holder
Here is the interface for ERC20.
*/

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    // how much money spender allowed to spend
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    // can spender spend from owner wallet?
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount)
        external
        returns (bool);
}