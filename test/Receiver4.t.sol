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
    address generalNFTAddress;
    address nonftAddress;
    address receiver4Address;

    // Set the addresses of the contracts
    constructor(
        address _generalNFTAddress,
        address _receiver4Address,
        address _nonftAddress
    ) {
        generalNFTAddress = _generalNFTAddress;
        receiver4Address = _receiver4Address;
        nonftAddress = _nonftAddress;
    }

    function setup() public {
        user1 = makeAddr("user1");
        // Create an instance of the GeneralNFT contract
        GeneralNFT generalNFT = new GeneralNFT();

        // Create an instance of the NONFT contract
        NONFT nonft = new NONFT();

        // Create an instance of the Receiver4 contract
        NFTReceiver4 receiver4 = new NFTReceiver4(address(nonft));

        // Set the addresses of the contracts
        generalNFTAddress = address(generalNFT);
        receiver4Address = address(receiver4);
        nonftAddress = address(nonft);
    }

    function testMintNFT() public {
        vm.startPrank(user1);
        // Create an instance of the GeneralNFT contract
        GeneralNFT generalNFT = GeneralNFT(generalNFTAddress);
        // Mint an ERC721 token
        generalNFT.mintNFT(address(user1));
        // Check that the ERC721 token was minted
        assertEq(generalNFT.balanceOf(address(user1)), 1);
    }

    // Function to mint and transfer the ERC721 token to Receiver4 contract
    function testOnERC721Received() public {
        vm.startPrank(user1);
        // Create an instance of the generalNFT contract
        GeneralNFT generalNFT = GeneralNFT(generalNFTAddress);
        // Create an instance of the Receiver4 contract
        NFTReceiver4 receiver4 = NFTReceiver4(receiver4Address);
        // Create an instance of the NONFT contract
        NONFT nonft = NONFT(nonftAddress);
        // Mint the ERC721 token and transfer it to the Receiver4 contract
        generalNFT.mintNFT(address(receiver4Address));
        generalNFT.transferNFT(address(receiver4Address), 1);

        // Transfer the NFT back to the owner and mint a NONFT
        receiver4.onERC721Received(address(generalNFT), address(user1), 1, "");
        assertEq(nonft.balanceOf(address(user1)), 1);
    }
}
