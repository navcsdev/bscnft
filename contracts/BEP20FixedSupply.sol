// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BEP20FixedSupply is ERC20 {
    constructor() ERC20("Fixed", "BMP") {
        _mint(msg.sender, 100000000);
    }

    function decimals() public pure override returns (uint8) {
        return 2;
    }
}