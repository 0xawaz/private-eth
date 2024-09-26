// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZamaETHTransfer {

    // Event to log the transfer
    event TransferETH(address indexed from, address indexed to, uint256 amount);

    // Function to transfer ETH from this contract to a recipient
    function transferETH(address payable recipient, uint256 amount) public {
        // Ensure the contract has enough balance to send
        require(address(this).balance >= amount, "Insufficient contract balance.");

        // Transfer the specified amount of ETH
        recipient.transfer(amount);

        // Emit event
        emit TransferETH(msg.sender, recipient, amount);
    }

    // Function to receive ETH into the contract
    receive() external payable {}
}
