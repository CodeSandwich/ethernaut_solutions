// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface Shop {
    function buy() external;
}


contract Buyer {
    uint private baseOffer = 100;

    function buy(Shop shop) public {
        shop.buy();
    }

    function price() external view returns (uint offer) {
        uint gasUsed = gasleft();
        offer = baseOffer;
        gasUsed -= gasleft();
        if(gasUsed < 1000) offer = 0;
    }
}
