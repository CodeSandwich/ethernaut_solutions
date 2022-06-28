// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PuzzleAdmin {
    address public pendingAdmin;
    address public admin;

    function becomeAdmin() public {
        admin = msg.sender;
    }
}
