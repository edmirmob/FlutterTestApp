// import 'dart:io';

import 'package:flutter_test_app/_all.dart';

AppSettings stagingAppSettings = AppSettings(
  baseApiUrl: 'https://api.demo.tailgreeter.ito.dev/api',
  stripeCheckoutUrl: 'https://demo.tailgreeter.ito.dev/files/stripe-page.html',
  usingExceptionReporting: false,
  logNetworkTraffic: true,
  packageName: 'com.ito.tailgreeter.staging',
  appleServiceId: 'com.ito.tailgreeter.staging.service',
  appleRedirectUrl:
      'https://api.demo.tailgreeter.ito.dev/api/auth/apple/redirect',
  // googlePlacesApiKeyByPlatform: () => Platform.isAndroid ? 'AIzaSyA8iVtmjsg_aFth39-EAjt02erS0IAppCE' : 'AIzaSyDCPUdIAYhG-RwhGs-KkRIO4XsrgitA_dc',
);
