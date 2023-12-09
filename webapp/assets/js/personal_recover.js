document.getElementById("personal_recover").addEventListener("submit", function(event) {
    validateRecover();
    event.preventDefault();
});

async function validateRecover() {
    let message = $("#message").val();
    let account = await doSomething();
}

function doSomething(message, signature) {
    return new Promise(resolve => {
        
    });
}