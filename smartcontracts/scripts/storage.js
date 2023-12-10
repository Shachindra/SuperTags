import lighthouse from '@lighthouse-web3/sdk'
require("dotenv").config();

const text = `{
    "name": "Scallop Cap | Sports Headwear",
    "description": "Experience the future of athletic gear with our NFC-integrated sportswear, merging cutting-edge technology with fitness to track performance, access personalized training tips, and connect with a community of athletes.!",
    "superTagId": "04B0A66A5F7080",
    "external_url": "https://scallopcap.com",
    "image": "ipfs://bafybeibrw35jzt5xed4sxnrvsirclu2zt3zarbg3fckk7ymp6kz7fynpru",
    "attributes": [
        {
            "trait_type": "Product",
            "value": "Cap"
        },
        {
            "trait_type": "Description",
            "value": "Experience the future of athletic gear with our NFC-integrated Cap"
        },
        {
            "trait_type": "Color",
            "value": "Black"
        },
        {
            "trait_type": "Price",
            "value": "$10 USD"
        }
    ]
}`
const apiKey = "api-key"
const name = "shachindra" //Optional

const response = await lighthouse.uploadText(text, apiKey, name)

console.log(response)