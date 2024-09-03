part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {}

class SearchFailure extends SearchState {
  final String error;

  SearchFailure({required this.error});
}

class ClearSearch extends SearchState {}
