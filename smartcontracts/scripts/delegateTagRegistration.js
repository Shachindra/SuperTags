const { ethers, contract } = require("hardhat")
const fs = require("fs")
const { json } = require("node:stream/consumers")

async function main() {
    
    const scripts = `scripts/delegateTagRegistration.json`
    const data = fs.readFileSync(scripts, "utf8")
    const jsonContent = JSON.parse(data)

    const accounts = await ethers.getSigners();
    
    const creatorAddress = jsonContent.creatorAddress
    const metadataUrl = jsonContent.metadataUrl

    console.log(creatorAddress, metadataUrl)
    /// fetching the abi
    const contractArtifact = await artifacts.readArtifact("SuperTags")

    const contract = new ethers.Contract(
        "0x6F593616C773472ea50a4ba3124cFD6A2eB3a803",
        contractArtifact.abi,
        accounts[0]
    )

    const transactionResponse = await contract.delegateTagRegistration(
        creatorAddress,
        metadataUrl
    )

    const transactionReceipt = await transactionResponse.wait()

    if (transactionReceipt.status === 1) {
        console.log("Transaction successful", transactionReceipt)
    } else {
        console.log("Transaction failed")
    }
}

// main
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })