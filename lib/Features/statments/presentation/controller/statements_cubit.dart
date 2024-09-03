import 'package:alzilzal/Features/orders/data/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/constatnts/variables.dart';
import '../../../customer/create_order/data/models/pages_model.dart';
import '../../data/models/statements_model.dart';
import '../../data/repos/statements_repo.dart';

part 'statements_state.dart';

class StatementsCubit extends Cubit<StatementsState> {
  StatementsCubit(this.statementsRepo) : super(StatementsInitialState());

  static StatementsCubit get(context) => BlocProvider.of(context);
  final StatementsRepo statementsRepo;

  String? profileDropValue;
  StatementsModel? statementsModel;
  DateTime? fromDate;
  DateTime? toDate;
  void setFromDate(DateTime date) {
    fromDate = date;
    emit(SetFromDateState(date));
  }

  void setToDate(DateTime date) {
    toDate = date;
    emit(SetToDateState(date));
  }

  List<List<String>> tableData = [];
  Future<void> fetchStatements({
    required String page,
    required String accessToken,
  }) async {
    emit(LoadingStatementsState());
    if (fromDate == null || toDate == null) {
      var result = await statementsRepo.fetchPdf(
        page: page,
        accessToken: accessToken,
      );
      result.fold((failure) {
        emit(ErrorStatementsState());
      }, (value) {
        statementsModel = value;
        tableData = extractTableData(value.orders);
        emit(SuccessStatementsState());
      });
    } else {
      var result = await statementsRepo.fetchPdf(
        page: page,
        accessToken: accessToken,
        fromDate: fromDate.toString(),
        toDate: toDate.toString(),
      );
      result.fold((failure) {
        emit(ErrorStatementsState());
      }, (value) {
        statementsModel = value;
        tableData = extractTableData(value.orders);
        emit(SuccessStatementsState());
      });
    }
  }

  List<List<String>> extractTableData(List<OrderModel> orders) {
    // Initialize the tableData list with the right size
    final data = List.generate(orders.length, (_) => List.filled(7, ''));
    for (int i = 0; i < orders.length; i++) {
      data[i][0] = orders[i].orderNumber.toString();
      data[i][1] = orders[i].createdAt.toString();
      data[i][2] = orders[i].customerNumber.toString();
      data[i][3] = orders[i].customer.toString();
      data[i][4] = orders[i].address.toString();
      data[i][5] = orders[i].clientAmount.toString();
      data[i][6] = orders[i].notes.toString();
    }
    return data;
  }

  List<PageModel>? pagesModel;

  Future<void> fetchPages({required int id}) async {
    emit(LoadingFetchPagesStatementsState());
    var result = await statementsRepo.fetchPages(id: id);
    result.fold((failure) {
      emit(ErrorFetchPagesStatementsState());
    }, (value) {
      pagesModel = value;
      emit(SuccessFetchPagesStatementsState());
    });
  }

  List<String> extractProfile(List<PageModel> pageModels) {
    List<String> namesList = [];

    for (int i = 0; i < pageModels.length; i++) {
      namesList.add(pageModels[i].title);
      AppVariables.profileMap[pageModels[i].title] =
          pageModels[i].id.toString();
    }
    AppVariables.profileList = namesList;
    return namesList;
  }
}
