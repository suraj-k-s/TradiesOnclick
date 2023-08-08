package com.example.tradiesonclick;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.example.tradiesonclick.WebServiceCaller;
import com.google.android.material.textfield.TextInputEditText;
import java.util.Calendar;

public class payment extends AppCompatActivity {

    Button pay;
    TextInputEditText card_name, card_number, amount_to_pay, card_expiry, ccv_num;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);
        String bookingid = getIntent().getStringExtra("bid");

        pay = findViewById(R.id.button_pay);
        card_name = findViewById(R.id.card_name);
        card_number = findViewById(R.id.card_number);
        amount_to_pay = findViewById(R.id.amount_to_pay);
        card_expiry = findViewById(R.id.card_expiry);
        ccv_num = findViewById(R.id.ccv_num);

        pay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (isInputValid()) {
                    // Proceed with the payment update using the AsyncTask
                    ConfirmAdva ca = new ConfirmAdva();
                    ca.execute(bookingid);
                }
            }
        });
    }

    private boolean isInputValid() {
        String cardHolderName = card_name.getText().toString().trim();
        String cardNumber = card_number.getText().toString().trim();
        String amountToPay = amount_to_pay.getText().toString().trim();
        String cardExpiry = card_expiry.getText().toString().trim();
        String ccvNumber = ccv_num.getText().toString().trim();

        // Card Holder's Name Validation
        if (TextUtils.isEmpty(cardHolderName)) {
            card_name.setError("Card Holder's Name is required.");
            return false;
        }

        // Card Number Validation
        if (TextUtils.isEmpty(cardNumber)) {
            card_number.setError("Card Number is required.");
            return false;
        }

        if (!TextUtils.isDigitsOnly(cardNumber)) {
            card_number.setError("Card Number should contain only digits.");
            return false;
        }

        // Optionally, implement Luhn algorithm validation here if desired.

        // CCV Validation
        if (TextUtils.isEmpty(ccvNumber)) {
            ccv_num.setError("CCV Number is required.");
            return false;
        }

        if (!TextUtils.isDigitsOnly(ccvNumber)) {
            ccv_num.setError("CCV Number should contain only digits.");
            return false;
        }

        // Check CCV length based on card type (e.g., 3 digits for Visa/Mastercard, 4 digits for Amex).
        // Adjust the length check based on your specific requirements.
        if (ccvNumber.length() != 3 && ccvNumber.length() != 4) {
            ccv_num.setError("Invalid CCV Number.");
            return false;
        }

        // Expiry Date Validation
        if (TextUtils.isEmpty(cardExpiry)) {
            card_expiry.setError("Expiry Date is required.");
            return false;
        }

        // Check expiry date format (MM/YY or MM/YYYY).
        // Adjust the regular expression based on your desired format.
        String expiryRegex = "^(0[1-9]|1[0-2])/(\\d{2}|\\d{4})$";
        if (!cardExpiry.matches(expiryRegex)) {
            card_expiry.setError("Invalid Expiry Date format. Use MM/YY or MM/YYYY.");
            return false;
        }

        // Validate the expiry month and year.
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1; // Month is 0-based.
        int currentYear = Calendar.getInstance().get(Calendar.YEAR) % 100;
        String[] expiryParts = cardExpiry.split("/");
        int expiryMonth = Integer.parseInt(expiryParts[0]);
        int expiryYear = Integer.parseInt(expiryParts[1]);
        if (expiryMonth < 1 || expiryMonth > 12 || expiryYear < currentYear || (expiryYear == currentYear && expiryMonth < currentMonth)) {
            card_expiry.setError("Card has expired.");
            return false;
        }

        // Amount Validation
        if (TextUtils.isEmpty(amountToPay)) {
            amount_to_pay.setError("Amount is required.");
            return false;
        }

        // You can perform more specific validations for the amount format, minimum/maximum amounts, etc.

        // All fields are valid
        return true;
    }

    public class ConfirmAdva extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller = new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("PaymentUpdate");
            caller.addProperty("id", params[0]);

            caller.callWebService();
            String res = caller.getResponse();
            return res;
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(payment.this, s, Toast.LENGTH_SHORT).show();

            Intent i = new Intent(payment.this, MyBookings.class);
            startActivity(i);

            // Proceed with further actions based on the payment result,
            // e.g., show a confirmation message or navigate to the success page.
            // If needed, you can check the value of "s" to determine the payment status.
        }
    }
}
