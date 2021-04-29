// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/PullPayment.sol";
import "./BEP20FixedSupply.sol";

contract SimpleExchangeNFT is Ownable, PullPayment {
    event SellToken ( uint256 indexed tokenId, uint indexed price );
    event BuyToken ( address buyer, uint256 indexed tokenId, uint indexed price );
    // Mapping from token ID to price
    mapping (uint256 => uint256) public tokenPrices; 

    ERC721 public nftAddress;
    BEP20FixedSupply public bep20Token;

    constructor (address _nftAddress, address _bep20Address) {
        require(_nftAddress != address(0), "SimpleExchangeNFT: nftAddress is the zero address");
        require(_bep20Address != address(0), "SimpleExchangeNFT: bep20Address is the zero address");
        nftAddress = ERC721(_nftAddress);
        bep20Token = BEP20FixedSupply(_bep20Address);
    }

    function sellToken(uint256 tokenId, uint price) public {
        require(msg.sender != address(0) && msg.sender != address(this), "SimpleExchangeNFT: sender is the zero address");
        require(nftAddress.ownerOf(tokenId) == msg.sender, "SimpleExchangeNFT: sender is not owner ");
        tokenPrices[tokenId] = price;

        emit SellToken(tokenId, price);
    }

    function buyToken(uint256 tokenId) public {
        require(msg.sender != address(0) && msg.sender != address(this), "SimpleExchangeNFT: sender is the zero address");
        require(bep20Token.balanceOf(msg.sender) >= tokenPrices[tokenId], "SimpleExchangeNFT: amount is less than price");

        address addressSeller = nftAddress.ownerOf(tokenId);

        bep20Token.transferFrom(msg.sender, addressSeller, tokenPrices[tokenId]);

        nftAddress.safeTransferFrom(addressSeller, msg.sender, tokenId);
        delete tokenPrices[tokenId];

        emit BuyToken(msg.sender, tokenId, tokenPrices[tokenId]);
    }
}