require("dotenv").config();

require("@nomicfoundation/hardhat-toolbox")
require("@nomiclabs/hardhat-truffle5");
require("hardhat-gas-reporter");
require("solidity-coverage");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// API_KEY & PRIVATE_KEY
const SCROLLSEPOLIA_RPC_URL = process.env.SCROLLSEPOLIA_RPC_URL || "https://sepolia-rpc.scroll.io"
const ZKEVMTESTNET_RPC_URL = process.env.ZKEVMTESTNET_RPC_URL || "https://rpc.public.zkevm-test.net"
const MNEMONIC = process.env.MNEMONIC || "mnemonic"
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || "PolygonScan API key"
// const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || "Etherscan API key"

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      initialBaseFeePerGas: 0, // workaround from https://github.com/sc-forks/solidity-coverage/issues/652#issuecomment-896330136 . Remove when that issue is closed.
    },
    scrollsepolia: {
      url: SCROLLSEPOLIA_RPC_URL,
      accounts: {
        mnemonic: MNEMONIC,
      },
    },
    ZKEVMTESTNET: {
      url: ZKEVMTESTNET_RPC_URL,
      //accounts: [`0x${ETH_PRIVATE_KEY}`],
      accounts: {
        mnemonic: MNEMONIC,
      },
    },
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 20000
  }
};