import 'package:alzilzal/Core/constatnts/api_const.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Core/helpers/api_service.dart';
import 'package:alzilzal/Features/customer/create_order/data/models/create_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constatnts/app_keys.dart';
import '../../../../../../Core/helpers/cachehelper.dart';
import '../../../data/models/areas_model.dart';
import '../../../data/models/pages_model.dart';
import '../../../data/repos/order_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitialState());

  TextEditingController typeController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController nearestPointController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientPhoneController = TextEditingController();
  TextEditingController theNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String selectedValue = 'سلعة';
  final formKey = GlobalKey<FormState>();
  String? areaDropValue;
  String? areaFromGovDropValue;
  String? profileDropValue;

  static OrderCubit get(context) => BlocProvider.of(context);
  final OrderRepo orderRepo;

  List<PageModel>? pagesModel;

  String? qrCode;

  bool? isQrCode;

  Future<void> fetchPages({required int id}) async {
    emit(LoadingPagesOrderState());
    var result = await orderRepo.fetchPages(id: id);
    result.fold((failure) {
      emit(ErrorPagesOrderState());
    }, (value) {
      pagesModel = value;
      // for (int i = 0; i < value.length; i++) {
      //   AppVariables.profileList.add(value[i].title);
      // }

      print(value);
      emit(SuccessPagesOrderState(value));
    });
  }

  Future<void> createOrder({String? qrCode}) async {
    emit(LoadingCreateOrderState());
    var result = await orderRepo.createOrderFunc(
      count: int.parse(theNumberController.text),
      page: AppVariables.profileMap[profileDropValue] == null
          ? null
          : int.parse(AppVariables.profileMap[profileDropValue]!),
      accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
      customerName: clientNameController.text,
      customerNumber: clientPhoneController.text,
      area: AppVariables.areasFromGovMap[areaDropValue]!,
      address: addressController.text,
      amount: priceController.text,
      notes: notesController.text,
      nearestPoint: nearestPointController.text,
      type: typeController.text,
      amountType: selectedValue,
      qrCode: qrCode,
      gov: areaDropValue!,
    );
    result.fold((failure) {
      print(failure.message);
      emit(ErrorCreateOrderState());
    }, (value) {
      print(value);
      emit(SuccessCreateOrderState(value));
    });
  }

  void extractAreaFromGovernorate(String? parent) {
    AppVariables.areaFromGovList.clear();
    areaFromGovDropValue = null;
    if (parent != null) {
      emit(LoadingExtractAreaFromGovernate());
      DioHelper.getData(
          url: ApiConst.getAreasFromGov,
          queryParameters: {'parent': parent}).then((value) {
        value.data.forEach((element) {
          AppVariables.areasFromGovMap[element['parent']] =
              element['id'].toString();
          AppVariables.areaFromGovList.add(element['name']);

          print(AppVariables.areasFromGovMap);
        });
        emit(SuccessExtractAreaFromGovernate());
      }).catchError((error) {
        print(error.toString());
        emit(ErrorExtractAreaFromGovernate());
      });
    }
  }

  List<String> extractProfile(List<PageModel> pageModels) {
    List<String> namesList = [];

    for (int i = 0; i < pageModels.length; i++) {
      print(pageModels[i].title);
      namesList.add(pageModels[i].title);
      AppVariables.profileMap[pageModels[i].title] =
          pageModels[i].id.toString();
    }
    AppVariables.profileList = namesList;
    print("AppVariables.profileList++++++++");
    print(AppVariables.profileList);
    print("AppVariables.profileMap++++++++");
    print(AppVariables.profileMap);
    return namesList;
  }

  Future<String> getPhone() async {
    try {
      emit(LoadingGetPhoneState());

      var response = await DioHelper.postData(
        url: ApiConst.getPhone,
        data: {"way_purpose": "whatsapp_delivery"},
        options: Options(
          headers: {
            'authorization':
                'Bearer ${CacheHelper.getDate(key: AppKeys.accessTokenKey)}',
          },
        ),
      );

      String phone = response.data['whatsapp_number'];

      emit(SuccessGetPhoneState(phone));

      return phone;
    } catch (error) {
      // Emit error state
      emit(ErrorGetPhoneState());

      // Throw the error so it can be handled by the caller
      rethrow;
    }
  }

  void sendNotification() {
    emit(LoadingSendNotOrderState());
    DioHelper.postData(
        url: 'https://zilzal.pythonanywhere.com/api/v1/SendNotification',
        data: {
          "way_purpose": "notification_delivery",
        },
        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${CacheHelper.getDate(key: AppKeys.accessTokenKey)}',
        })).then((value) {
      emit(SuccessSendNotOrderState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSendNotOrderState());
    });
  }

  void emptyAllControllers() {
    typeController.clear();
    placeController.clear();
    priceController.clear();
    notesController.clear();
    nearestPointController.clear();
    clientNameController.clear();
    clientPhoneController.clear();
    theNumberController.clear();
  }

  void clearAllValues() {
    // Clear values from all controllers
    typeController.clear();
    placeController.clear();
    priceController.clear();
    notesController.clear();
    nearestPointController.clear();
    clientNameController.clear();
    clientPhoneController.clear();
    theNumberController.clear();
    // Reset dropdown values
    selectedValue = 'Option 1';
    areaDropValue = null;
    areaFromGovDropValue = null;
    profileDropValue = null;
    pagesModel = null;
    qrCode = null;
    isQrCode = null;
    emit(ValuesClearedOrderState());
  }
}
