// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract NaughtyCoin {
    function takeThem(IERC20 token) public {
        token.transferFrom(msg.sender, address(this), token.balanceOf(msg.sender));
    }
}
