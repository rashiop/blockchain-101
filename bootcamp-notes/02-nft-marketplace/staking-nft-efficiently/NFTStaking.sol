// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

/**
 * 1. deploy item contract
 * 2. deploy game contract
 */

contract Item is ERC721 {
  address public game;

  constructor() ERC721("Item", "IT") {
    _mint(msg.sender, 10);
  }
}

contract Game is IERC721Receiver {
  IERC721 public itemNFT;

  // bookeeping to ensure only owner can withdraw it
  mapping(uint256 => address) public originalOwner;

  constructor(IERC721 _address) {
    itemNFT = _address;
  }

  function onERC721Received(
    address operator,
    address from,
    uint256 tokenId,
    bytes calldata data
  ) external returns(bytes4) {
    return IERC721Receiver.onERC721Received.selector;
  }

  // transfer their nft to this contract
  // they cant trf others token as ERC721 already handle that
  function depositNFT(uint256 tokenId) external {
    originalOwner[tokenId] = msg.sender;
    itemNFT.safeTransfer(msg.sender, address(this), tokenId);
  }

  function withdrawNFT(uint256 tokenId) external {
    require(originalOwner[tokenId] == msg.sender, "Not owner");
    itemNFT.safeTransferFrom(address(this), msg.sender);
  }
}