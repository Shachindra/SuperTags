document.getElementById("launch-brands").addEventListener("submit", function(event) {
    validateSign();
    event.preventDefault();
});

async function validateSign() {
    let msgParams = [{
            type: 'string',
            name: $("#input1").val(),
            value: $("#value1").val()
        },
        {
            type: 'string',
            name: $("#input2").val(),
            value: $("#value2").val()
        }
    ];
    console.dir(msgParams)
}
