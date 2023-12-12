# Task: Create a Simple Ethereum NFT Contract

**Objective**: Develop a basic Ethereum smart contract that represents a non-fungible token (NFT). Each token should have unique properties, and users should be able to own, transfer, and inquire about their NFTs.

**Tools Needed:** 
1. Remix IDE (or your preferred Solidity development environment)
2. Ethereum Wallet (e.g., MetaMask)
3. Optionally, Truffle framework for local development and testing

**Steps:**
1. Set up your development environment
  Ensure you have Remix IDE installed and configured. Connect Remix to your Ethereum wallet (e.g., MetaMask) to deploy and interact with the smart contract.

2. Write the NFT Smart Contract
  ```solidity
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

      constructor(string memory _name, string memory _symbol, string memory _baseTokenURI) ERC721(_name, _symbol) {
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
  ```
  This simple contract uses the OpenZeppelin ERC721 and Ownable contracts to create a basic NFT. It allows the owner to mint new tokens, and each token has a unique ID.

3. Compile and Deploy the Smart Contract
  - Use Remix IDE or your preferred Solidity development environment to compile the smart contract.
  - Deploy the smart contract to your chosen Ethereum network (e.g., Rinkeby, Ropsten) using your connected wallet.

4. Mint NFTs
  - After deployment, use the mint function to create new NFTs. Only the owner (address that deployed the contract) can mint tokens.

5. Interact with the NFTs
  - Use Ethereum wallet interfaces or dApps to view your NFTs, transfer them, and explore their metadata.
  - You can use Frontend library like React, Vue, Angular or just HTML, CSS and JavaScript (Vanilla)

6. Fork this repository and Upload into your own Github Repositories