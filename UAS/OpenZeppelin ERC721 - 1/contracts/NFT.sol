// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {
    // Counter to track token IDs
    uint256 private tokenIdCounter;

    // Base URI for metadata
    string private baseTokenURI;

    // Event to log token creation
    event TokenCreated(address indexed owner, uint256 tokenId);

    constructor(string memory _name, string memory _symbol, string memory _baseTokenURI) ERC721(_name, _symbol) Ownable(msg.sender) {
        baseTokenURI = _baseTokenURI;
    }

    // Mint a new NFT
    function mint() external onlyOwner {
        uint256 tokenId = tokenIdCounter++;
        _safeMint(msg.sender, tokenId);
        emit TokenCreated(msg.sender, tokenId);
    }

    // Get the base URI for metadata
    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }
}