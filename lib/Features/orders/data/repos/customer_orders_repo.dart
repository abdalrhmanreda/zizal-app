import 'package:dartz/dartz.dart';

import '../../../../../../Core/errors/failures.dart';
import '../models/order_model.dart';

abstract class CustomerOrdersRepo {
  Future<Either<Failure, List<OrderModel>>> fetchOrdersByStatus({
    required String status,
    required String accessToken,
  });
  Future<Either<Failure, List<OrderModel>>>
      fetchOrdersByStatusByFollowUpOrClientAssistant({
    required String status,
    required String accessToken,
  });
}
