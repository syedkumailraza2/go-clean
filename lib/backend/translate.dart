import 'package:get_storage/get_storage.dart';
import 'package:translator/translator.dart';

class Translate {
  final box = GetStorage();
  final GoogleTranslator translator = GoogleTranslator();

  late List<String> car_detail_static_translated;

  final List<String> car_detail_static_txt = [
    'Add car details',
    'Car name',
    'Car number',
    'Add',
  ]; 

    List<String> forgot_password_static_txt = [
    'Forgot password',
    'Please enter the email address you\'d like your password reset information sent to',
    'Email address',
    'Send',
  ];

  List<String> forgot_password_static_translatedTexts = [];

  List<String> forgot_verification_static_Text = [
    'Verification',
    'Please enter the email address you\'d like your password reset information sent to',
    'Code Sent To ',
    'Send',
    'Didn’t receive a code? ',
    'Resend code'
  ];

   List<String> change_address_static_translatedTexts = [];

  List<String> change_address_static_Text = [
    'Edit address',
     'Locatility / area / street',
    'City',
    'State',
    'Zipcode',
    'Country',
    'Home',
    'Office',
    'Other',
    'Save',
  ];

  List<String> checkout_static_translatedTexts = [];

  List<String> checkout_static_Text = [
    'Checkout',
    'Add car',
    'Address',
    'Change address',
    'Add address',
   'Date and time',
    'Service included',
    'Add Extra Service',
    'Engine Washing',
    'Leather Restoration',
    'Air Freshener',
    'Window Cleaning',
    'Removing Stubborn Stains',
    'Interior Polishing',
    'Tire Care',
    'Enter Coupon code',
    'Apply',
    'View all',
    'Payment summary',
    'Cart total',
    'Coupon',
    'Grand total',
    'Proceed to payment',
  ];

  List<String> home_static_translatedTexts = [];

  List<String> home_static_Text = [
    'View your account details here',
    'Default',
    'Add car',
    'Our Services',
    'View all',
  ];

  List<String> coupon_static_translatedTexts = [];

  List<String> coupon_static_Text = [
    'My coupon',
    'Have a coupon code',
    'Enter Coupon code',
    'Apply',
    'Coupon code',
  ];

List<String> my_order_static_translatedTexts = [];

  List<String> my_order_static_Text = [
    'My order',
    'Ongoing',
    'Canceled',
    'Completed',
  ];
  
  List<String> forgot_verification_static_translatedTexts = [];

  Future<void> car_detail_static_translate(String from, String dest) async {
    try {
      car_detail_static_translated = await Future.wait(
        car_detail_static_txt.map((text) async {
          try {
            return (await translator.translate(text, from: from, to: dest)).text;
          } catch (e) {
            print('Translation error: $e');
            return text; // Fallback if translation fails
          }
        }),
      );

      // Store in local storage if changed
      box.write('car_detail_static', car_detail_static_translated);
    } catch (e) {
      print('Translation process failed: $e');
    }
  }

Future<void> forgot_password_static_translate(String from, String dest) async {
  try {
    forgot_password_static_translatedTexts = await Future.wait(
      forgot_password_static_txt.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('forgot_password_static', forgot_password_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> forgot_verification_static_translate(String from, String dest) async {
  try {
    forgot_verification_static_translatedTexts = await Future.wait(
      forgot_verification_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('forgot_verification_static', forgot_verification_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> change_address_static_translate(String from, String dest) async {
  try {
    change_address_static_translatedTexts = await Future.wait(
      change_address_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('change_address_static', change_address_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> checkout_static_translate(String from, String dest) async {
  try {
    checkout_static_translatedTexts = await Future.wait(
      checkout_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('checkout_static', checkout_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> home_static_translate(String from, String dest) async {
  try {
    home_static_translatedTexts = await Future.wait(
      home_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('home_static', home_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> coupon_static_translate(String from, String dest) async {
  try {
    coupon_static_translatedTexts = await Future.wait(
      coupon_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('coupon_static', coupon_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> my_order_static_translate(String from, String dest) async {
  try {
    my_order_static_translatedTexts = await Future.wait(
      my_order_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('my_order_static', my_order_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}


}
