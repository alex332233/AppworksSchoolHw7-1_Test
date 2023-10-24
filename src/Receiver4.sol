// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./NONFT.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract NFTReceiver4 is IERC721Receiver {
    NONFT public noNFTContract;

    constructor(address _noNFTAddress) {
        noNFTContract = NONFT(_noNFTAddress);
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) public override returns (bytes4) {
        if (address(operator) != address(noNFTContract)) {
            // 如果不是NoNFT合约发送的NFT，將NFT還給原始發送者，铸造新NFT并发送给原始发送者
            IERC721(msg.sender).transferFrom(address(this), from, tokenId);
            noNFTContract.mintNFT(address(this));
            uint256 noNFTtokenId = noNFTContract._nextTokenId() - 1;
            noNFTContract.safeTransferFrom(address(this), from, noNFTtokenId);
        }

        return this.onERC721Received.selector;
    }
}
