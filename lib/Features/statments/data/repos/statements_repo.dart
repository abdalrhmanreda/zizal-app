import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../../../customer/create_order/data/models/pages_model.dart';
import '../models/statements_model.dart';

abstract class StatementsRepo {
  Future<Either<Failure, StatementsModel>> fetchPdf({
    required String page,
    required String accessToken,
    String? toDate,
    String? fromDate,
  });

  Future<Either<Failure, List<PageModel>>> fetchPages({required int id});
}
