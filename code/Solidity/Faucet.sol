// SPDX-License-Identifier: CC-BY-SA-4.0

// Version of Solidity compiler this program was written for
pragma solidity 0.8.19;

// Our first contract is a faucet!
contract Faucet {
    // Accept any incoming amount
    receive() external payable {
        // do nothing
    }
    // contracts can have one such no-name receive function, and it is used to receive Ether.
    // This is why it is external and payable, meaning it can accept ether into the contract.


    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // Limit withdrawal amount
        require(withdraw_amount <= 100000000000000000); // amount measured in wei
        // require() is a built-in Solidity function used to test a precondition

        // Send the amount to the address that requested it
        payable(msg.sender).transfer(withdraw_amount);
        // msg object is one of the inputs that all contracts can access.
        // It represents the transaction that triggered the exectution of the contract.
        // The attribute, sender, is the sender address of the transaction.
        // transfer() is abuilt in function that transfersether from the current contract to the address of the sender.
        // "transfer to the sender of the msg that triggered this contract execution"
    }
}

// Registering a contract on the blockchain 
// involves creating a special transaction whose destination is the address 0x0000000000000000000000000000000000000000, 
// also known as the zero address.


/* 
To compile via command line:

solc <path_to_sol_file>.sol

We use the --bin and --optimize arguments of solc to produce an optimized binary of our example contract:

solc --optimize --bin Faucet.sol

To produce the ABI for our Faucet.sol example contract:

solc --abi Faucet.sol

The ABI defines how data structures and functions are accessed in machine code.
All that is needed for an application to interact with a contract is an ABI and the address where the contract has been deployed.
*/
