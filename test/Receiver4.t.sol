// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// Import the necessary contracts and interfaces
import {Test, console2} from "forge-std/Test.sol";
import {GeneralNFT} from "../src/GeneralNFT.sol";
import {NONFT} from "../src/NONFT.sol";
import {NFTReceiver4} from "../src/Receiver4.sol";

contract Receiver4 is Test {
    // Declare the necessary variables
    address user1;
    GeneralNFT generalNFT;
    NONFT nonft;
    NFTReceiver4 receiver4;

    function setUp() public {
        user1 = makeAddr("user1");
        generalNFT = new GeneralNFT();
        nonft = new NONFT();
        receiver4 = new NFTReceiver4(address(nonft));
    }

    function testMintNFT() public {
        vm.startPrank(user1);
        // Mint an ERC721 token
        generalNFT.mintNFT(address(user1));
        // Check that the ERC721 token was minted
    }

    // Function to mint and transfer the ERC721 token to Receiver4 contract
    function testOnERC721Received() public {
        vm.startPrank(user1);
        generalNFT.mintNFT(address(user1));
        generalNFT.transferNFT(address(receiver4), 0);
        assertEq(nonft.balanceOf(address(user1)), 1);
        vm.stopPrank();
    }
}
