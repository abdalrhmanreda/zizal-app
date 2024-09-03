import 'package:alzilzal/Core/helpers/api_service.dart';
import 'package:alzilzal/Features/receiving_representative/home/data/models/history_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../sort_staff/data/models/distribution_representative_model.dart';
import '../../data/repos/receiving_repo.dart';

part 'receiving_state.dart';

class ReceivingCubit extends Cubit<ReceivingState> {
  ReceivingCubit(this.receivingRepo) : super(ReceivingInitialState());

  static ReceivingCubit get(context) => BlocProvider.of(context);
  final ReceivingRepo receivingRepo;

  List<HistoryModel> historyLst = [];
  Future<void> createReceiving({
    required String accessToken,
    required String code,
  }) async {
    emit(LoadingCreatePackageReceivingState());
    var result = await receivingRepo.createNewPackageFun(
      accessToken: accessToken,
      code: code,
    );
    result.fold((failure) {
      emit(ErrorCreatePackageReceivingState());
    }, (value) {
      print(value);
      emit(SuccessCreatePackageReceivingState());
    });
  }

  Future<void> fetchHistory({
    required int recieverId,
    required bool reset,
  }) async {
    historyLst = [];
    emit(LoadingFetchHistoryReceivingState());
    var result = await receivingRepo.fetchHistory(
      recieverId: recieverId,
    );
    result.fold((failure) {
      emit(ErrorFetchHistoryReceivingState());
    }, (value) {
      historyLst = value;
      print(value);
      emit(SuccessFetchHistoryReceivingState());
    });
  }

  HistoryModel? orderDetails;
  void getOrderDetails(int orderNumber) {
    emit(LoadingState());
    DioHelper.getData(
            url:
                'https://zilzal.pythonanywhere.com/api/v1/orders/$orderNumber/')
        .then((value) {
      orderDetails = HistoryModel.fromJson(value.data);
      print(value.data);
      emit(SuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorState());
    });
  }

  List<DistributionRepresentativeModel> distributionRepresentativeLst = [];
  void getDistributionRepresentative({required int orderNumber}) {
    distributionRepresentativeLst = [];
    emit(LoadingState());
    DioHelper.getData(
            url:
                'https://zilzal.pythonanywhere.com/api/v1/orders/$orderNumber/assign_order_to_distributor/')
        .then((value) {
      distributionRepresentativeLst = value.data
          .map<DistributionRepresentativeModel>(
              (e) => DistributionRepresentativeModel.fromJson(e))
          .toList();
      print(value.data);
      emit(SuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorState());
    });
  }

  DistributionRepresentativeModel? distributionRepresentativeModel;
  void appointDistributionRepresentative({
    required int orderNumber,
    required int distributorId,
  }) {
    emit(LoadingState());
    DioHelper.postData(
        url:
            'https://zilzal.pythonanywhere.com/api/v1/orders/$orderNumber/assign_order_to_distributor/',
        data: {'id': distributorId}).then((value) {
      print(value.data);
      emit(AppointDistributionRepresentativeSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorState());
    });
  }
}
