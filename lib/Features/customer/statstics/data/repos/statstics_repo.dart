import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../orders/data/models/order_model.dart';
import '../models/statistic_model.dart';

abstract class StatisticsRepo {
  Future<Either<Failure, StatisticsModel>> fetchStatisticsData({
    required String accessToken,
  });
  Future<Either<Failure, List<OrderModel>>> fetchOrdersWithNoStatements({
    required String accessToken,
    required int client,
    required bool isStatement,
  });
}
