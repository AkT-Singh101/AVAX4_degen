// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    // Arrays for storing game items and their prices
    string[] public gameItems;
    uint256[] public gamePrices;

    constructor(address initialOwner)
        ERC20("DegenToken", "DGN")
        Ownable(initialOwner)
    {
        // Adding game items and their prices in tokens
        gameItems.push("Excalibur");//id=0
        gameItems.push("Dragon Armor");//id=1
        gameItems.push("Magic Potion");//id=2
        gameItems.push("Hammer of Thor");//id=3

        gamePrices.push(200);// Price for Excalibur
        gamePrices.push(150);// Price for Dragon Armor
        gamePrices.push(50);// Price for Magic Potion
        gamePrices.push(300);// Price for Hammer of Thor
    }

    function redeem(uint256 itemId) public {
        require(itemId < gameItems.length, "Item does not exist");

        // Ensure the sender has enough tokens to redeem the item
        uint256 price = gamePrices[itemId];
        require(balanceOf(msg.sender) >= price, "Insufficient balance");

        // Burn tokens in exchange for the game item
        _burn(msg.sender, price);

        // Emit a log of redemption
        emit Redeemed(msg.sender, gameItems[itemId], price);
    }

    // Event to log the redemption of items
    event Redeemed(address indexed user, string item, uint256 amount);

    // Function to mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function decimals() public pure override returns (uint8) {
        return 0; 
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function getGameItem(uint256 index) public view returns (string memory) {
        require(index < gameItems.length, "Item index out of bounds");
        return gameItems[index];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "You do not have enough Degen Tokens");
        _transfer(msg.sender, recipient, amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
}
