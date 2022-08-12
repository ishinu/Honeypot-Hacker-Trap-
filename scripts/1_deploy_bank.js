const { ethers } = require("hardhat");

async function main(){
    console.log("Deploying Bank contract...");
    const Bank = await ethers.getContractFactory("Bank");
    const bank = await Bank.deploy();
    await bank.deployed();
    console.log("Bank contract deployed at : ",bank.address);

    console.log("Deploying Attack contract...");
    const Attack = await ethers.getContractFactory("Attack");
    const attack = await Attack.deploy();
    await attack.deployed();
    console.log("Attack contract deployed at : ",attack.address);
}

main();