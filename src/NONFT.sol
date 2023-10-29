// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NONFT is ERC721 {
    uint256 public _nextTokenId = 0;
    string private _baseTokenURI =
        "https://ipfs.io/ipfs/QmfAn6MtzspF5Z6Lsyt7XSFg5qwNru6U77mDFkhumjVY9o";

    constructor() ERC721("Don't send NFT to me", "NONFT") {}

    function mintNFT(address to) public {
        uint256 tokenId = _nextTokenId++;
        _mint(to, tokenId);
    }

    // function tokenURI() public view override returns (string memory) {
    //     return _baseTokenURI;
    // }
}
