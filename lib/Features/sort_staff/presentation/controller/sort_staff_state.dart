part of 'sort_staff_cubit.dart';

@immutable
abstract class SortStaffState {}

class SortStaffInitialState extends SortStaffState {}

class LoadingReceivingPackageState extends SortStaffState {}

class ErrorReceivingPackageState extends SortStaffState {}

class SuccessReceivingPackageState extends SortStaffState {}

class SuccessSortHistoryState extends SortStaffState {
}
class LoadingSortHistoryState extends SortStaffState {}

class ErrorSortHistoryState extends SortStaffState {}
