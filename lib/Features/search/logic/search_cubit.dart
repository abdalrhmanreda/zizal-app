import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Features/orders/data/models/order_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../Core/constatnts/api_const.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<OrderModel> orders = [];
  void fetchOrders({required String query}) {
    orders = [];
    emit(SearchLoading());
    Dio().get(ApiConst.search, queryParameters: {
      "client": CacheHelper.getDate(key: 'UserId'),
      'search': query,
    }).then((value) {
      print(value);
      orders = (value.data as List).map((e) => OrderModel.fromJson(e)).toList();
      emit(SearchSuccess());
    }).catchError((e) {
      emit(SearchFailure(error: e.toString()));
    });
  }

  void clear() {
    orders = [];
    emit(ClearSearch());
  }
}
