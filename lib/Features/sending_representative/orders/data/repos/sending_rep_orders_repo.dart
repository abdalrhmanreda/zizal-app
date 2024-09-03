import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../orders/data/models/order_model.dart';

abstract class SendingRepOrdersRepo {
  Future<Either<Failure, List<OrderModel>>> fetchOrdersByStatus({
    required String status,
    required String accessToken,
  });
  Future<Either<Failure, String>> changeOrderStatus({
    required String orderId,
    required String status,
  });
}
