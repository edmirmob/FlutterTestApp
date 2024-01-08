// import 'package:tailgreeter/_all.dart';

// class ContextServiceProviderModelValidator extends StatelessWidget {
//   final Widget? child;

//   const ContextServiceProviderModelValidator({this.child});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         //Register model validators here so they will be available through context
//         Provider<PositiveNumberPropertyValidator>(
//           create: (_) => PositiveNumberPropertyValidator(localizer: context.localizer),
//         ),
//         Provider<LoginModelValidator>(
//           create: (_) => LoginModelValidator(localizer: context.localizer),
//         ),
//         Provider<RegisterModelValidator>(
//           create: (_) => RegisterModelValidator(localizer: context.localizer),
//         ),
//         Provider<SeatingInfoModelValidator>(
//           create: (_) => SeatingInfoModelValidator(
//             localizer: context.localizer,
//             emailPropertyValidator: EmailPropertyValidator.required(localizer: context.localizer),
//           ),
//         ),
//         Provider<UpdateProfileModelValidator>(
//           create: (_) => UpdateProfileModelValidator(localizer: context.localizer),
//         ),

//         Provider<ShoppingCartAddModelValidator>(
//           create: (_) => ShoppingCartAddModelValidator(
//             localizer: context.localizer,
//             positiveNumberPropertyValidator: PositiveNumberPropertyValidator.required(localizer: context.localizer),
//           ),
//         ),
//         Provider<ShoppingCartUpdateModelValidator>(
//           create: (_) => ShoppingCartUpdateModelValidator(
//             localizer: context.localizer,
//             positiveNumberPropertyValidator: PositiveNumberPropertyValidator.required(localizer: context.localizer),
//           ),
//         ),
//         Provider<ChangePasswordModelValidator>(
//           create: (_) => ChangePasswordModelValidator(localizer: context.localizer),
//         ),
//         Provider<ResetPasswordModelValidator>(
//           create: (_) => ResetPasswordModelValidator(localizer: context.localizer),
//         ),
//         Provider<ShareTicketModelValidator>(
//           create: (_) => ShareTicketModelValidator(localizer: context.localizer),
//         ),
//         Provider<SeatingInfoModelValidator>(
//           create: (_) => SeatingInfoModelValidator(
//             localizer: context.localizer,
//             emailPropertyValidator: EmailPropertyValidator.required(localizer: context.localizer),
//           ),
//         ),
//         Provider<EventAddModelValidator>(
//           create: (_) => EventAddModelValidator(
//             localizer: context.localizer,
//           ),
//         ),
//         Provider<EventAdditionalModelValidator>(
//           create: (_) => EventAdditionalModelValidator(
//             localizer: context.localizer,
//           ),
//         ),
//         Provider<SecondPageModelValidator>(
//           create: (_) => SecondPageModelValidator(localizer: context.localizer),
//         ),
//         Provider<EventUpdateModelValidator>(
//           create: (_) => EventUpdateModelValidator(
//             localizer: context.localizer,
//           ),
//         ),
//         Provider<SecondPageUpdateModelValidator>(
//           create: (_) => SecondPageUpdateModelValidator(localizer: context.localizer),
//         ),
//         Provider<EventAdditionalUpdateModelValidator>(
//           create: (_) => EventAdditionalUpdateModelValidator(localizer: context.localizer),
//         ),
//       ],
//       child: child,
//     );
//   }
// }
