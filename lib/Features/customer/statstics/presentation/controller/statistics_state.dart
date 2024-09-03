part of 'statistics_cubit.dart';

@immutable
abstract class StatisticsState {}

class StatisticsInitialState extends StatisticsState {}

class LoadingStatisticsState extends StatisticsState {}

class ErrorStatisticsState extends StatisticsState {}

class SuccessStatisticsState extends StatisticsState {}

class LoadingOrdersWithNoStatementCustomerHomeState extends StatisticsState {}

class ErrorOrdersWithNoStatementCustomerHomeState extends StatisticsState {}

class SuccessOrdersWithNoStatementCustomerHomeState extends StatisticsState {}
