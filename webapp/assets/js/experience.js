const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const tagNFTId = urlParams.get('tagNFTId')
console.log("SuperTag NFT ID: ", tagNFTId);

var myHeaders = new Headers();
myHeaders.append("ngrok-skip-browser-warning", "true");
myHeaders.append("Content-Type", "application/json");

var raw = JSON.stringify({
  "model": "llama2",
  "prompt": "When were you created",
  "stream": false
});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("https://49c3-14-195-9-98.ngrok-free.app/api/generate", requestOptions)
  .then(response => response.text())
  .then(result => console.log(result))
  .catch(error => console.log('error', error));

document.getElementById("main").addEventListener("submit", function(event) {
    validateSign();
    event.preventDefault();
});

async function validateSign() {
    const queryString = window.location.search;
    console.log(queryString);
    let message = $("#message").val();
    let passphrase = $("#passphrase").val();
    let formattedMessage = web3.utils.utf8ToHex(message);
    let signature = await doPersonalSign(formattedMessage, coinbase, passphrase);
    $("#signature").html(signature);
    $("#formResult").show();
}

function doPersonalSign(formattedMessage, from, passphrase) {
    return new Promise(resolve => {
        web3.eth.personal.sign(formattedMessage, from, passphrase, (error, result) => {
            if (!error) {
                console.log("Signed: " + result);
                resolve(result);
            } else {
                resolve(error);
            }
        });
    });
}

$(".toggle-password").click(function() {
    $(this).toggleClass("fa-eye fa-eye-slash");
    var input = $($(this).attr("toggle"));
    if (input.attr("type") == "password") {
        input.attr("type", "text");
    } else {
        input.attr("type", "password");
    }
});