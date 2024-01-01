const { ethers } = require("hardhat");

async function Exec (){
  const [owner, addr1, addr2, addr3] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", owner.address);
  const Token = await ethers.getContractFactory("TokenUNS"); // Get the contract factory, it means that we can deploy the contract
  const hardhatToken = await Token.deploy(); // Deploy the contract, it means it will be deployed on the blockchain
  const ownerBalance = await hardhatToken.balanceOf(owner.address);
  console.log(ownerBalance.toString(), "Balance of owner")
  const addres1 = addr1.address;
  const addres2 = addr2.address;
  const addres3 = addr3.address;

  const balanceofOwner = await hardhatToken.balanceOf(owner.address); //500
  const address1Balance = await hardhatToken.balanceOf(addres1); //0
  console.log("balance of the owner", balanceofOwner)
  console.log("balance of addres 1", address1Balance)

  await hardhatToken.transfer(addres1, 50);

  const balanceofOwnerAfterTransfer = await hardhatToken.balanceOf(owner.address); //450
  const address1BalanceAfterTransfer = await hardhatToken.balanceOf(addres1); //50
  
  console.log("balance of the owner", balanceofOwnerAfterTransfer)
  console.log("balance of addres 1", address1BalanceAfterTransfer)
}

Exec()