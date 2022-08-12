// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Bank {
    mapping(address=>uint) public balances;
    bool private reEntrant;

    modifier catchHacker(){
        require(reEntrant,"Hacker caught!");
        _;
    }

    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw() public payable catchHacker{
        reEntrant = true;
        uint amount = balances[msg.sender];
        require(amount>0);
        (bool sent,) = msg.sender.call{value:amount}("");
        require(sent,"Failed to send Ether.");
        balances[msg.sender] = 0;
    }

    function getBalances() view public returns(uint){
        return address(this).balance;
    }
}
