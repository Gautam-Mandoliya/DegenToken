# DegenToken
The `Degen_token` is a Solidity smart contract that represents a token contract for a decentralized application (DApp). It is designed to be used as part of a blockchain-based system.
### Purpose
The purpose of this contract is to provide functionalities for managing and interacting with a token called "Degen" (symbol: "DGN"). It allows users to transfer tokens, mint new tokens, burn existing tokens, and redeem associated products.

## Description
### Features
Token `Transfer`: Users can transfer tokens from one address to another using the transfer function.
Token `Minting`: The contract owner can create new tokens and assign them to a specific address using the mint function.
Token `Burning`: Users can burn their own tokens, reducing their balance and the total token supply.
`Product Redemption`: The contract supports the redemption of associated products. Users can redeem specific products by calling the redeemProduct function.
Event Notifications: The contract emits various events, including `Transfer`, `Redeem`, `Mint`, and `Burn`, to provide notifications for token transfers, product redemptions, minting, and burning.
### Usage
The contract can be deployed on a compatible blockchain network. Once deployed, users can interact with the contract by calling its functions to perform token transfers, minting, burning, and product redemption.

Please refer to the contract code for detailed information about each function and their parameters.

# Installation

Clone the repository to vs code-->
1. After cloning run command: ` npm init -y `
2. For compilation and deplyment of contract on fuji test network, run: npx hardhat run scripts/mint.js --network fuji
 
`You should see a printout in the console similar to this:`
npx hardhat run scripts/mint.js --network fuji

Points token deployed to -YOUR TOKEN ADDRESS-

3. Then paste -YOUR TOKEN ADDRESS- on `snowtrace`(Testnet).
4. Remix Deployment:

-Open Remix, an online Solidity IDE.

-Copy and paste the "Degen_token" contract code into a new file in Remix.

-Compile the contract by selecting the appropriate compiler version (Solidity 0.8.18).

-Choose the "Injected Provider-Metamask" environment in the Remix environment dropdown.

-Compile the contract.

-Take note of the contract address provided by `Snowtrace`.

-Paste -YOUR TOKEN ADDRESS- into `At Address` field under Deploy button and hit enter. 

*Now everything is connected and good to go for tesing*


