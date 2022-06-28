// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// contract NonZero {
//     constructor() payable {
//         require(msg.value != 0, "VALUE ZERO");
//     }
// }

contract King {
    function take(address payable king) public payable {
        require(msg.value != 0, "VALUE ZERO");
        (bool success,) = king.call{value: msg.value}("");
        require(success, "failed");
    }
}
