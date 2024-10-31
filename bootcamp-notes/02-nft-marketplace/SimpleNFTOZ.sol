// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameItemOz is ERC721, Ownable {
    uint256 public tokenSupply = 0;
    uint256 public MAX_SUPPLY = 1_000;
    uint256 public PRICE = 1 ether;

    constructor()
        ERC721("Game Item Oz", "GITM") Ownable(msg.sender)
    {}

    function mint() external payable {
        _mint(msg.sender, tokenSupply);
        ++tokenSupply;
    }

    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function renounceOwnership() public override pure {
        require(false, "Method not supported");
    }
 }