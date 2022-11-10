// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Crowdfunding {
    bool accomplished = false;
    uint target;
    string title;
    string description;
    address toAddr;

    constructor(string memory _title, string memory _description, uint _target, address _toAddr) payable {
        title = _title;
        description = _description;
        target = _target;
        toAddr = _toAddr;
        accomplished = false;
    }

    function checkComplete() private returns (bool) {
        if (address(this).balance >= target) {
            payable(toAddr).transfer(address(this).balance);
            accomplished = true;
            return true;
        }
        return false;
    }

    receive() external payable {
        require(!accomplished, "This crowdfunding has alredy been accomplished.");
        checkComplete();
    }
}
