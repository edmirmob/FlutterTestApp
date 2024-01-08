// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test_app/_all.dart';
import 'package:flutter_test_app/main.dart';
import 'package:rest_api_client/rest_api_client.dart';
// import 'package:tailgreeter/common/error_handling/extended_slack_handler.dart';
// import 'package:tailgreeter/domain/repositories/categories_repository.dart';

class DevelopmentServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = developmentAppSettings;
}

class StagingServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = stagingAppSettings;
}

class EvaluationServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = evaluationAppSettings;
}

class ProductionServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = productionAppSettings;
}

abstract class ServiceProvider {
  late AppSettings appSettings;
  late IToast toast;
  late CatcherOptions catcherOptions;

  RestApiClient? restApiClient;
  // late IStorageRepository storageRepository;
  // late IStorageRepository cacheStorageRepository;
  // late IStorageRepository secureStorageRepository;
  // late IAccountRepository accountRepository;
  // late IAuthenticationRepository authenticationRepository;
  // late IChatRepository chatRepository;
  late ICommentsRepository eventsRepository;
  // late IGalleryRepository galleryRepository;
  // late ILocationRepository locationRepository;
  // late IPermissionsRepository permissionsRepository;
  // late IHostRepository hostRepository;
  // late IOrdersRepository ordersRepository;
  // late IShoppingCartRepository shoppingCartRepository;
  // late ITicketsRepository ticketsRepository;
  // late ICategoriesRepository categoriesRepository;
  // late IDonationsRepository donationsRepository;
  //Add new repositories and services here
  //...

  Future<void> init() async {
    await initAppSettings();
    await initCommonServices();
    // await initStorage();
    await initRestApiClient();
    await initRespositories();
    //TODO: Uncomment once the chat feature needs to be implemented
    //await initChat();
    // await initFirebase();
    // await initExceptionHandling();
    // await initDateTimeDefaults();
  }

  Future<void> initAppSettings();

  Future<void> initCommonServices() async {
    toast = Toast();
  }

  Future<void> initStorage() async {
    // storageRepository = StorageRepository();
    // await storageRepository.init();
    // // await storageRepository.log();
    // cacheStorageRepository = StorageRepository(key: 'CACHE_BOX');
    // await cacheStorageRepository.init();
    // // await cacheStorageRepository.log();
    // secureStorageRepository = SecureStorageRepository();
    // await secureStorageRepository.init();
    // await secureStorageRepository.log();

    // if (appSettings.resetStorageOnRestart) {
    //   await storageRepository.clear();
    //   await cacheStorageRepository.clear();
    //   await secureStorageRepository.clear();
    // }
  }

  Future<void> initRestApiClient() async {
    RestApiClient restApiClient = RestApiClientImpl(
      options: RestApiClientOptions(
        //Defines your base API url eg. https://mybestrestapi.com
        baseUrl: appSettings.baseApiUrl,

        //Enable caching of response data
        cacheEnabled: true,
      ),
      authOptions: AuthOptions(
        //Define refresh token endpoint for RestApiClient
        //instance to use the first time response status code is 401
        refreshTokenEndpoint: '/auth/token-refresh',

        //Define the name of your api parameter name
        //on RefreshToken endpoint eg. 'refreshToken' or 'value' ...
        refreshTokenParameterName: 'token',

        //This method is called on successfull call to refreshTokenEndpoint
        //Provides a way to get a jwt from response, much like
        //resolveValidationErrorsMap callback
        resolveJwt: (response) =>
            response.data['result']['accessToken']['token'],

        //Much like resolveJwt, this method is used to resolve
        //refresh token from response
        resolveRefreshToken: (response) =>
            response.data['result']['refreshToken']['token'],
      ),
      loggingOptions: LoggingOptions(
        //Toggle logging of your requests and responses
        //to the console while debugging
        logNetworkTraffic: true,
      ),
    );
    await restApiClient.init();

    // restApiClient = RestApiClient(
    //   restApiClientOptions: RestApiClientOptions(
    //     baseUrl: appSettings.baseApiUrl,
    //     keepRetryingOnNetworkError: appSettings.keepRetryingOnNetworkError,
    //     refreshTokenEndpoint: '/auth/token-refresh',
    //     refreshTokenParameterName: 'token',
    //     resolveJwt: (response) =>
    //         response.data['result']['accessToken']['token'],
    //     resolveRefreshToken: (response) =>
    //         response.data['result']['refreshToken']['token'],
    //   ),
    //   loggingOptions: appSettings.loggingOptions,
    // );
    // await restApiClient.init();
    // restApiClient.options.contentType = Headers.jsonContentType;
  }

