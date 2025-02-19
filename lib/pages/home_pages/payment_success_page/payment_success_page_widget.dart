import 'package:get_storage/get_storage.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'payment_success_page_model.dart';
export 'payment_success_page_model.dart';
import 'package:dio/dio.dart';

class PaymentSuccessPageWidget extends StatefulWidget {
  const PaymentSuccessPageWidget({
    super.key,
    required this.vinNumber,
    required this.isCarService,
    required this.addressId,
    required this.addressType,
    required this.addressStreet,
    required this.addressCity,
    required this.addresState,
    required this.addresZipcode,
    required this.addressCountry,
    required this.vehicleId,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.packageId,
    required this.packageTitle,
    required this.packageImage,
    required this.packagePrice,
    required this.bookingDate,
    required this.bookingTime,
     this.paymentMode,
    required this.transactionId,
    required this.paymentStatus,
    required this.orderStatus,
     this.subTotal,
     this.couponCode,
     this.couponType,
     this.couponAmount,
     this.vat,
     this.total,
  });

  final String? addressId;
  final String? vinNumber;
  final bool? isCarService;
  final String? addressType;
  final String? addressStreet;
  final String? addressCity;
  final String? addresState;
  final String? addresZipcode;
  final String? addressCountry;
  final String? vehicleId;
  final String? vehicleName;
  final String? vehicleNumber;
  final String? serviceId;
  final String? serviceName;
  final String? serviceImage;
  final String? packageId;
  final String? packageTitle;
  final String? packageImage;
  final double? packagePrice;
  final String? bookingDate;
  final String? bookingTime;
  final String? paymentMode;
  final String? transactionId;
  final String? paymentStatus;
  final String? orderStatus;
  final double? subTotal;
  final String? couponCode;
  final String? couponType;
  final double? couponAmount;
  final double? vat;
  final double? total;

  @override
  State<PaymentSuccessPageWidget> createState() =>
      _PaymentSuccessPageWidgetState();
}

class _PaymentSuccessPageWidgetState extends State<PaymentSuccessPageWidget> {
  late PaymentSuccessPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSuccessPageModel());

