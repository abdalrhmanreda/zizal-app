import 'package:alzilzal/Features/customer/statstics/data/models/statistic_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../Core/helpers/cachehelper.dart';
import '../../../../orders/data/models/order_model.dart';
import '../../data/repos/statstics_repo.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit(this.statisticsRepo) : super(StatisticsInitialState());

  static StatisticsCubit get(context) => BlocProvider.of(context);
  final StatisticsRepo statisticsRepo;

  StatisticsModel? statisticsModel;

  Future<void> fetchStatisticsData({
    required String accessToken,
  }) async {
    emit(LoadingStatisticsState());
    var result =
        await statisticsRepo.fetchStatisticsData(accessToken: accessToken);
    result.fold((failure) {
      emit(ErrorStatisticsState());
    }, (value) {
      statisticsModel = value;
      emit(SuccessStatisticsState());
    });
  }

  List<OrderModel> orderWithNoStatementsList = [];

  Future<void> fetchOrdersWithNoStatements(
      {required int client, required bool isStatement}) async {
    emit(LoadingOrdersWithNoStatementCustomerHomeState());
    try {
      await statisticsRepo
          .fetchOrdersWithNoStatements(
              client: client,
              isStatement: isStatement,
              accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey))
          .then((value) {
        value.fold((l) {
          print(l);
          emit(ErrorOrdersWithNoStatementCustomerHomeState());
        }, (r) {
          orderWithNoStatementsList = r;
          emit(SuccessOrdersWithNoStatementCustomerHomeState());
        });
      });
    } catch (e) {
      print(e);
      emit(ErrorOrdersWithNoStatementCustomerHomeState());
    }
  }
}
