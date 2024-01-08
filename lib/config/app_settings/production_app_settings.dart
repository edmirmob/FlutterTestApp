// import 'dart:io';

import 'package:flutter_test_app/_all.dart';

AppSettings productionAppSettings = AppSettings(
  baseApiUrl: 'https://api.talkdup.net/api',
  stripeCheckoutUrl: 'https://tailgreeter.com/files/stripe-page.html',
  // usingExceptionReporting: true && !kDebugMode,
  logNetworkTraffic: false,
  resetStorageOnRestart: false,
  packageName: 'com.ito.tailgreeter',
  appleServiceId: 'com.ito.tailgreeter.service',
  appleRedirectUrl: 'https://api.talkdup.net/api/auth/apple/redirect',
  // googlePlacesApiKeyByPlatform: () => Platform.isAndroid ? 'AIzaSyA8iVtmjsg_aFth39-EAjt02erS0IAppCE' : 'AIzaSyDCPUdIAYhG-RwhGs-KkRIO4XsrgitA_dc',
  // loggingOptions: const LoggingOptions(
  //   logNetworkTraffic: false,
  //   logStorage: false,
  //   logCacheStorage: false,
  // ),
);
