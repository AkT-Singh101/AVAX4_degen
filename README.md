# DEGEN-TOKEN
The DegenToken is an ERC20 token deployed on the Avalanche Fuji Testnet. This smart contract allows users to mint, transfer, burn, and redeem tokens(in exchange for game items) .The token is designed for use within gaming environments, where players can redeem game items using their Degen Tokens.

## Description
DegenToken is an ERC20-compliant token built on the Ethereum blockchain. The contract allows users to mint tokens, transfer them between accounts, burn tokens when redeeming them for game items, and check their token balance. The primary function of the token is for redeeming various game items such as weapons, armor, and potions within a game.

### **Features:**
- **Minting**: Only the contract owner can mint new tokens.
- **Burnable**: Tokens can be burned when they are redeemed for game items.
- **Transferable**: Users can transfer tokens between their accounts.
- **Redeemable**: Users can exchange tokens for game items at predefined prices. User can also see the items redeemed by an account

### **Game Items Available for Redemption:**
1. Excalibur (100 DGN)
2. Dragon Armor (200 DGN)
3. Magic Potion (50 DGN)
4. Hammer of Thor (300 DGN)

## Getting Started

### Prerequisites:
- **Remix IDE**: Open Remix IDE at [Remix.ethereum.org](https://remix.ethereum.org).
- **MetaMask**: Install the MetaMask browser extension and set up a wallet.
- **Avalanche Fuji Testnet**: Add Avalanche Fuji Testnet to your MetaMask wallet using the details provided below.

### Executing Program:
1. **Compile the Contract**:
   - Open Remix IDE.
   - Create a new file and paste the DegenToken Solidity contract code.
   - Compile the code and ensure it is error-free.

2. **Setup MetaMask**:
   - Install the MetaMask extension and create/import a wallet.
   - Add Avalanche Fuji Testnet as a custom network (details below).
   - Get free AVAX for gas fees using a faucet (link provided below).

3. **Deploy the Contract**:
   - Go to the **Deploy & Run Transactions** tab in Remix.
   - Select **Injected Web3** as the environment to connect with MetaMask.
   - Deploy the contract and confirm the transaction in MetaMask.
   - Use SnowTrace (Testnet) to verify the contract and view transactions.

4. **Interact with the Contract**:
   - Mint tokens by calling the `mint()` function (owner only).
   - Transfer tokens to other users using `transfer()`.
   - Redeem game items with `redeem()` by passing the item ID.

### Avalanche Fuji Testnet Setup:
To add the Avalanche Fuji Testnet to MetaMask, use the following network details:
1. **Network Name**: Avalanche Fuji C-Chain
2. **RPC URL**: `https://api.avax-test.network/ext/bc/C/rpc`
3. **Chain ID**: `43113`
4. **Currency Symbol**: AVAX
5. **Explorer URL**: [https://testnet.snowtrace.io/](https://testnet.snowtrace.io/)

## Author:
ANKIT SINGH
(mail:`superakt2003@gmail.com`)


