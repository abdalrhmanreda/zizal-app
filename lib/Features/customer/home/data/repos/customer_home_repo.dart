import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../orders/data/models/order_model.dart';
import '../models/banners_model.dart';
import '../models/orders_status_lentgh.dart';

abstract class CustomerHomeRepo {
  Future<Either<Failure, List<BannerModel>>> fetchBanners();
  Future<Either<Failure, List<OrderModel>>> fetchOrdersByStatus({
    required String status,
  });
  Future<Either<Failure, OrderStatusLengthModel>> fetchOrdersNumbers({
    required String accessToken,
  });

  Future<Either<Failure, List<OrderModel>>> fetchOrdersWithNoStatements({
    required String accessToken,
    required int client,
    required bool isStatement,
  });
}
