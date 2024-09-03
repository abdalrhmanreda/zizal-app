import 'package:alzilzal/Core/helpers/api_service.dart';
import 'package:alzilzal/Features/receiving_representative/home/data/models/history_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repos/sort_staff_repo.dart';

part 'sort_staff_state.dart';

class SortStaffCubit extends Cubit<SortStaffState> {
  SortStaffCubit(this.sortStaffRepo) : super(SortStaffInitialState());

  static SortStaffCubit get(context) => BlocProvider.of(context);
  final SortStaffRepo sortStaffRepo;

  Future<void> receivingPackage({
    required String accessToken,
    required String code,
  }) async {
    emit(LoadingReceivingPackageState());
    var result = await sortStaffRepo.receivePackageFun(
      accessToken: accessToken,
      code: code,
    );
    result.fold((failure) {
      emit(ErrorReceivingPackageState());
    }, (value) {
      print(value);
      emit(SuccessReceivingPackageState());
    });
  }

  List<HistoryModel> sortHistory = [];
  void getSortHistory() async {
    sortHistory = [];
    emit(LoadingSortHistoryState());
    DioHelper.getData(
      url: 'https://zilzal.pythonanywhere.com/api/v1/orders/',
      queryParameters: {
        'status': 'waiting_distribution',
      },
    ).then((value) {
      value.data.forEach((element) {
        sortHistory.add(HistoryModel.fromJson(element));
      });
      emit(SuccessSortHistoryState());
    }).catchError((error) {
      emit(ErrorSortHistoryState());
    });
  }
}
