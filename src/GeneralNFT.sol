// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GeneralNFT is ERC721 {
    uint256 public _nextTokenId;
    
    constructor() ERC721("General NFT", "GN") {}

    function mintNFT(address to) public {
        uint256 tokenId = _nextTokenId++;
        _mint(to,tokenId);
    }

    function transferNFT(address to, uint256 tokenId) public{
        // 使用 safeTransferFrom 安全地转移 NFT
        safeTransferFrom(msg.sender, to, tokenId);
        // 使用 transferFrom 进行 NFT 转移
        // transferFrom(msg.sender, to, tokenId);

    }
}