  // Future<void> initChat() async {
  //   // await chatRepository.init();
  // }

  // Future initFirebase() async {
  //   await Firebase.initializeApp();
  // }

  Future<void> initRespositories() async {
    //Those without dependencies(restApiClient dependency excluded)
    eventsRepository = CommentsRepository(
      restApiClient: restApiClient!,
    );
    // galleryRepository = GalleryRepository();
    // permissionsRepository = PermissionsRepository();
    // ordersRepository = OrdersRepository(restApiClient: restApiClient);
    // shoppingCartRepository = ShoppingCartRepository(
    //     restApiClient: restApiClient,
    //     storageRepository: cacheStorageRepository);
    // ticketsRepository = TicketsRepository(restApiClient: restApiClient);
    // categoriesRepository = CategoriesRepository(
    //     restApiClient: restApiClient,
    //     storageRepository: cacheStorageRepository);
    // locationRepository = LocationRepository(appSettings: appSettings);

    // //Those with dependencies
    // authenticationRepository = AuthenticationRepository(
    //     appSettings: appSettings,
    //     restApiClient: restApiClient,
    //     storageRepository: secureStorageRepository);
    // chatRepository = ChatRepository(appSettings: appSettings, storageRepository: secureStorageRepository);
    // accountRepository = AccountRepository(
    //     restApiClient: restApiClient,
    //     storageRepository: secureStorageRepository,
    //     locationRepository: locationRepository);
    // hostRepository = HostRepository(restApiClient: restApiClient);
    // donationsRepository = DonationsRepository(restApiClient: restApiClient);
  }

  // Future<void> initExceptionHandling() async {
  //   if (appSettings.usingExceptionReporting) {
  //     catcherOptions = CatcherOptions(
  //       SilentReportMode(),
  //       [
  //         ExtendedSlackHandler(
  //           appSettings.exceptionReportingSettings.slackWebHookUrl,
  //           appSettings.exceptionReportingSettings.slackChannel,
  //           iconEmoji: ':thinking_face:',
  //           enableDeviceParameters:
  //               appSettings.exceptionReportingSettings.enableDeviceParameters,
  //           enableApplicationParameters: appSettings
  //               .exceptionReportingSettings.enableApplicationParameters,
  //           enableCustomParameters:
  //               appSettings.exceptionReportingSettings.enableCustomParameters,
  //           enableStackTrace:
  //               appSettings.exceptionReportingSettings.enableStackTrace,
  //           printLogs: appSettings.exceptionReportingSettings.printLogs,
  //           extendMessage: (String message) async {
  //             final StringBuffer stringBuffer = StringBuffer();
  //             await storageRepository.log();
  //             stringBuffer.write(message);
  //             stringBuffer.write(
  //                 '*Storage:* ```${await storageRepository.asString()}```\n');

  //             //if (!environment.isProduction) {
  //             stringBuffer.write(
  //                 '*Secure storage:* ```${await secureStorageRepository.asString()}```\n');
  //             //}

  //             return stringBuffer.toString();
  //           },
  //         ),
  //       ],
  //     );
  //   }
  // }

//   Future<void> initDateTimeDefaults() async {
//     Intl.defaultLocale = Localizer.defaultLanguage.locale.languageCode;
//   }
}

Future<ServiceProvider> resolveServiceProviderFromEnvironment() async {
  ServiceProvider serviceProvider;

  switch (environment) {
    case EnvironmentType.development:
      serviceProvider = DevelopmentServiceProvider();
      break;
    case EnvironmentType.staging:
      serviceProvider = StagingServiceProvider();
      break;
    case EnvironmentType.evaluation:
      serviceProvider = EvaluationServiceProvider();
      break;
    case EnvironmentType.production:
      serviceProvider = ProductionServiceProvider();
      break;
    default:
      serviceProvider = ProductionServiceProvider();
  }

  await serviceProvider.init();

  return serviceProvider;
}
