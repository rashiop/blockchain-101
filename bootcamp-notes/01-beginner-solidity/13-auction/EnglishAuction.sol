// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/*
English auction for NFT.

Auction
- Seller of NFT deploys this contract.
- Auction lasts for 7 days.
- Participants can bid by depositing ETH greater than the current highest bidder.
- All bidders can withdraw their bid if it is not the current highest bid.
- After the auction
    - Highest bidder becomes the new owner of NFT.
    - The seller receives the highest bid of ETH.
*/

interface IERC721 {
     function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;
    function transferFrom(address from, address to, uint256 tokenId) external;
}

contract EnglishAuction {
    event Start();
    event Bid(address indexed sender, uint256 amount);
    event Withdraw(address indexed sender, uint256 amount);
    event End(address winner, uint256 amount);

    IERC721 public immutable nft;
    uint256 public immutable nftId;

    address payable public immutable seller;
    uint32 public constant DURATIONS = 7 days;
    uint32 public endAt; // uint32 up to 100 years from now
    bool public isStarted;
    bool public isEnded;

    address public highestBidder;
    uint256 public highestBid;
    mapping(address => uint256) public bids; // store if u're not the highest bidder => u can withdraw

    constructor(address _nft, uint256 _nftId, uint256 _startingBid) {
        nft = IERC721(_nft);
        nftId = _nftId;

        highestBid = _startingBid;
        seller = payable(msg.sender);
    }

    function start() external {
        require(!isStarted, "Already start");
        require(msg.sender == seller, "not seller");

        // transfer ownership from seller to this contract
        nft.transferFrom(msg.sender, address(this), nftId);
        isStarted = true;
        endAt = uint32(block.timestamp + DURATIONS);

        emit Start();
    }

    function bid() external payable {
        require(isStarted, "Not start yet");
        require(!isEnded || block.timestamp < endAt, "Already ended");
        require(msg.value > highestBid, "Lower than highest bid");

        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;

        emit Bid(msg.sender, msg.value);

    }

    function withdraw() external {
        uint256 bal = bids[msg.sender];
        bids[msg.sender] = 0;
        // before transfer
        // set to 0 to protect from reentrancy

        payable(msg.sender).transfer(bal);

        emit Withdraw(msg.sender, bal);
    }

    function end() external {
        require(isStarted, "not started");
        require(block.timestamp >= endAt, "not ended");
        require(!isEnded, "ended");

        isEnded = true;
        if (highestBidder != address(0)) {
            nft.safeTransferFrom(address(this), highestBidder, nftId);
            seller.transfer(highestBid);
        } else {
            nft.safeTransferFrom(address(this), seller, nftId);
        }

        emit End(highestBidder, highestBid);
    }

}