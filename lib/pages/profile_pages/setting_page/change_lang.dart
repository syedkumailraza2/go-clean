import 'package:car_wash/backend/translate.dart';
import 'package:car_wash/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ChangeLang extends StatefulWidget {
  const ChangeLang({super.key});

  @override
  State<ChangeLang> createState() => _ChangeLangState();
}

class _ChangeLangState extends State<ChangeLang> {
  final box = GetStorage();
  String? _selectedLang;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedLang = box.read('selected_lang') ?? 'en';
  }

 Future<void> _changeLanguage(String? lang) async {
  if (lang == null || lang == _selectedLang) return;

  setState(() {
    _isLoading = true;
  });

  await Translate().car_detail_static_translate(_selectedLang!, lang);
  await Translate().forgot_password_static_translate(_selectedLang!, lang);
  await Translate().forgot_verification_static_translate(_selectedLang!, lang);
  await Translate().change_address_static_translate(_selectedLang!, lang);
  await Translate().checkout_static_translate(_selectedLang!, lang);
  await Translate().home_static_translate(_selectedLang!, lang);
  await Translate().coupon_static_translate(_selectedLang!, lang);
  await Translate().my_order_static_translate(_selectedLang!, lang);
  await Translate().bottom_nav_static_translate(_selectedLang!, lang);
  await Translate().payment_success_static_translate(_selectedLang!, lang);
  await Translate().payment_failed_static_translate(_selectedLang!, lang);
  await Translate().edit_profile_static_translate(_selectedLang!, lang);
  await Translate().payment_gateway_static_translate(_selectedLang!, lang);
  await Translate().payment_method_static_translate(_selectedLang!, lang);
  await Translate().car_details_static_translate(_selectedLang!, lang);
  await Translate().select_time_static_translate(_selectedLang!, lang);
  await Translate().recommended_static_translate(_selectedLang!, lang);
  await Translate().add_address_static_translate(_selectedLang!, lang);
  await Translate().address_static_translate(_selectedLang!, lang);
  await Translate().car_detail_edit_static_translate(_selectedLang!, lang);
  await Translate().edit_address_static_translate(_selectedLang!, lang);
  await Translate().my_cars_static_translate(_selectedLang!, lang);
  await Translate().my_profile_static_translate(_selectedLang!, lang);
  await Translate().profile_static_translate(_selectedLang!, lang);
  await Translate().vehicle_type_static_translate(_selectedLang!, lang);
  await Translate().setting_static_translate(_selectedLang!, lang);


  setState(() {
    _selectedLang = lang;
    _isLoading = false;
  });

  box.write('selected_lang', lang);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Language'), centerTitle: true),
      body: Column(
        children: [
          
          RadioListTile<String>(
            activeColor: FlutterFlowTheme.of(context).primary,
            title: Row(
              children: [
                Image.asset('assets/images/english.png', width: 30, height: 20),
                SizedBox(width: 10),
                Text('English'),
              ],
            ),
            value: 'en',
            groupValue: _selectedLang,
            onChanged: _changeLanguage,
          ),

          RadioListTile<String>(
            activeColor: FlutterFlowTheme.of(context).primary,
            title: Row(
              children: [
                Image.asset('assets/images/croatia.png', width: 30, height: 20),
                SizedBox(width: 10),
                Text('Croatian'),
              ],
            ),
            value: 'hr',
            groupValue: _selectedLang,
            onChanged: _changeLanguage,
          ),

           RadioListTile<String>(
            activeColor: FlutterFlowTheme.of(context).primary,
            title: Row(
              children: [
                Image.asset('assets/images/bosnia.png', width: 30, height: 20),
                SizedBox(width: 10),
                Text('Bosnian'),
              ],
            ),
            value: 'bs',
            groupValue: _selectedLang,
            onChanged: _changeLanguage,
          ),
         
           RadioListTile<String>(
            activeColor: FlutterFlowTheme.of(context).primary,
            title: Row(
              children: [
                Image.asset('assets/images/german.png', width: 30, height: 20),
                SizedBox(width: 10),
                Text('German'),
              ],
            ),
            value: 'de',
            groupValue: _selectedLang,
            onChanged: _changeLanguage,
          ),
          if (_isLoading) CircularProgressIndicator(),
        ],
      ),
    );
  }
}
