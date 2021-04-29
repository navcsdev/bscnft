// Account 0 0xC7636168C8967120fF5D383Cb5E2e7996C3765C9

nft = await NFTDigital.deployed()
nft.create(accounts[1], "https://game.example/item-id-8u5h2m.json")
nft.tokenURI(1)
nft.ownerOf(1)
nft.transferFrom("0x3C6a65CA50D948B4F5F6F5C5C1Be29593c809f9e", "0xC7636168C8967120fF5D383Cb5E2e7996C3765C9", 1)

bep20 = await BEP20FixedSupply.deployed()

allowance = await bep20.allowance(accounts[0], accounts[0])
allowance.toNumber()

bep20.transferFrom(accounts[0], accounts[1], 100);

bep20.transfer('0x66bD565FD62335f51EAE5CdA15AFC4cE127D5583', 100000)

balance = await bep20.balanceOf(accounts[0])
balance.toNumber()

bep20.transfer(accounts[1], 100)

simpleExchange = await SimpleExchangeNFT.deployed()

nft.approve(simpleExchange.address, 1, { from: accounts[1] })

bep20.increaseAllowance(simpleExchange.address, 100)

simpleExchange.sellToken(1, 100, { from: accounts[1] })

price = await simpleExchange.tokenPrices(1)
price.toNumber()

// d4f579382ad02ef6bbe138c4d3dc0203552b995aec20f58c6d0be68672b9bb68
// ea1488de8422f56ec3aac4a9a9b7d3361623cb22a8965470dace782cc84f88f9
// simpleExchange.sellToken(3, 20, { from: '0x662bB92A07692D5adA3D7F6b32D7C668C129B6c1' })

web3.eth.accounts.create();

simpleExchange.buyToken(1, { from: accounts[0] })

b = await simpleExchange.tokenPrices(2);

await web3.eth.getBalance(accounts[0])
await web3.eth.getBalance(accounts[1])
await web3.eth.getBalance(accounts[2])

// Local chain

nft.create("0x24b41165c110c5a8d10f4b51d4837337d79860fb", "https://game.example/item-id-8u5h2m.json")
nft.approve(simpleExchange.address, 2)
simpleExchange.sellToken(2, 100, { from: accounts[0] })
simpleExchange.buyToken(2, { from: accounts[1] })

