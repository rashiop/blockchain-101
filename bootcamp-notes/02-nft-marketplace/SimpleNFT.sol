// SPDX-License-Identifier
pragma solidity ^0.8.28;


// before using ERC721 OpenZeppelin
contract SimpleNFT {
  mapping(uint256 => address) private _owner;
  // sender => SC => bool
  mapping(address => mapping(address => bool)) private _operators;
  mapping(address => uint256) private _balances;

  string baseUrl = "https://api.coolcatsnft.com/cat/";

  event ApprovedForAll(address indexed _owner, address indexed _operator, bool _status);
  event Transfer(address indexed _from, address indexed _to, uint256 indexed tokenId);
  

  // simple mint
  // doesnt check who can mint, requirement, the token id
  function mint(uint256 _tokenId) external {
    require(msg.sender != address(0), "Invalid Address");
    require(_owner[_tokenId] == address(0), "Token already minted");
    require(_tokenId < 100, "Not enough supply");
    _owner[_tokenId] = msg.sender;

    _balances[msg.sender] += 1;

    emit Transfer(address(0), msg.sender, _tokenId);
  } 

  function ownerOf(uint256 _tokenId) external view returns (address) {
    require(_owner[_tokenId] != address(0), "No such token");
    return _owner[_tokenId];
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
    require(_owner[_tokenId] != address(0), "Token ID is not exists");
    require(_owner[_tokenId] == _from, "Cant transfer from non owner");
    require(msg.sender == _owner[_tokenId] || _operators[_from][msg.sender], "Wrong owner");
    require(_to != address(0) && _from != address(0) && _to != _from, "Invalid address");

    // no longer owned by from
    _operators[_from][msg.sender] = false;
    _owner[_tokenId] = _to;

    emit Transfer(_from, _to, _tokenId);

    _balances[_from] -= 1;
    _balances[_to] += 1;
  }

  function _setApprovalForAll(address _operator, bool _approved) internal {
    _operators[msg.sender][_operator] = _approved;

    emit ApprovedForAll(msg.sender, _operator, _approved);
  }
}