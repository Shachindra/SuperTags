const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const tagNFTId = urlParams.get('tagNFTId')
console.log("SuperTag NFT ID: ", tagNFTId);

if(tagNFTId==1) {
    let metadata = `{
        "name": "ETHIndia by ETHGlobal Event | Hackers Paradise",
        "description": "Building our decentralized future. Hackathons teach new skills, strengthen developer communities, and push the limits of new technologies. At ETHGlobal, we're leveraging our years of experience to foster a world-class ecosystem of Ethereum developers and entrepreneurs!",
        "superTagId": "04B0A56A5F7080",
        "external_url": "https://ethglobal.com",
        "image": "ipfs://bafybeieqjcpks5prgy55k5j5sic53twls67a7nmiqpxk2fzl6ilg3x7woa",
        "attributes": [
            {
                "trait_type": "Event",
                "value": "ETHIndia"
            },
            {
                "trait_type": "Description",
                "value": "Building The Frontier Together at the World's Biggest Ethereum Hackathon!"
            },
            {
                "trait_type": "Location",
                "value": "Bangalore, India"
            }
        ]
    }`
    let metadataObj = JSON.parse(metadata);
    let array = metadataObj.image.split("ipfs://");
    let cid = array.pop();
    let imageURL = "https://nftstorage.link/ipfs/"+cid
    document.getElementById("image").src = imageURL;
    document.getElementById("name").innerHTML = metadataObj.name;
    document.getElementById("description").innerHTML = metadataObj.description;
    document.getElementById("name").innerHTML = metadataObj.name;
    document.getElementById("trait1").innerHTML = metadataObj.attributes[0].trait_type;
    document.getElementById("value1").innerHTML = metadataObj.attributes[0].value;
    document.getElementById("trait2").innerHTML = metadataObj.attributes[1].trait_type;
    document.getElementById("value2").innerHTML = metadataObj.attributes[1].value;
    document.getElementById("trait3").innerHTML = metadataObj.attributes[2].trait_type;
    document.getElementById("value3").innerHTML = metadataObj.attributes[2].value;
}
else if(tagNFTId==2) {
    let metadata = `{
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
    let metadataObj = JSON.parse(metadata);
    let array = metadataObj.image.split("ipfs://");
    let cid = array.pop();
    let imageURL = "https://nftstorage.link/ipfs/"+cid
    document.getElementById("image").src = imageURL;
    document.getElementById("name").innerHTML = metadataObj.name;
    document.getElementById("description").innerHTML = metadataObj.description;
    document.getElementById("name").innerHTML = metadataObj.name;
    document.getElementById("trait1").innerHTML = metadataObj.attributes[0].trait_type;
    document.getElementById("value1").innerHTML = metadataObj.attributes[0].value;
    document.getElementById("trait2").innerHTML = metadataObj.attributes[1].trait_type;
    document.getElementById("value2").innerHTML = metadataObj.attributes[1].value;
    document.getElementById("trait3").innerHTML = metadataObj.attributes[2].trait_type;
    document.getElementById("value3").innerHTML = metadataObj.attributes[2].value;
}
else if(tagNFTId>2 && tagNFTId<10) {
    let metadata = `{
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
    let metadataObj = JSON.parse(metadata);
    let array = metadataObj.image.split("ipfs://");
    let cid = array.pop();
    let imageURL = "https://nftstorage.link/ipfs/"+cid
    document.getElementById("image").src = imageURL;
    document.getElementById("name").innerHTML = metadataObj.name;
    document.getElementById("description").innerHTML = metadataObj.description;
    document.getElementById("name").innerHTML = metadataObj.name;
    document.getElementById("trait1").innerHTML = metadataObj.attributes[0].trait_type;
    document.getElementById("value1").innerHTML = metadataObj.attributes[0].value;
    document.getElementById("trait2").innerHTML = metadataObj.attributes[1].trait_type;
    document.getElementById("value2").innerHTML = metadataObj.attributes[1].value;
    document.getElementById("trait3").innerHTML = metadataObj.attributes[2].trait_type;
    document.getElementById("value3").innerHTML = metadataObj.attributes[2].value;
}
else {
    let metadata = `{
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
    let metadataObj = JSON.parse(metadata);
    let array = metadataObj.image.split("ipfs://");
    let cid = array.pop();
    let imageURL = "https://nftstorage.link/ipfs/"+cid
    document.getElementById("image").src = imageURL;
    document.getElementById("name").innerHTML = metadataObj.name;
    document.getElementById("description").innerHTML = metadataObj.description;
    document.getElementById("name").innerHTML = metadataObj.name;
    document.getElementById("trait1").innerHTML = metadataObj.attributes[0].trait_type;
    document.getElementById("value1").innerHTML = metadataObj.attributes[0].value;
    document.getElementById("trait2").innerHTML = metadataObj.attributes[1].trait_type;
    document.getElementById("value2").innerHTML = metadataObj.attributes[1].value;
    document.getElementById("trait3").innerHTML = metadataObj.attributes[2].trait_type;
    document.getElementById("value3").innerHTML = metadataObj.attributes[2].value;
}


document.getElementById("chat").addEventListener("click", function(event) {
    var myHeaders = new Headers();
// myHeaders.append("ngrok-skip-browser-warning", "true");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({
  "model": "llama2",
  "prompt": document.getElementById('prompt').value,
  "stream": false
});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://c83d-14-195-9-98.ngrok-free.app/", requestOptions)
  .then(response => response.text())
  .then(result => document.getElementById("result").innerHTML = JSON.parse(result).response)
  .catch(error => console.log('error', error));
  event.preventDefault();
});
