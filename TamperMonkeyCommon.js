console.log("Starting loading TamperMonkeyCommon.js...");

function sendMail(subject, html) {
    $.ajax({
        type: 'POST',
        url: 'https://mandrillapp.com/api/1.0/messages/send.json',
        data: {
            'key': 'N2og6X--ZIva2YjNPIsfSg',
            'message': {
                'from_email': 'gqy117@gmail.com',
                'to': [{
                    'email': 'gqy117@gmail.com',
                    'name': 'gqy117',
                    'type': 'to'
                }],
                'autotext': 'true',
                'subject': subject,
                'html': "'" + html + "'"
            }
        }
    }).done(function(response) {
        console.log(response); // if you're into that sorta thing
    });
}

function removeSpace(actual) {
    return actual ? actual.replace(/\s+/g, '') : actual;
}

function isStatusChanged(filteredActual, expected) {
    return (filteredActual && filteredActual !== expected);
}

function isInArray(filteredActual, expected) {
    return (filteredActual && $.inArray(filteredActual, expected));
}

function sendEmailOnChanged(actual, filteredActual, expected, subject, html) {
    if(!filteredActual){
        console.log("filteredActual is null");
        sendMail(subject, "filteredActual is null");
    }

    if (isStatusChanged(filteredActual, expected)) {
        var newHtml = html ? html : actual;
        sendMail(subject, newHtml);
    }

    console.log("actual:" + actual);
    console.log("filteredActual:" + filteredActual);
    console.log("expected:" + expected);
}

console.log("Ending loading TamperMonkeyCommon.js...");
