import 'package:dartz/dartz.dart';

import '../../../../../Core/errors/failures.dart';

abstract class SortStaffRepo {
  Future<Either<Failure, String>> receivePackageFun({
    required String accessToken,
    required String code,
  });
}
