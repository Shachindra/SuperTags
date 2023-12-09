$.ajax({
    url: "https://base-goerli.blockscout.com/api?module=token&action=getTokenHolders&contractaddress=0x6F593616C773472ea50a4ba3124cFD6A2eB3a803",
    type: "GET",
    success: function (data) {
      console.log(data.result[0]);
    }
  });

document.getElementById("engaging-events").addEventListener("submit", function(event) {
    // validateSign();
    event.preventDefault();
});