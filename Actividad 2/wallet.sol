/*Implemente un contrato que permita al propietario depositar y retirar ether.
Asegúrese de que solo el propietario puede retirar fondos, pero cualquiera puede
depositar.*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "No eres el propietario del contrato");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {}

    function withdraw(uint256 _amount) public onlyOwner {
        require(_amount <= address(this).balance, "No tienes suficiente ether");
        payable(owner).transfer(_amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
