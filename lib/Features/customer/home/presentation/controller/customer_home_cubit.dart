import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/banners_model.dart';
import '../../data/repos/customer_home_repo.dart';

part 'customer_home_state.dart';

class CustomerHomeCubit extends Cubit<CustomerHomeState> {
  CustomerHomeCubit(this.customerRepo) : super(CustomerHomeInitialState());

  static CustomerHomeCubit get(context) => BlocProvider.of(context);
  final CustomerHomeRepo customerRepo;

  List<BannerModel>? bannersList;
  List<String> banners = [];

  Future<void> fetchBanners() async {
    banners.clear();
    emit(LoadingBannersCustomerHomeState());
    var result = await customerRepo.fetchBanners();
    result.fold((failure) {
      emit(ErrorBannersCustomerHomeState());
    }, (value) {
      bannersList = value;
      for (int i = 0; i < value.length; i++) {
        banners.add(value[i].image);
      }
      print(value);
      print("banners =>");
      print(banners);
      emit(SuccessBannersCustomerHomeState());
    });
  }

  Map<String, int> ordersNumbersList = {};

  Future<void> fetchOrdersNumbers(context) async {
    emit(LoadingOrdersCustomerHomeState());
    try {
      await customerRepo
          .fetchOrdersNumbers(
              accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey))
          .then((value) {
        value.fold((l) {
          print(l);
          emit(ErrorOrdersCustomerHomeState());
          throw l;
        }, (r) {
          ordersNumbersList[AppVariables.orderStatusList(context)[0]] =
              r.resend!;
          ordersNumbersList[AppVariables.orderStatusList(context)[1]] =
              r.inTheWay!;
          ordersNumbersList[AppVariables.orderStatusList(context)[2]] =
              r.delayed!;
          ordersNumbersList[AppVariables.orderStatusList(context)[3]] =
              r.delivered!;
          ordersNumbersList[AppVariables.orderStatusList(context)[4]] =
              r.partReturn!;
          ordersNumbersList[AppVariables.orderStatusList(context)[5]] =
              r.fullReturn!;
          ordersNumbersList[AppVariables.orderStatusList(context)[6]] =
              r.inprogress!;
          ordersNumbersList[AppVariables.orderStatusList(context)[7]] = r.wrp!;
          ordersNumbersList[AppVariables.orderStatusList(context)[8]] =
              r.recorded!;
          ordersNumbersList[AppVariables.orderStatusList(context)[9]] =
              r.changeData!;
          ordersNumbersList[AppVariables.orderStatusList(context)[10]] =
              r.replace!;
        });
      });
      emit(SuccessOrdersCustomerHomeState());
    } catch (e) {
      print(e);
      emit(ErrorOrdersCustomerHomeState());
    }
  }
}
