import 'package:alzilzal/Features/customer/home/data/repos/customer_home_repo_imp.dart';
import 'package:alzilzal/Features/customer/statstics/data/repos/statstics_repo_imp.dart';
import 'package:alzilzal/Features/receiving_representative/home/data/repos/receiving_repo_imp.dart';
import 'package:alzilzal/Features/sort_staff/data/repos/sort_staff_repo_imp.dart';
import 'package:get_it/get_it.dart';

import '../../Features/auth/data/repos/login_repo_imp.dart';
import '../../Features/customer/create_order/data/repos/order_repo_imp.dart';
import '../../Features/orders/data/repos/customer_orders_repo_imp.dart';
import '../../Features/profile/data/repos/profile_repo_imp.dart';
import '../../Features/sending_representative/home/data/repos/sending_rep_home_repo_imp.dart';
import '../../Features/sending_representative/orders/data/repos/sending_rep_orders_repo_imp.dart';
import '../../Features/statments/data/repos/statements_repo_imp.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(),
  );
  getIt.registerSingleton<OrderRepoImpl>(
    OrderRepoImpl(),
  );

  getIt.registerSingleton<ReceivingRepoImpl>(
    ReceivingRepoImpl(),
  );
  getIt.registerSingleton<SortStaffRepoImpl>(
    SortStaffRepoImpl(),
  );
  getIt.registerSingleton<CustomerHomeRepoImpl>(
    CustomerHomeRepoImpl(),
  );
  getIt.registerSingleton<CustomerOrdersRepoImpl>(
    CustomerOrdersRepoImpl(),
  );
  getIt.registerSingleton<SendingRepHomeRepoImpl>(
    SendingRepHomeRepoImpl(),
  );
  getIt.registerSingleton<SendingRepOrdersRepoImpl>(
    SendingRepOrdersRepoImpl(),
  );
  getIt.registerSingleton<StatisticsRepoImpl>(
    StatisticsRepoImpl(),
  );
  getIt.registerSingleton<StatementsRepoImpl>(
    StatementsRepoImpl(),
  );
}
