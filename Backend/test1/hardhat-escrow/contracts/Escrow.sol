// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public buyer;
    address payable public seller;
    address public arbiter;

    enum State { AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE, REFUNDED }
    State public currentState;

    constructor(address payable _seller, address _arbiter) payable {
        buyer = msg.sender;
        seller = _seller;
        arbiter = _arbiter;
        currentState = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() public {
        require(msg.sender == buyer || msg.sender == arbiter, "Only buyer or arbiter can confirm");
        require(currentState == State.AWAITING_DELIVERY, "Invalid state");
        currentState = State.COMPLETE;
        seller.transfer(address(this).balance);
    }

    function cancelOrder() public {
        require(msg.sender == buyer || msg.sender == arbiter, "Only buyer or arbiter can cancel");
        require(currentState == State.AWAITING_DELIVERY, "Invalid state");
        currentState = State.REFUNDED;
        payable(buyer).transfer(address(this).balance);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
