// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInfoDialog extends StatefulWidget {
  @override
  _CardInfoDialogState createState() => _CardInfoDialogState();
}

class _CardInfoDialogState extends State<CardInfoDialog> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  String _expiryError = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Card Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Card Number Input
          TextField(
            controller: _cardNumberController,
            decoration: InputDecoration(labelText: 'Card Number'),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(17), // 16 digits + 3 spaces
              FilteringTextInputFormatter.digitsOnly,
              CardNumberInputFormatter(), // Custom formatter for card number
            ],
            obscureText:
                false, // We do not need to use `obscureText` since we are masking
          ),

          // Expiry Date Input
          TextField(
            controller: _expiryController,
            decoration: InputDecoration(
              labelText: 'Expiry (MM/YY)',
              errorText: _expiryError.isEmpty ? null : _expiryError,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(5), // MM/YY
              FilteringTextInputFormatter.digitsOnly,
              ExpiryDateInputFormatter(
                  onChanged:
                      _validateExpiryDate), // Custom formatter for expiry
            ],
          ),

          // CVV Input
          TextField(
            controller: _cvvController,
            decoration: InputDecoration(labelText: 'CVV'),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(3), // 3 digits for CVV
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            print('Card Number: ${_cardNumberController.text}');
            print('Expiry: ${_expiryController.text}');
            print('CVV: ${_cvvController.text}');
            Navigator.of(context).pop();
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  void _validateExpiryDate(String value) {
    // Get the current year and month
    final currentYear = DateTime.now().year;
    final currentMonth = DateTime.now().month;

    if (value.length == 5) {
      // Split the input into MM/YY
      final month = int.tryParse(value.substring(0, 2));
      final year = int.tryParse(value.substring(3, 5));

      // Check if month is between 01 and 12 and year is current or above
      if (month == null || month < 1 || month > 12) {
        setState(() {
          _expiryError =
              "Invalid month. Please enter a month between 01 and 12.";
        });
      } else if (year == null || year < (currentYear % 100)) {
        setState(() {
          _expiryError = "Year should be the current year or above.";
        });
      } else {
        setState(() {
          _expiryError = "";
        });
      }
    }
  }
}

// Custom InputFormatter for card number
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');
    String oldText = oldValue.text.replaceAll(RegExp(r'\D'), '');
    // Limit to 16 digits
    if (newText.length > 17) {
      newText = newText.substring(0, 17); // Ensure no more than 16 digits
    }

    // Mask all digits after 16 characters, keeping the last 4 digits visible

    // Block further input if the card number is fully entered (16 digits + 3 spaces)
    if (newText.length == 17) {
      // 16 digits + 3 spaces
      return oldValue; // Prevent input after 16 digits and spaces
    }

    // Return the updated text with spaces and masked digits
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

// Custom InputFormatter for expiry date
class ExpiryDateInputFormatter extends TextInputFormatter {
  final Function(String) onChanged;

  ExpiryDateInputFormatter({required this.onChanged});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text
        .replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters

    // Format expiry as MM/YY
    if (newText.length == 1) {
      // If it's the first digit
      if (newText == '1') {
        // If the first digit is '1', allow entering '10', '11', or '12'
        newText = '1';
      } else if (newText.length == 1 && int.tryParse(newText)! >= 2) {
        // If the first digit is between 2 and 9, set the first digit to 0 and move the number to the second position
        newText = '0$newText';
      }
    }

    // Check and format month
    if (newText.length == 2) {
      // If the month is > 12, prevent further input or auto-correct
      int? month = int.tryParse(newText);
      if (month != null && (month < 1 || month > 12)) {
        // Show an error message or prevent incorrect input
        newText = '12'; // Optionally, reset to 12
      }
    }

    // Format the expiry date with slash
    if (newText.length >= 3) {
      newText = newText.replaceRange(2, 2, '/');
    }

    // Call the onChanged callback for validation
    onChanged(newText);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
