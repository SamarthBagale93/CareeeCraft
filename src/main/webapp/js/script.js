$(document).ready(function() {
    $('#paymentButton').on('click', function() {
        paymentStart();
    });
});

function paymentStart() {
    console.log("Payment started...");

    // Retrieve the amount and user details
    const amount = $('#amount').val();
    const name = $('#name').val();
    const email = $('#email').val();
    const phone = $('#phone').val();
    const address = $('#address').val();

    // Check if the amount and other details are valid
    if (!amount || amount <= 0) {
        alert("Please enter a valid amount.");
        return;
    }

    if (!name || !email || !phone || !address) {
        alert("Please fill in all user details.");
        return;
    }

    // Ajax request to the server to create the order
    $.ajax({
        url: '/CareerCraft/create_order', // Backend URL for creating order
        data: JSON.stringify({ amount: amount, name: name, email: email, phone: phone, address: address }), // Send details as JSON
        contentType: 'application/json',
        type: 'POST',
        dataType: 'json',
        success: function(response) {
            console.log("Order created successfully:", response);

            var options = {
                "key": "rzp_test_sbF7Cn1PacGyyc", // Your Razorpay API Key
                "amount": response.amount, // Order amount (from Razorpay response)
                "currency": "INR",
                "name": "Test Payment", // Your company name
                "description": "Payment for Order",
                "order_id": response.id, // Order ID received from Razorpay
                "handler": function(paymentResponse) {
                    console.log("Payment successful!", paymentResponse);
                    alert("Payment successful! Order ID: " + paymentResponse.razorpay_order_id);

                    // Trigger download of the receipt
                    const receipt = paymentResponse.razorpay_order_id + ".pdf";
                    const downloadLink = document.createElement("a");
                    downloadLink.href = "/CareerCraft/download_receipt?order_id=" + paymentResponse.razorpay_order_id;
                    downloadLink.download = receipt;
                    downloadLink.click();

                    // Redirect to premiumunlock.jsp after successful payment
                    window.location.href = "/CareerCraft/premiumunlock.jsp";
                },
                "prefill": {
                    "name": name,
                    "email": email,
                    "contact": phone
                },
                "theme": {
                    "color": "#F37254" // Theme color of the checkout page
                }
            };

            // Open Razorpay Checkout with the provided options
            var rzp1 = new Razorpay(options);
            rzp1.open();
        },
        error: function(error) {
            console.log("Error creating order:", error);
            alert("Something went wrong.");
        }
    });
}
