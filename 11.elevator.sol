// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface Elevator {
  function goTo(uint _floor) external;
}

contract Building {
    bool isIt;

    function goTop(Elevator elevator) public {
        isIt = false;
        elevator.goTo(0);
    }

    function isLastFloor(uint) external returns (bool res) {
        res = isIt;
        isIt = true;
    }
}
