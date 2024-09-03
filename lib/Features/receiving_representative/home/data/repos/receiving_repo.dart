import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/failures.dart';
import '../models/history_model.dart';

abstract class ReceivingRepo {
  Future<Either<Failure, String>> createNewPackageFun({
    required String accessToken,
    required String code,
  });
  Future<Either<Failure, List<HistoryModel>>> fetchHistory({
    required int recieverId,
  });
}
