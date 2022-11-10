import { ethers } from "hardhat";

async function main() {
  const Crowdfunding = await ethers.getContractFactory("Crowdfunding");
  const crowdfunding = await Crowdfunding.deploy(
    "Test Funds",
    "Test desc",
    ethers.utils.parseEther("1"),
    "0xe38e47c5912efFFDF04537CB1eE8E73CD4C4e5Fd"
  );

  await crowdfunding.deployed;

  console.log(`The contract was deployed to ${crowdfunding.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
