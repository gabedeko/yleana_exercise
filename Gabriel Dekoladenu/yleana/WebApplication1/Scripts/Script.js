
/*~~~~~~~~~~~~~~~~~~~~~~~~Visual JQuery~~~~~~~~~~~~~~~~~~~~~~~~*/
$(document).ready(function () {
    $("#confirm_message").hide();
    $("#customer_table").hide();
    $("#Button2").hide();

    $("#Button1").click(function () {
        $("#Button1").hide();
        $("#Button2").show();
        $("#customer_table").show();
        return false;
    });

    $("#Button2").click(function () {
        $("#Button2").hide();
        $("#Button1").show();
        $("#customer_table").hide();
        return false;
    });

    //For restricting ID to numeric values only
    jQuery('.numbersOnly').keyup(function () {
        this.value = this.value.replace(/[^0-9\.]/g, '');
    });

    $(document).ready(function () {
        $("#customer_table").removeClass("hidden"); /*for hiding on page load */
        $("#Button2").removeClass("hidden"); /*for hiding on page load */
    });
});
/*~~~~~~~~~~~~~~~~~~~~~~~~End Visual JQuery~~~~~~~~~~~~~~~~~~~~~~~~*/
/*~~~~~~~~~~~~~~~~~~~~~~~~Database Fetching~~~~~~~~~~~~~~~~~~~~~~~~*/
$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        async: false,
        url: "WebForm1.aspx/PopulateDropDownList",
        data: "{}",
        dataType: "json",
        success: function OnSuccess(response) {
            for (var i = 0; i < response.d.length; i++) {
                $("#customer_table").append("<tr><td>" + response.d[i].CustomerId + "</td><td>"
                    + response.d[i].CustomerName + "</td><td>" + response.d[i].ContactName + "</td><td>"
                    + response.d[i].Address + "</td><td>"
                    + response.d[i].City + "</td><td>" + response.d[i].PostalCode + "</td><td>"
                    + response.d[i].Country + "</td></tr>");
        }
        },
        //called on jquery ajax call failure
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });
});
/*~~~~~~~~~~~~~~~~~~~~~~~~ENd Database Fetching~~~~~~~~~~~~~~~~~~~~~~*/
/*~~~~~~~~~~~~~~~~~~~~~~~~Knockout Validation~~~~~~~~~~~~~~~~~~~~~~~~*/
ko.validation.rules.pattern.message = 'Invalid.';

ko.validation.init({
    registerExtenders: true,
    messagesOnModified: true,
    insertMessages: true,
    parseInputAttributes: true,
    messageTemplate: null
}, true);

var viewModel = {
    customer_id: ko.observable().extend({ required: true }),
    customer_name: ko.observable().extend({ required: true }),
    contact_name: ko.observable().extend({ required: true }),
    address: ko.observable().extend({ required: true }),
    city: ko.observable().extend({ required: true }),
    postal_code: ko.observable().extend({ required: true }),
    country: ko.observable().extend({ required: true }),
    submit: function () {
        if (viewModel.errors().length === 0) {
            alert('Thank you.');
            return true;
        }
        else {
            alert('Please check your submission.');
            viewModel.errors.showAllMessages();
        }
    }
};

viewModel.errors = ko.validation.group(viewModel);

viewModel.requireLocation = function() {
    viewModel.location.extend({required: true});
};

ko.applyBindings(viewModel);
/*~~~~~~~~~~~~~~~~~~~~~~~~ End Knockout Validation~~~~~~~~~~~~~~~~~~~~~~~~*/
