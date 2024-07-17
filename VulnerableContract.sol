// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ExploitContract.sol";

contract VulnerableContract {
    uint256 public storedData;
    ExploitContract public exploitContract;

    constructor(address _exploitAddress) {
        exploitContract = ExploitContract(_exploitAddress);
    }

    // Public function allows external access
    function setStoredData(uint256 _data) external {
        storedData = _data;
    }

    // External function that is meant to be vulnerable and accessible to ExploitContract
    function resetStoredData() external {
        require(msg.sender == address(exploitContract), "Caller is not ExploitContract");
        storedData = 0;
    }

    // Function that calls an exploit function in ExploitContract
    function callExploit() external {
        exploitContract.exploitFunction();
    }

    // Function that calls increaseStoredData in ExploitContract
    function callIncreaseStoredData() external {
        exploitContract.increaseStoredData();
    }

    // Function that calls resetStoredData in ExploitContract
    function callResetStoredData() external {
        exploitContract.resetStoredData();
    }
}

