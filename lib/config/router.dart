import 'package:alzilzal/Features/auth/presentation/views/login_screen.dart';
import 'package:alzilzal/Features/customer/create_order/presentation/views/choose_screen.dart';
import 'package:alzilzal/Features/customer/create_order/presentation/views/create_order_screen.dart';
import 'package:alzilzal/Features/customer/create_order/presentation/views/scan_screen.dart';
import 'package:alzilzal/Features/customer/layout/presentation/views/customer_layout_screen.dart';
import 'package:alzilzal/Features/receiving_representative/home/presentation/views/complete_orders.dart';
import 'package:alzilzal/Features/receiving_representative/home/presentation/views/order_details.dart';
import 'package:alzilzal/Features/search/ui/screens/search_screen.dart';
import 'package:alzilzal/Features/splash/presentation/views/splash_screen.dart';
import 'package:alzilzal/config/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Core/constatnts/app_keys.dart';
import '../Core/helpers/cachehelper.dart';
import '../Core/helpers/service_locator.dart';
import '../Features/customer/create_order/data/models/scan_screen_arguments.dart';
import '../Features/customer/create_order/data/repos/order_repo_imp.dart';
import '../Features/customer/create_order/presentation/controller/order_cubit/order_cubit.dart';
import '../Features/customer/home/presentation/views/request_receipt_representative.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this argument is used to pass data from one screen to another
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutePath.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RoutePath.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RoutePath.orderDetails:
        return MaterialPageRoute(
          builder: (_) => OrderDetails(orderNumber: arguments as int),
        );
      case RoutePath.createOrderScreen:
        if (arguments != null && arguments is ScanScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => OrderCubit(getIt.get<OrderRepoImpl>())
                ..fetchPages(id: CacheHelper.getDate(key: AppKeys.userId) ?? 1),
              child: UserCreateOrderScreen(
                isQrCode: arguments.isQrCode,
                qrCode: arguments.qrCode,
              ),
            ),
          );
        } else {
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => OrderCubit(getIt.get<OrderRepoImpl>())
                ..fetchPages(id: CacheHelper.getDate(key: AppKeys.userId) ?? 1),
              child: UserCreateOrderScreen(),
            ),
          );
        }

      case RoutePath.scanScreen:
        return MaterialPageRoute(
          builder: (_) => ScanScreen(),
        );
      case RoutePath.completeOrderScreen:
        return MaterialPageRoute(
          builder: (_) => const CompleteOrdersScreen(),
        );
      case RoutePath.chooseScreenQrCodeOrNot:
        return MaterialPageRoute(
          builder: (_) => const ChooseScreenNotfiyOrWhatsapp(),
        );
      case RoutePath.requestReceiptRepresentative:
        return MaterialPageRoute(
          builder: (_) => const RequestReceiptRepresentative(),
        );
      case RoutePath.userLayout:
        return MaterialPageRoute(
          builder: (_) => const UserLayoutScreen(),
        );
      case RoutePath.search:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
