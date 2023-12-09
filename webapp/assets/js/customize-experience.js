document.getElementById("customize-experience").addEventListener("submit", function(event) {
    validateSign();
    event.preventDefault();
});

// from https://docs.metamask.io/guide/signing-data.html#sign-typed-data-v4
async function validateSign() {

    let from = coinbase;

    let params = [from, msgParams];

}