import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/_all.dart';

class ContextServiceProviderBlocs extends StatelessWidget {
  final Widget child;

  const ContextServiceProviderBlocs({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ! Keep Blocs sorted by dependencies (only dependencies to other Blocs)

      providers: [
        BlocProvider<CommentsBloc>(
          create: (BuildContext context) => CommentsBloc(
            eventsRepository: context.serviceProvider.eventsRepository,
            // hostRepository: context.serviceProvider.hostRepository,
            // locationRepository: context.serviceProvider.locationRepository
          ),
        )
      ],
      child: child,
    );
    // *
    // * Without dependencies
    // *
    // BlocProvider<AccountDeleteBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => AccountDeleteBloc(
    //     accountRepository: context.serviceProvider.accountRepository,
    //   ),
    // ),
    // BlocProvider<ErrorHandlerBloc>(
    //   create: (BuildContext context) => ErrorHandlerBloc(
    //     restApiClient: context.serviceProvider.restApiClient,
    //   ),
    // ),
    // BlocProvider<LocalizationBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => LocalizationBloc(
    //     restApiClient: context.serviceProvider.restApiClient,
    //     storageRepository: context.serviceProvider.storageRepository,
    //   )..add(LocalizationInitEvent()),
    // ),
    // BlocProvider<LocationBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => LocationBloc(
    //     locationRepository: context.serviceProvider.locationRepository,
    //   ),
    // ),
    // BlocProvider<LoginBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => LoginBloc(
    //     authenticationRepository: context.serviceProvider.authenticationRepository,
    //   ),
    // ),
    // BlocProvider<NavigationBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => NavigationBloc(),
    // ),
    // BlocProvider<RegisterBloc>(
    //   create: (BuildContext context) => RegisterBloc(
    //     accountRepository: context.serviceProvider.accountRepository,
    //     authenticationRepository: context.serviceProvider.authenticationRepository,
    //   ),
    // ),
    // BlocProvider<SeatingInfoBloc>(
    //   create: (BuildContext context) => SeatingInfoBloc(
    //     accountRepository: context.serviceProvider.accountRepository,
    //     seatingInfoModelValidator: context.read<SeatingInfoModelValidator>(),
    //   ),
    // ),
    // BlocProvider<ThemeBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => ThemeBloc(
    //     storageRepository: context.serviceProvider.storageRepository,
    //   )..add(ThemeInitEvent()),
    // ),
    // BlocProvider<IntroductionBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => IntroductionBloc(
    //     storageRepository: context.serviceProvider.storageRepository,
    //   )..add(IntroductionInitEvent()),
    // ),
    // BlocProvider<AccountUpdateBloc>(
    //   create: (BuildContext context) => AccountUpdateBloc(
    //     accountRepository: context.serviceProvider.accountRepository,
    //   ),
    // ),
    // BlocProvider<EventUpdateBloc>(
    //   create: (BuildContext context) => EventUpdateBloc(
    //     eventsRepository: context.serviceProvider.eventsRepository,
    //   ),
    // ),
    // BlocProvider<GalleryBloc>(
    //   create: (BuildContext context) => GalleryBloc(
    //     galleryRepository: context.serviceProvider.galleryRepository,
    //     permissionsRepository: context.serviceProvider.permissionsRepository,
    //   ),
    // ),
    // BlocProvider<OrderCheckoutBloc>(
    //   create: (BuildContext context) => OrderCheckoutBloc(
    //     ordersRepository: context.serviceProvider.ordersRepository,
    //   ),
    // ),
    // BlocProvider<OrderDetailsBloc>(
    //   create: (BuildContext context) => OrderDetailsBloc(
    //     ordersRepository: context.serviceProvider.ordersRepository,
    //   ),
    // ),
    // BlocProvider<OrdersBloc>(
    //   create: (BuildContext context) => OrdersBloc(
    //     ordersRepository: context.serviceProvider.ordersRepository,
    //   ),
    // ),
    // BlocProvider<ShareTicketBloc>(
    //   create: (BuildContext context) => ShareTicketBloc(
    //     ticketsRepository: context.serviceProvider.ticketsRepository,
    //   ),
    // ),
    // BlocProvider<ShoppingCartAddBloc>(
    //   create: (BuildContext context) => ShoppingCartAddBloc(
    //     shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
    //   ),
    // ),
    // BlocProvider<ShoppingCartDeleteBloc>(
    //   create: (BuildContext context) => ShoppingCartDeleteBloc(
    //     shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
    //   ),
    // ),

    // BlocProvider<ChangePasswordBloc>(
    //   create: (BuildContext context) => ChangePasswordBloc(
    //     accountRepository: context.serviceProvider.accountRepository,
    //   ),
    // ),
    // BlocProvider<QRDonationScannerBloc>(
    //   create: (BuildContext context) => QRDonationScannerBloc(
    //     hostRepository: context.serviceProvider.hostRepository,
    //   ),
    // ),
    // BlocProvider<QRTicketScannerBloc>(
    //   create: (BuildContext context) => QRTicketScannerBloc(
    //     ticketsRepository: context.serviceProvider.ticketsRepository,
    //   ),
    // ),
    // BlocProvider<ResetPasswordBloc>(
    //   create: (BuildContext context) => ResetPasswordBloc(
    //     accountRepository: context.serviceProvider.accountRepository,
    //   ),
    // ),
    // BlocProvider<GuestsBloc>(
    //   create: (BuildContext context) => GuestsBloc(
    //     eventsRepository: context.serviceProvider.eventsRepository,
    //   ),
    // ),
    // BlocProvider<MyListingsBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => MyListingsBloc(
    //     eventsRepository: context.serviceProvider.eventsRepository,
    //   ),
    // ),
    // BlocProvider<MyTicketsAttendingBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => MyTicketsAttendingBloc(
    //     ticketsRepository: context.serviceProvider.ticketsRepository,
    //   ),
    // ),
    // BlocProvider<MyTicketsHistoryBloc>(
    //   lazy: false,
    //   create: (BuildContext context) => MyTicketsHistoryBloc(
    //     ticketsRepository: context.serviceProvider.ticketsRepository,
    //   ),
    // ),
    // BlocProvider<CategoryTypeBloc>(
    //   create: (BuildContext context) => CategoryTypeBloc(
    //     eventsRepository: context.serviceProvider.eventsRepository,
    //   ),
    // ),
    // BlocProvider<SpecificationAttributesBloc>(
    //     lazy: false,
    //     create: (BuildContext context) => SpecificationAttributesBloc(
    //           eventsRepository: context.serviceProvider.eventsRepository,
    //         )),
    // BlocProvider<RadioTypeTailgateBloc>(
    //     lazy: false,
    //     create: (BuildContext context) => RadioTypeTailgateBloc(
    //           eventsRepository: context.serviceProvider.eventsRepository,
    //         )),
    // BlocProvider<RadioAtmosphereTailgateBloc>(
    //     lazy: false,
    //     create: (BuildContext context) => RadioAtmosphereTailgateBloc(
    //           eventsRepository: context.serviceProvider.eventsRepository,
    //         )),
    // BlocProvider<RadioAccessibilityBathroomsBloc>(
    //     lazy: false,
    //     create: (BuildContext context) => RadioAccessibilityBathroomsBloc(
    //           eventsRepository: context.serviceProvider.eventsRepository,
    //         )),
    // BlocProvider<RadioSizeTailgateBloc>(
    //     lazy: false,
    //     create: (BuildContext context) => RadioSizeTailgateBloc(
    //           eventsRepository: context.serviceProvider.eventsRepository,
    //         )),
    // BlocProvider<RadioLotTypeBloc>(
    //     lazy: false,
    //     create: (BuildContext context) => RadioLotTypeBloc(
    //           eventsRepository: context.serviceProvider.eventsRepository,
    //         )),
    // BlocProvider<RadioGuestsStayBloc>(
    //     lazy: false,
    //     create: (BuildContext context) => RadioGuestsStayBloc(
    //           eventsRepository: context.serviceProvider.eventsRepository,
    //         )),
    // BlocProvider<ProductCategoriesBloc>(
    //     lazy: false,
    //     create: (BuildContext context) => ProductCategoriesBloc(
    //           eventsRepository: context.serviceProvider.eventsRepository,
    //         )),

    // BlocProvider<DateTimeUpdateBloc>(
    //   create: (BuildContext context) => DateTimeUpdateBloc(),
    // ),
    // BlocProvider<SoldOutBloc>(
    //   create: (BuildContext context) => SoldOutBloc(
    //     eventsRepository: context.serviceProvider.eventsRepository,
    //   ),
    // ),

    // BlocProvider<GalleryEventBloc>(
    //   create: (BuildContext context) => GalleryEventBloc(),
    // ),
    // BlocProvider<NavigationBloc>(
    //   create: (context) => NavigationBloc(),
    // ),

    // *
    // * With dependencies
    // *
    //     BlocProvider<AuthBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => AuthBloc(
    //         restApiClient: context.serviceProvider.restApiClient,
    //         authenticationRepository: context.serviceProvider.authenticationRepository,
    //         accountRepository: context.serviceProvider.accountRepository,
    //         loginBloc: context.read<LoginBloc>(),
    //         registerBloc: context.read<RegisterBloc>(),
    //         accountDeleteBloc: context.read<AccountDeleteBloc>(),
    //       )..add(AuthCheckAuthenticationEvent()),
    //     ),
    //     BlocProvider<ProfileBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => ProfileBloc(
    //         accountRepository: context.serviceProvider.accountRepository,
    //         authBloc: context.read<AuthBloc>(),
    //         accountUpdateBloc: context.read<AccountUpdateBloc>(),
    //         seatingInfoBloc: context.read<SeatingInfoBloc>(),
    //       ),
    //     ),
    //     BlocProvider<EventCompareBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => EventCompareBloc(
    //         eventsRepository: context.serviceProvider.eventsRepository,
    //       ),
    //     ),
    //     BlocProvider<EventsSearchBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => EventsSearchBloc(
    //         eventsRepository: context.serviceProvider.eventsRepository,
    //       )..add(EventsSearchLoadEvent()),
    //     ),
    //     BlocProvider<ShoppingCartUpdateBloc>(
    //       create: (BuildContext context) => ShoppingCartUpdateBloc(
    //         shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
    //         orderCheckoutBloc: context.read<OrderCheckoutBloc>(),
    //         authBloc: context.read<AuthBloc>(),
    //       ),
    //     ),
    //     BlocProvider<ShoppingCartBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => ShoppingCartBloc(
    //         shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
    //         authBloc: context.read<AuthBloc>(),
    //         orderCheckoutBloc: context.read<OrderCheckoutBloc>(),
    //         shoppingCartAddBloc: context.read<ShoppingCartAddBloc>(),
    //         shoppingCartDeleteBloc: context.read<ShoppingCartDeleteBloc>(),
    //         shoppingCartUpdateBloc: context.read<ShoppingCartUpdateBloc>(),
    //       ),
    //     ),
    //     BlocProvider<ConfigurationBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => ConfigurationBloc(
    //         accountRepository: context.serviceProvider.accountRepository,
    //         authBloc: context.read<AuthBloc>(),
    //         locationBloc: context.read<LocationBloc>(),
    //       ),
    //     ),
    //     BlocProvider<DropAPinBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => DropAPinBloc(
    //         hostRepository: context.serviceProvider.hostRepository,
    //         locationRepository: context.serviceProvider.locationRepository,
    //       ),
    //     ),
    //     BlocProvider<AppBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => AppBloc(
    //         appSettings: context.serviceProvider.appSettings,
    //         authBloc: context.read<AuthBloc>(),
    //         themeBloc: context.read<ThemeBloc>(),
    //         localizationBloc: context.read<LocalizationBloc>(),
    //         configurationBloc: context.read<ConfigurationBloc>(),
    //       ),
    //     ),
    //     BlocProvider<EventSearchFiltersBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => EventSearchFiltersBloc(
    //         eventsRepository: context.serviceProvider.eventsRepository,
    //       )..add(EventSearchFiltersLoadEvent()),
    //     ),
    //     BlocProvider<EventsAdvancedSearchBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => EventsAdvancedSearchBloc(
    //         eventsRepository: context.serviceProvider.eventsRepository,
    //       ),
    //     ),
    //     BlocProvider<EventCategoriesBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => EventCategoriesBloc(
    //         categoriesRepository: context.serviceProvider.categoriesRepository,
    //       )..add(EventCategoriesLoadEvent()),
    //     ),
    //     BlocProvider<WishlistBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => WishlistBloc(
    //         shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
    //         authBloc: context.read<AuthBloc>(),
    //       ),
    //     ),
    //     BlocProvider<DonationBloc>(
    //       lazy: false,
    //       create: (BuildContext context) => DonationBloc(
    //         donationsRepository: context.serviceProvider.donationsRepository,
    //         shoppingCartRepository: context.serviceProvider.shoppingCartRepository,
    //       ),
    //     ),

    //     BlocProvider<EventAddBloc>(
    //       create: (BuildContext context) => EventAddBloc(
    //         eventsRepository: context.serviceProvider.eventsRepository,
    //       ),
    //     ),
    //   ],
    // child: child,
    // );
  }
}
