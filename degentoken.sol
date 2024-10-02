// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    struct GameItem {
        string name;
        uint256 price;
    }
    
    GameItem[] private _gameItems;
    
    // Mapping to keep track of redeemed items for each user
    mapping(address => mapping(uint256 => uint256)) public redeemedItems;

    constructor(address initialOwner)
        ERC20("DegenToken", "DGN")
        Ownable(initialOwner)
    {
        // Adding game items and their prices in tokens
        _gameItems.push(GameItem("Excalibur", 200));
        _gameItems.push(GameItem("Dragon Armor", 150));
        _gameItems.push(GameItem("Magic Potion", 50));
        _gameItems.push(GameItem("Hammer of Thor", 300));
    }

    function redeem(uint256 itemId) public {
        require(itemId < _gameItems.length, "Item does not exist");
        uint256 price = _gameItems[itemId].price;
        require(balanceOf(msg.sender) >= price, "Insufficient balance");

        // Burn tokens in exchange for the game item
        _burn(msg.sender, price);

        // Record the redemption
        redeemedItems[msg.sender][itemId]++;

        // Emit a log of redemption
        emit Redeemed(msg.sender, _gameItems[itemId].name, price);
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

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "You do not have enough Degen Tokens");
        _transfer(msg.sender, recipient, amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function getAvailableItems() public view returns (string[] memory) {
        string[] memory items = new string[](_gameItems.length);
        for (uint i = 0; i < _gameItems.length; i++) {
            items[i] = string(abi.encodePacked(
                "ID: ", uint2str(i), " - ",
                _gameItems[i].name, " -> ",
                uint2str(_gameItems[i].price)
            ));
        }
        return items;
    }

    function getInventory(address user) public view returns (string[] memory) {
        string[] memory inventory = new string[](_gameItems.length);
        for (uint i = 0; i < _gameItems.length; i++) {
            inventory[i] = string(abi.encodePacked(
                "ID: ", uint2str(i), " - ",
                _gameItems[i].name, " -> ",
                uint2str(redeemedItems[user][i])
            ));
        }
        return inventory;
    }

    // Helper function to convert uint to string
    function uint2str(uint256 _i) internal pure returns (string memory str) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        str = string(bstr);
    }
}
