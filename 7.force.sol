// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Force {
    constructor(address payable forced) payable {
        selfdestruct(forced);
    }
}
