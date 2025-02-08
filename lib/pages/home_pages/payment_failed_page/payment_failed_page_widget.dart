import 'package:get_storage/get_storage.dart'; // Import GetStorage
import 'package:translator/translator.dart'; // Import the translator package

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'payment_failed_page_model.dart';
export 'payment_failed_page_model.dart';

class PaymentFailedPageWidget extends StatefulWidget {
  const PaymentFailedPageWidget({super.key});

  @override
  State<PaymentFailedPageWidget> createState() =>
      _PaymentFailedPageWidgetState();
}

class _PaymentFailedPageWidgetState extends State<PaymentFailedPageWidget> {
  late PaymentFailedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final box = GetStorage(); // Initialize GetStorage

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentFailedPageModel());

    translated = box.read('payment_failed_static') ?? txt; // Read translated text from storage
  }


  var translated = List<String>.filled(3, '', growable: false); // Initialize translated list

  List<String> txt = [ // Original text
    'Payment failed!',
    'It seems we have not received money',
    'Back to home',
  ];

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (FFAppState().connected) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/payment_failed.png',
                        width: 96.0,
                        height: 96.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      translated[0].isEmpty ? txt[0] : translated[0], // Display translated text or original
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'SF Pro Display',
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                            lineHeight: 1.5,
                          ),
                    ),
                    Text(
                      translated[1].isEmpty ? txt[1] : translated[1],  // Display translated text or original
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'SF Pro Display',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.5,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(99.0, 0.0, 99.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.goNamed('HomeMainPage');
                        },
                        text: translated[2].isEmpty ? txt[2] : translated[2],  // Display translated text or original
                        options: FFButtonOptions(
                          width: 190.0,
                          height: 54.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'SF Pro Display',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                );
              } else {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Lottie.asset(
                    'assets/jsons/No_Wifi.json',
                    width: 150.0,
                    height: 130.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}