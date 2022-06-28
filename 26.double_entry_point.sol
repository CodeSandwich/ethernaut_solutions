// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Notifier {
    fallback() external payable {
        msg.sender.call(abi.encodeWithSignature('raiseAlert(address)', tx.origin));
    }
}