translated = box.read('payment_success_static') ?? txt;

    // if(widget.isCarService == true){
    //   addDataToDB();
    // }

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().paymentSuccessCheck == true) {
        _model.getUserPayment = await CarServiceGroup.getUserApiCall.call(
          userId: FFAppState().userId,
          token: FFAppState().token,
        );

        if (widget!.couponCode == '0') {
          _model.bookingPaypalApiNoCouponFunction =
              await CarServiceGroup.bookAVehicleNoCouponCall.call(
            userId: FFAppState().userId,
            username: CarServiceGroup.getUserApiCall.username(
              (_model.getUserPayment?.jsonBody ?? ''),
            ),
            email: CarServiceGroup.getUserApiCall.email(
              (_model.getUserPayment?.jsonBody ?? ''),
            ),
            city: widget!.addressCity,
            addressId: widget!.addressId,
            type: widget!.addressType,
            street: widget!.addressStreet,
            state: widget!.addressStreet,
            zipcode: widget!.addresZipcode,
            country: widget!.addressCountry,
            vehicleId: widget!.vehicleId,
            vehicleName: widget!.vehicleName,
            vehicleNumber: widget!.vehicleNumber,
            serviceId: widget!.serviceId,
            name: widget!.serviceName,
            image: widget!.serviceImage,
            packageId: widget!.packageId,
            title: widget!.packageTitle,
            packageImage: widget!.packageImage,
            price: widget!.packagePrice,
            bookingDate: widget!.bookingDate,
            bookingTime: widget!.bookingTime,
            paymentMode: widget!.paymentMode,
            transactionId: FFAppState().paypalTransationId,
            paymentStatus: 'success',
            orderStatus: 'pending',
            subTotal: widget!.subTotal,
            vat: widget!.vat,
            total: widget!.total,
            token: FFAppState().token,
          );

          if (CarServiceGroup.bookAVehicleNoCouponCall.success(
                (_model.bookingPaypalApiNoCouponFunction?.jsonBody ?? ''),
              ) ==
              1) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CarServiceGroup.bookAVehicleNoCouponCall.message(
                    (_model.bookingPaypalApiNoCouponFunction?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CarServiceGroup.bookAVehicleNoCouponCall.message(
                    (_model.bookingPaypalApiNoCouponFunction?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'ffffffffffff',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          }
        } else {
          _model.bookingPaypalApiFunction =
              await CarServiceGroup.bookAVehicleCall.call(
            userId: FFAppState().userId,
            username: CarServiceGroup.getUserApiCall.username(
              (_model.getUserPayment?.jsonBody ?? ''),
            ),
            email: CarServiceGroup.getUserApiCall.email(
              (_model.getUserPayment?.jsonBody ?? ''),
            ),
            addressId: widget!.addressId,
            type: widget!.addressType,
            street: widget!.addressStreet,
            city: widget!.addressCity,
            state: widget!.addresState,
            zipcode: widget!.addresZipcode,
            country: widget!.addressCountry,
            vehicleId: widget!.vehicleId,
            vehicleName: widget!.vehicleName,
            vehicleNumber: widget!.vehicleNumber,
            serviceId: widget!.serviceId,
            name: widget!.serviceName,
            image: widget!.serviceImage,
            packageId: widget!.packageId,
            title: widget!.packageTitle,
            packageImage: widget!.packageImage,
            bookingDate: widget!.bookingDate,
            bookingTime: widget!.bookingTime,
            paymentMode: widget!.paymentMode,
            transactionId: FFAppState().paypalTransationId,
            paymentStatus: 'success',
            orderStatus: 'pending',
            subTotal: widget!.subTotal,
            couponCode: widget!.couponCode,
            couponType: widget!.couponType,
            couponAmount: widget!.couponAmount,
            vat: widget!.vat,
            total: widget!.total,
            token: FFAppState().token,
            price: widget!.packagePrice,
          );

          if (CarServiceGroup.bookAVehicleCall.success(
                (_model.bookingPaypalApiFunction?.jsonBody ?? ''),
              ) ==
              1) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CarServiceGroup.bookAVehicleCall.message(
                    (_model.bookingPaypalApiFunction?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CarServiceGroup.bookAVehicleCall.message(
                    (_model.bookingPaypalApiFunction?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          }
        }
      }
      else if (widget!.isCarService == true) {
        _model.getUserPayment = await CarServiceGroup.getUserApiCall.call(
          userId: FFAppState().userId,
          token: FFAppState().token,
        );

        if (widget!.couponCode == '0') {
          _model.bookingPaypalApiNoCouponFunction =
              await CarServiceGroup.bookAVehicleNoCouponCall.call(
            userId: FFAppState().userId,
            username: CarServiceGroup.getUserApiCall.username(
              (_model.getUserPayment?.jsonBody ?? ''),
            ),
            email: CarServiceGroup.getUserApiCall.email(
              (_model.getUserPayment?.jsonBody ?? ''),
            ),
            city: widget!.addressCity,
            addressId: widget!.addressId,
            type: widget!.addressType,
            street: widget!.addressStreet,
            state: widget!.addressStreet,
            zipcode: widget!.addresZipcode,
            country: widget!.addressCountry,
            vehicleId: widget!.vehicleId,
            vehicleName: widget!.vehicleName,
            vehicleNumber: widget!.vehicleNumber,
            serviceId: widget!.serviceId,
            name: widget!.serviceName,
            image: widget!.serviceImage,
            packageId: widget!.packageId,
            title: widget!.packageTitle,
            packageImage: widget!.packageImage,
            price: widget!.packagePrice,
            bookingDate: widget!.bookingDate,
            bookingTime: widget!.bookingTime,
            paymentMode: widget!.paymentMode,
            transactionId: FFAppState().paypalTransationId,
            paymentStatus: 'success',
            orderStatus: 'pending',
            subTotal: widget!.subTotal,
            vat: widget!.vat,
            total: widget!.total,
            token: FFAppState().token,
            VinNumber: widget.vinNumber
          );

          if (CarServiceGroup.bookAVehicleNoCouponCall.success(
                (_model.bookingPaypalApiNoCouponFunction?.jsonBody ?? ''),
              ) ==
              1) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CarServiceGroup.bookAVehicleNoCouponCall.message(
                    (_model.bookingPaypalApiNoCouponFunction?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CarServiceGroup.bookAVehicleNoCouponCall.message(
                    (_model.bookingPaypalApiNoCouponFunction?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'ffffffffffff',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          }
        } else {
          _model.bookingPaypalApiFunction =
              await CarServiceGroup.bookAVehicleCall.call(
            userId: FFAppState().userId,
            username: CarServiceGroup.getUserApiCall.username(
              (_model.getUserPayment?.jsonBody ?? ''),
            ),
            email: CarServiceGroup.getUserApiCall.email(
              (_model.getUserPayment?.jsonBody ?? ''),
            ),
            addressId: widget!.addressId,
            type: widget!.addressType,
            street: widget!.addressStreet,
            city: widget!.addressCity,
            state: widget!.addresState,
            zipcode: widget!.addresZipcode,
            country: widget!.addressCountry,
            vehicleId: widget!.vehicleId,
            vehicleName: widget!.vehicleName,
            vehicleNumber: widget!.vehicleNumber,
            serviceId: widget!.serviceId,
            name: widget!.serviceName,
            image: widget!.serviceImage,
            packageId: widget!.packageId,
            title: widget!.packageTitle,
            packageImage: widget!.packageImage,
            bookingDate: widget!.bookingDate,
            bookingTime: widget!.bookingTime,
            paymentMode: widget!.paymentMode,
            transactionId: FFAppState().paypalTransationId,
            paymentStatus: 'success',
            orderStatus: 'pending',
            subTotal: widget!.subTotal,
            couponCode: widget!.couponCode,
            couponType: widget!.couponType,
            couponAmount: widget!.couponAmount,
            vat: widget!.vat,
            total: widget!.total,
            token: FFAppState().token,
            price: widget!.packagePrice,
          );

          if (CarServiceGroup.bookAVehicleCall.success(
                (_model.bookingPaypalApiFunction?.jsonBody ?? ''),
              ) ==
              1) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CarServiceGroup.bookAVehicleCall.message(
                    (_model.bookingPaypalApiFunction?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CarServiceGroup.bookAVehicleCall.message(
                    (_model.bookingPaypalApiFunction?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          }
        }
      }
      // else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(
      //         'faileddddd',
      //         style: TextStyle(
      //           color: FlutterFlowTheme.of(context).primaryText,
      //         ),
      //       ),
      //       duration: Duration(milliseconds: 4000),
      //       backgroundColor: FlutterFlowTheme.of(context).secondary,
      //     ),
      //   );
      // }
    });
  }

Future<void> addDataToDB() async {
  try {
    final dio = Dio();
    final baseUrl = 'https://stage.goclean.ba/api';
    final firstName = box.read('firstName');
    final lastName = box.read('lastName');
    final email = box.read('email');
    final username = '$firstName $lastName';
    final Data = {
      "user": {
          "userId": FFAppState().userId,
          "username": username,
          "email": email,
        },
        "address": {
          "addressId": widget.addressId,
          "type": widget.addressType,
          "street": widget.addressStreet,
          "city": widget.addressCity,
          "state": widget.addresState,
          "zipcode": widget.addresZipcode,
          "country": widget.addressCountry,
        },
        "vehicle": {
          "vehicleId": widget.vehicleId,
          "vehicle_name": widget.vehicleName,
          "vehicle_number": widget.vehicleNumber,
        },
        "service": {
          "serviceId": widget.serviceId,
          "name": widget.serviceName,
          "image": widget.serviceImage,
        },
        "package": {
          "packageId": widget.packageId,
          "title": widget.packageTitle,
          "image": widget.packageImage,
          "price": widget.packagePrice,
        },
        "bookingDate": widget.bookingDate,
        "bookingTime": widget.bookingTime,
        "paymentMode": widget.paymentMode,
        "transactionId": widget.transactionId,
        "paymentStatus":'pending',
        "orderStatus": widget.orderStatus,
        "subTotal": widget.subTotal,
        "coupon_code": widget.couponCode,
        "coupon_type": widget.couponType,
        "coupon_amount": widget.couponAmount,
        "VAT": widget.vat,
        "Total": widget.total,
    };

     print('Data: ${Data}');
    
    final response = await dio.post(
      '${baseUrl}/book_vehicle',
      data: {
        Data
      },
    );

   

    if (response.statusCode == 201 || response.statusCode == 200) {
      print("Data successfully added: ${response.data}");
    } else {
      print("Failed to add data. Status Code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error occurred: $e");
  }
}



  var translated = List<String>.filled(10, '', growable: false);
  
  List<String> txt = [
    'Booking successfull!',
    'Booking successfull',
    'Ok',
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Lottie.asset(
                        'assets/jsons/5CeJyXS8q8.json',
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                    Text(
                      translated[0].isEmpty ? txt[0] : translated[0], //'Booking successfull!',
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
                       translated[1].isEmpty ? txt[1] : translated[1], //'Booking successfull',
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
                          context.goNamed('MyOrderConfirmPage');
                        },
                        text: translated[2].isEmpty ? txt[2] : translated[2], //'Ok',
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
