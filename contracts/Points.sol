// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Degen_token {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
        // 1
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Redeem(address indexed from, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    address public owner;

    struct Product {
        string name;
        bool redeemed;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }

    constructor() {
        name = "Degen";
        symbol = "DGN";
        decimals = 0;
        totalSupply = 2000 * (10**uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
        emit Transfer(address(0), msg.sender, totalSupply);

        // Initialize the products
        products[0] = Product("Ape NFT", false);
        products[1] = Product("CR7 NFT", false);
        products[2] = Product("100$ Trading fee Voucher", false);
        productCount = 3;
    }
        // 2
    function transfer (address _to, uint256 _value) external returns (bool) {
        require(_to != address(0), "Invalid recipient");
        require(_value <= balanceOf[msg.sender], "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

        // 3
    function mint(address _to, uint256 _value) external onlyOwner returns (bool) {
        totalSupply += _value;
        balanceOf[_to] += _value;
        emit Mint(_to, _value);
        return true;
    }
        // 4
    function burn(uint256 _value) external returns (bool) {
        require(_value <= balanceOf[msg.sender], "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }
        
    
        // 5
    function redeemProduct(uint256 _productId) external returns (bool) {
        require(_productId < productCount, "Invalid product ID");
        require(!products[_productId].redeemed, "Product already redeemed");

        products[_productId].redeemed = true;
        return true;
    }
    
    function isProductRedeemed(uint256 _productId) external view returns (bool) {
        require(_productId < productCount, "Invalid product ID");

        return products[_productId].redeemed;
    }
    function getProductCount() external view returns (uint256) {
        return productCount;
    }

    
}
