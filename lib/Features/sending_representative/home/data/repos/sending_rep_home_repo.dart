import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/failures.dart';
import '../models/rep_orders_model.dart';

abstract class SendingRepHomeRepo {
  Future<Either<Failure, RepOrdersModel>> fetchOrders({
    required String accessToken,
  });
}
