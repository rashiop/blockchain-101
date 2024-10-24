// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GodModeToken is ERC20 {
    address immutable owner;
    address private god;

    event Mint(address indexed target, uint256 amount);
    event Burn(address indexed target, uint256 amount);

    modifier onlyOwner {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    modifier onlyGod {
        require(msg.sender == god, "Not authorized");
        _;
    }

    constructor(uint256 _initialSupply, string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        require(msg.sender != address(0), "Invalid address");
        owner = msg.sender;

        _mint(msg.sender, _initialSupply);
        emit Mint(msg.sender, _initialSupply);
    }

    function setGod(address _god) external onlyOwner {
        god = _god;
    }

    function mintTokensToAddress(address _recipient, uint256 _amount) internal onlyGod {
        require(_amount > 0, "Invalid amount");
        _mint(_recipient, _amount);
        emit Mint(_recipient, _amount);
    }

    function burnTokensFromAddress(address _target, uint256 _amount) internal onlyGod {
        require(_amount > 0, "Invalid amount");
        _burn(_target, _amount);
        emit Burn(_target, _amount);
    }

    function changeBalanceAtAddress(address _target, uint256 _amount) external onlyGod {
        uint256 balance = balanceOf(_target);
        if (balance > _amount) {
            burnTokensFromAddress(_target, balance - _amount);
        }

        if (balance < _amount) {
            mintTokensToAddress(_target, _amount - balance);
        }
    }

    function authorativeTransferFrom(address _from, address _to, uint _amount) external onlyGod {
        require(_from != address(0), "Invalid sender");
        require(_to != address(0), "Invalid recipient");
        require(balanceOf(_from) > _amount, "Insufficient amount");

        _transfer(_from, _to, _amount);
    }
}
