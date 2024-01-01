// scripts/deploy.js
const { ethers } = require("hardhat");

async function main2() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying EventCertificate with the account:", deployer.address);

  const EventCertificate = await ethers.getContractFactory("EventCertificate");
  const eventCertificate = await EventCertificate.deploy(deployer.address);

  console.log("EventCertificate deployed to:", eventCertificate.address);
}

async function main() {
  const [owner] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", owner.address);
  const token = await ethers.deployContract("EventCertificate");
  console.log("Token address:", await token.getAddress());
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
