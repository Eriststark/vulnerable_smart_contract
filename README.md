# Vulnerable Smart Contract Example

This repository contains a vulnerable smart contract and an exploit contract that demonstrates a vulnerability due to improper function visibility.

## Files

- `VulnerableContract.sol`: The vulnerable contract that exposes an external function meant for ExploitContract.
- `ExploitContract.sol`: The contract that exploits the vulnerability in VulnerableContract.

## Prerequisites

- [Node.js](https://nodejs.org/)
- [Truffle](https://www.trufflesuite.com/truffle)
- [Ganache](https://www.trufflesuite.com/ganache)

## Setup

(bash instructions)

1. Install Truffle and Ganache globally if you haven't already:

    - npm install -g truffle ganache-cli

2.  Clone this repository:
    
    - git clone <repository_url>
    - cd <repository_directory>

3.  Install dependencies:

    - npm install


4.  Compile Contracts. Run the following command to compile the contracts:

    - truffle compile

5.  Deploy Contracts
    1.  Start Ganache CLI in a separate terminal:
        - ganache-cli
    2.  Deploy the contracts to the local blockchain:
        - truffle migrate --reset
   
6.  Test Exploit
    1.  Open the Truffle console:
        - truffle console
    2.  Interact with contracts:

```
//javascript code
// Get instance of VulnerableContract
let vulnerableInstance;
VulnerableContract.deployed().then(instance => vulnerableInstance = instance);

// Get instance of ExploitContract
let exploitInstance;
ExploitContract.deployed().then(instance => exploitInstance = instance);

// Check initial storedData value in VulnerableContract
vulnerableInstance.storedData().then(result => console.log("Initial storedData:", result.toNumber()));

// Exploit to reset storedData via ExploitContract
exploitInstance.resetStoredData();

// Check storedData after exploit
vulnerableInstance.storedData().then(result => console.log("StoredData after exploit:", result.toNumber()));

```


    iii. The ExploitContract is able to reset the storedData in VulnerableContract by calling the resetStoredData() function, even though it is marked as external and intended for ExploitContract only.


## Additional Notes

- Ensure proper access control and visibility settings in your contracts to avoid unintended vulnerabilities like this example.
- Always thoroughly test your contracts, especially for potential security vulnerabilities.

