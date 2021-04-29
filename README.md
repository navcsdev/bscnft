# Contracts on Testnet:

- SimpleExchangeNFT https://testnet.bscscan.com/address/0x4F2B42b1D055506DD7b170F9992286f5c167f4EE

- NFTDigital https://testnet.bscscan.com/address/0xeca2a36db6fec3f0655e525a1ece0d4f5d91f34a

- BEP20FixSupply https://testnet.bscscan.com/address/0xbDB02873Ad9768F97a8E5B31b7d886283fACD91D

# How to create NFT use contract NFTDigital

Call the method create

Full API https://docs.openzeppelin.com/contracts/4.x/api/token/erc20

# How to sell NFT use contract SimpleExchange

1/ Call method approve of contract NFTDigital to contract SimpleExchange can
transfer the NFT

2/ Call method increaseAllowance of contract BEP20FixSupply to allowance
contract SimpleExchange can transfer BEP20 token BMP

3/ Call method sellToken of contract SimpleExchange to sell NFT with price by
BMP token

# How to buy NFT use contract SimpleExchange

Call method buyToken of contract SimpleExchange

# How to add BSC testnet to metamask

https://docs.google.com/document/d/1jB1sF7ZYYVzDube0rgiEFNbgYme8Vi0ikFZZmAudlwY/edit?usp=sharing

# Demo on BSC Testnet

https://docs.google.com/document/d/1xpuaUjq3TbkYyxNV0PKldQGFFQPnFAcmDH703zqTIlo/edit?usp=sharing