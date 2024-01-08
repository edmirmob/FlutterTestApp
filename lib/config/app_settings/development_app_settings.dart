// import 'dart:io';

import 'package:flutter_test_app/_all.dart';

AppSettings developmentAppSettings = AppSettings(
  baseApiUrl: 'https://10.0.17.25/api',
  stripeCheckoutUrl: 'https://ff40-185-98-0-94.ngrok.io/files/stripe-page.html',
  usingExceptionReporting: false,
  logNetworkTraffic: true,
  resetStorageOnRestart: false,
  packageName: 'com.ito.tailgreeter.development',
  appleServiceId: 'com.ito.tailgreeter.development.service',
  appleRedirectUrl: 'https://mytgapi.com/api/auth/apple/redirect',
  // googlePlacesApiKeyByPlatform: () => Platform.isAndroid ? 'AIzaSyA8iVtmjsg_aFth39-EAjt02erS0IAppCE' : 'AIzaSyDCPUdIAYhG-RwhGs-KkRIO4XsrgitA_dc',
);
