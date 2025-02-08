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
    'Enter VIN Number'
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

  List<String> bottom_nav_static_translatedTexts = [];

  List<String> bottom_nav_static_Text = [
    'Home',
    'Search',
    'My order',
    'Profile',
  ];

   List<String> payment_success_static_translatedTexts = [];

  List<String> payment_success_static_Text = [
    'Booking successfull!',
    'Booking successfull',
    'Ok',
  ];
  
   List<String> payment_failed_static_translatedTexts = [];

  List<String> payment_failed_static_Text = [
    'Payment failed!',
    'It seems we have not received money',
    'Back to home',
  ];
  
  List<String> edit_profile_static_translatedTexts = [];

  List<String> edit_profile_static_Text = [
    'Edit profile',
    'First name',
    'Last name',
    'Email address',
    'Save',
  ];
  
  List<String> payment_gateway_static_translatedTexts = [];

  List<String> payment_gateway_static_Text = [
    'Payment',
    'Your Secured Payment Details',
    'Name :',
    'Mobile No :',
    'Amount :',
    'Payment To :',
    'Pay Now',
  ];
  
   List<String> payment_method_static_translatedTexts = [];

  List<String> payment_method_static_Text = [
    'Payment',
    'Your Secured Payment Details',
    'Name :',
    'Mobile No :',
    'Amount :',
    'Payment To :',
    'Pay Now',
  ];

   List<String> car_details_static_translatedTexts = [];

  List<String> car_details_static_Text = [
    'Package includes',
    'Book now',
  ];

     List<String> select_time_static_translatedTexts = [];

  List<String> select_time_static_Text = [
    'Package includes',
    'Book now',
  ];

  List<String> recommended_static_translatedTexts = [];

  List<String> recommended_static_Text = [
     'Recommended service',
  ];

   List<String> add_address_static_translatedTexts = [];

  List<String> add_address_static_Text = [
     'Add new address',
    'Locatility / area / street',
    'City',
    'State',
    'Zipcode',
    'Country',
    'Home',
    'Office ',
    'Other',
    'Add',
  ];

     List<String> address_static_translatedTexts = [];

  List<String> address_static_Text = [
    'Address',
    'Default',
    'Edit',
    'Add new address',
  ];

       List<String> car_detail_edit_static_translatedTexts = [];

  List<String> car_detail_edit_static_Text = [
    'Edit car details',
    'Car name',
    'Car number',
    'Save',
  ];

  List<String> edit_address_static_translatedTexts = [];

  List<String> edit_address_static_Text = [
    'Edit address',
    'Locatility / area / street',
    'City',
    'State',
    'Zipcode',
    'Country',
    'Home',
    'Office ',
    'Other',
    'Save',
  ];

List<String> my_cars_static_translatedTexts = [];

  List<String> my_cars_static_Text = [
    'My cars',
    'Default',
    'Edit',
    'Add new car',
  ];

  List<String> my_profile_static_translatedTexts = [];

  List<String> my_profile_static_Text = [
    'My profile',
    'Name',
    'Email',
    'Phone Number',
  ];

  List<String> profile_static_translatedTexts = [];

  List<String> profile_static_Text = [
    'View your account details here',
    'Default',
    'Add car',
    'My profile',
    'My address',
    'My cars',
    'More',
    'Log out',
    'Sign in',
  ];

  List<String> vehicle_type_static_translatedTexts = [];

  List<String> vehicle_type_static_Text = [
    'Select vehicle type',
    'Continue',
  ];

   List<String> setting_static_translatedTexts = [];

  List<String> setting_static_Text = [
    'More',
    'Privacy policy',
    'Terms and conditions',
    'About us',
    'Change Language',
    'Delete account',
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

Future<void> bottom_nav_static_translate(String from, String dest) async {
  try {
    bottom_nav_static_translatedTexts = await Future.wait(
      bottom_nav_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('bottom_nav_static', bottom_nav_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> payment_success_static_translate(String from, String dest) async {
  try {
    payment_success_static_translatedTexts = await Future.wait(
      payment_success_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('payment_success_static', payment_success_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> payment_failed_static_translate(String from, String dest) async {
  try {
    payment_failed_static_translatedTexts = await Future.wait(
      payment_failed_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('payment_failed_static', payment_failed_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> edit_profile_static_translate(String from, String dest) async {
  try {
    edit_profile_static_translatedTexts = await Future.wait(
      edit_profile_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('edit_profile_static', edit_profile_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> payment_gateway_static_translate(String from, String dest) async {
  try {
    payment_gateway_static_translatedTexts = await Future.wait(
      payment_gateway_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('payment_gateway_static', payment_gateway_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> payment_method_static_translate(String from, String dest) async {
  try {
    payment_method_static_translatedTexts = await Future.wait(
      payment_method_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('payment_method_static', payment_method_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> car_details_static_translate(String from, String dest) async {
  try {
    car_details_static_translatedTexts = await Future.wait(
      car_details_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('car_details_static', car_details_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> select_time_static_translate(String from, String dest) async {
  try {
    select_time_static_translatedTexts = await Future.wait(
      select_time_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('select_time_static', select_time_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> recommended_static_translate(String from, String dest) async {
  try {
    recommended_static_translatedTexts = await Future.wait(
      recommended_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('recommended_static', recommended_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> add_address_static_translate(String from, String dest) async {
  try {
    add_address_static_translatedTexts = await Future.wait(
      add_address_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('add_address_static', add_address_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> address_static_translate(String from, String dest) async {
  try {
    address_static_translatedTexts = await Future.wait(
      address_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text; // Fallback if translation fails
        }
      }),
    );

    // Store in local storage if changed
    box.write('address_static', address_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> car_detail_edit_static_translate(String from, String dest) async {
  try {
    car_detail_edit_static_translatedTexts = await Future.wait(
      car_detail_edit_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text;
        }
      }),
    );

    // Store in local storage if changed
    box.write('car_detail_edit_static', car_detail_edit_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> edit_address_static_translate(String from, String dest) async {
  try {
    edit_address_static_translatedTexts = await Future.wait(
      edit_address_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text;
        }
      }),
    );

    // Store in local storage if changed
    box.write('edit_address_static', edit_address_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> my_cars_static_translate(String from, String dest) async {
  try {
    my_cars_static_translatedTexts = await Future.wait(
      my_cars_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text;
        }
      }),
    );

    // Store in local storage if changed
    box.write('my_cars_static', my_cars_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> my_profile_static_translate(String from, String dest) async {
  try {
    my_profile_static_translatedTexts = await Future.wait(
      my_profile_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text;
        }
      }),
    );

    // Store in local storage if changed
    box.write('my_profile_static', my_profile_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> profile_static_translate(String from, String dest) async {
  try {
    profile_static_translatedTexts = await Future.wait(
      profile_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text;
        }
      }),
    );

    // Store in local storage if changed
    box.write('profile_static', profile_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> vehicle_type_static_translate(String from, String dest) async {
  try {
    vehicle_type_static_translatedTexts = await Future.wait(
      vehicle_type_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text;
        }
      }),
    );

    // Store in local storage if changed
    box.write('vehicle_type_static', vehicle_type_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}

Future<void> setting_static_translate(String from, String dest) async {
  try {
    setting_static_translatedTexts = await Future.wait(
      setting_static_Text.map((text) async {
        try {
          return (await translator.translate(text, from: from, to: dest)).text;
        } catch (e) {
          print('Translation error: $e');
          return text;
        }
      }),
    );

    // Store in local storage if changed
    box.write('setting_static', setting_static_translatedTexts);
  } catch (e) {
    print('Translation process failed: $e');
  }
}




}
