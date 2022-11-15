// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Crowdfunding {
    bool private accomplished = false;
    uint private target;
    string private title;
    string private description;
    address payable private toAddr;

    constructor(
        string memory _title,
        string memory _description,
        uint _target,
        address payable _toAddr
    ) payable {
        title = _title;
        description = _description;
        target = _target;
        toAddr = _toAddr;
        accomplished = false;
    }

    // Getters
    function isAccomplished() public view returns (bool) {
        return accomplished;
    }
    function getTitle() public view returns (string memory) {
        return title;
    }
    function getDescription() public view returns (string memory) {
        return description;
    }
    function getToAddress() public view returns (address) {
        return toAddr;
    }
    function getTarget() public view returns (uint) {
        return target;
    }

    receive() external payable {}

    function withdraw() public {
        require(target <= address(this).balance, "insufficient balance to withdraw");
		toAddr.transfer(address(this).balance);
    }
}
