class AppSettings {
  final String name;
  final String description;
  final String version;
  final String versionDisplay;
  final String packageName;
  final String appleServiceId;
  final String baseApiUrl;
  final bool logNetworkTraffic;
  final bool keepRetryingOnNetworkError;
  final bool providesOfflineMode;
  final bool resetStorageOnRestart;
  final bool onlyAllowOrientationPortrait;
  final bool skipIntro;
  final bool skipLogin;
  final bool skipAllowLocation;
  final bool usingExceptionReporting;
  final String stripeCheckoutUrl;
  final String appleRedirectUrl;

  AppSettings({
    this.name = 'Flutter test app',
    this.description = 'Flutter test app',
    this.version = '1.0',
    this.versionDisplay = '1.0.0',
    this.packageName = 'com.example.flutter_test_app',
    this.baseApiUrl = '',
    this.stripeCheckoutUrl = '',
    this.logNetworkTraffic = true,
    this.keepRetryingOnNetworkError = true,
    this.providesOfflineMode = true,
    this.resetStorageOnRestart = false,
    this.onlyAllowOrientationPortrait = true,
    this.skipIntro = false,
    this.skipLogin = true,
    this.skipAllowLocation = false,
    this.usingExceptionReporting = false,
    this.appleRedirectUrl = '',
    this.appleServiceId = '',
  });
}
