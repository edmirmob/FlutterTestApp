import 'package:flutter_test_app/_all.dart';
import 'package:flutter_test_app/main.dart';
import 'package:rest_api_client/rest_api_client.dart';

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
  late ICommentsRepository commentsRepository;
  late IPostsRepository postsRepository;
  late IUsersRepository usersRepository;
  late IPhotosRepository photosRepository;
  RestApiClient? restApiClient;

  Future<void> init() async {
    await initAppSettings();
    await initCommonServices();
    await initRestApiClient();
    await initRepositories();
  }

  Future<void> initAppSettings();

  Future<void> initCommonServices() async {
    toast = Toast();
  }

  Future<void> initStorage() async {}

  Future<void> initRestApiClient() async {
    RestApiClient restApiClient = RestApiClientImpl(
      options: RestApiClientOptions(
        baseUrl: appSettings.baseApiUrl,
        cacheEnabled: true,
      ),
      authOptions: AuthOptions(
        refreshTokenEndpoint: '/auth/token-refresh',
        refreshTokenParameterName: 'token',
        resolveJwt: (response) =>
            response.data['result']['accessToken']['token'],
        resolveRefreshToken: (response) =>
            response.data['result']['refreshToken']['token'],
      ),
      loggingOptions: const LoggingOptions(
        logNetworkTraffic: true,
      ),
    );
    await restApiClient.init();
  }

  Future<void> initRepositories() async {
    commentsRepository = CommentsRepository(
        restApiClient: restApiClient ??
            RestApiClientImpl(
              options: RestApiClientOptions(
                baseUrl: appSettings.baseApiUrl,
                cacheEnabled: true,
              ),
            ));
    postsRepository = PostsRepository(
        restApiClient: restApiClient ??
            RestApiClientImpl(
              options: RestApiClientOptions(
                baseUrl: appSettings.baseApiUrl,
                cacheEnabled: true,
              ),
            ));
    usersRepository = UsersRepository(
        restApiClient: restApiClient ??
            RestApiClientImpl(
              options: RestApiClientOptions(
                baseUrl: appSettings.baseApiUrl,
                cacheEnabled: true,
              ),
            ));
    photosRepository = PhotosRepository(
        restApiClient: restApiClient ??
            RestApiClientImpl(
              options: RestApiClientOptions(
                baseUrl: appSettings.baseApiUrl,
                cacheEnabled: true,
              ),
            ));
  }
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
