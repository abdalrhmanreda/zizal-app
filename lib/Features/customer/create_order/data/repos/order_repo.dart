import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../orders/data/models/complain_model.dart';
import '../models/areas_model.dart';
import '../models/create_model.dart';
import '../models/pages_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<AreasModel>>> fetchAreas();

  Future<Either<Failure, CreateModel>> createOrderFunc({
    required String accessToken,
    required String customerName,
    required String customerNumber,
    required String address,
    required String area,
    required String amount,
    required String notes,
    required String nearestPoint,
    required String type,
    required int count,
    required int? page,
    String? qrCode,
    required String amountType,
    required String gov,
  });
  Future<Either<Failure, List<PageModel>>> fetchPages({required int id});

  Future<Either<Failure, ComplainModel>> makeComplain({
    required String accessToken,
    required String complain,
    required String orderId,
  });
}
