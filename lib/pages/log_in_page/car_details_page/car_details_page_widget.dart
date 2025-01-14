import 'package:get_storage/get_storage.dart';
import 'package:translator/translator.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/car_add_success_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'car_details_page_model.dart';
export 'car_details_page_model.dart';

class CarDetailsPageWidget extends StatefulWidget {
  const CarDetailsPageWidget({
    super.key,
    required this.vehicleTypeId,
  });

  final String? vehicleTypeId;
  @override
  State<CarDetailsPageWidget> createState() => _CarDetailsPageWidgetState();
}

class _CarDetailsPageWidgetState extends State<CarDetailsPageWidget> {
  late CarDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarDetailsPageModel());

    translated = box.read('car_detail_static') ?? txt;

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }


  var translated = List<String>.filled(10, '', growable: false);
  List<String> txt = [
    'Add car details',
    'Car name',
    'Car number',
    'Add',
  ];
  List<String> translatedTexts = [];


  Future<void> car_detail_static_translate (String from, String dest) async {
    GoogleTranslator translator = GoogleTranslator();
    List<String> translatedTexts = [];

    for (String text in txt) {
      try {
        var translation = await translator.translate(text, from: from, to: dest);
        translatedTexts.add(translation.text.toString());
      } catch (e) {
        print('Translation error: $e');
        translatedTexts.add(text); // Fallback to original text if translation fails
      }
    }

    setState(() {
      translated = translatedTexts;
      box.write('car_detail_static', translatedTexts);
    });
  }


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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.customCenterAppbarModel,
                updateCallback: () => safeSetState(() {}),
                child: CustomCenterAppbarWidget(
                  title: translated[0].isEmpty ? txt[0] : translated[0], //'Add car details',
                  backIcon: false,
                  addIcon: false,
                  onTapAdd: () async {},
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().connected) {
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: ListView(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                26.0,
                                0,
                                26.0,
                              ),
                              scrollDirection: Axis.vertical,
                              children: [
                                TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  autofocus: false,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: translated[1].isEmpty ? txt[1] : translated[1], //'Car name',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    hintText: translated[1].isEmpty ? txt[1] : translated[1], //'Car name',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                    errorStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .borderColor,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 17.0, 16.0, 17.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.2,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 26.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode2,
                                    autofocus: false,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: translated[2].isEmpty ? txt[2] : translated[2], //'Car number',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      hintText: translated[2].isEmpty ? txt[2] : translated[2], //'Car number',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.2,
                                          ),
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.2,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .borderColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 17.0, 16.0, 17.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        _model.addVehiclefunction =
                                            await CarServiceGroup
                                                .addVehicleApiCall
                                                .call(
                                          userId: FFAppState().userId,
                                          vehicleName:
                                              _model.textController1.text,
                                          vehicleNumber:
                                              _model.textController2.text,
                                          vehicleTypeId: widget!.vehicleTypeId,
                                          token: FFAppState().token,
                                        );

                                        if (CarServiceGroup.addVehicleApiCall
                                                .success(
                                              (_model.addVehiclefunction
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            1) {
                                          FFAppState().clearVehicleCacheCache();
                                          if (FFAppState()
                                                  .isLoginVehicleCheck ==
                                              true) {
                                            context.goNamed('HomeMainPage');
                                          } else {
                                            await showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => FocusScope.of(
                                                            dialogContext)
                                                        .unfocus(),
                                                    child:
                                                        CarAddSuccessComponantWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          }

                                          FFAppState().selectVehicleTypeList =
                                              0;
                                          FFAppState().update(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                CarServiceGroup
                                                    .addVehicleApiCall
                                                    .message(
                                                  (_model.addVehiclefunction
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: translated[3].isEmpty ? txt[3] : translated[3], //'Add',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 56.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                              lineHeight: 1.2,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
