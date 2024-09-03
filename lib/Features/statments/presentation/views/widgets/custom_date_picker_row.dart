import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

import '../../../../../Core/constatnts/app_constant.dart';
import '../../../../../Core/constatnts/app_functions.dart';
import '../../../../../Core/constatnts/app_keys.dart';
import '../../../../../Core/constatnts/spacing.dart';
import '../../../../../Core/helpers/cachehelper.dart';
import '../../../../../Core/themes/colors/app_colors.dart';
import '../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../controller/statements_cubit.dart';

class CustomDatePickerRow extends StatefulWidget {
  final String firstButtonText;
  final String secondButtonText;

  const CustomDatePickerRow({
    Key? key,
    required this.firstButtonText,
    required this.secondButtonText,
  }) : super(key: key);

  @override
  State<CustomDatePickerRow> createState() => _CustomDatePickerRowState();
}

class _CustomDatePickerRowState extends State<CustomDatePickerRow> {
  void _showDatePicker(BuildContext context, bool isFromDate) {
    BottomPicker.date(
      pickerTitle: Text(
        S.of(context).chooseDate,
        style: TextStyle(
          color: AppColors.kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime.now(),
      maxDateTime: DateTime(2050),
      minDateTime: DateTime(1980),
      displaySubmitButton: false,
      buttonContent: Text(
        S.of(context).select,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.kWhiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
      pickerTextStyle: const TextStyle(
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onSubmit: (dateTime) => _onDateSelected(context, dateTime, isFromDate),
      onChange: (dateTime) => _onDateSelected(context, dateTime, isFromDate),
      bottomPickerTheme: BottomPickerTheme.plumPlate,
      buttonSingleColor: AppColors.kPrimaryColor,
    ).show(context);
  }

  void _onDateSelected(
      BuildContext context, DateTime dateTime, bool isFromDate) {
    if (isFromDate) {
      context.read<StatementsCubit>().setFromDate(dateTime);
    } else {
      context.read<StatementsCubit>().setToDate(dateTime);
    }

    if (context.read<StatementsCubit>().profileDropValue == null) {
      AppFunctions.showErrorORWarningDialog(
        noBtn: '',
        fctNO: () {},
        context: context,
        okBtn: S.of(context).ok,
        subtitle: S.of(context).choose_profile,
        fct: () {},
      );
    } else {
      _fetchStatements(context);
    }
  }

  Future<void> _fetchStatements(BuildContext context) async {
    await context.read<StatementsCubit>().fetchStatements(
          page: context.read<StatementsCubit>().profileDropValue!,
          accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
        );
    if (context.read<StatementsCubit>().tableData.isEmpty) {
      customSnackBar(
        context: context,
        text: S.of(context).no_statements,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatementsCubit, StatementsState>(
      listener: (context, state) {
        if (state is ErrorStatementsState ||
            state is ErrorFetchPagesStatementsState) {
          customSnackBar(
            context: context,
            text: S.of(context).network_error,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        final fromDate = context.read<StatementsCubit>().fromDate;
        final toDate = state is SetToDateState ? state.toDate : null;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDatePickerButton(
              context,
              widget.firstButtonText,
              fromDate,
              true,
            ),
            _buildDatePickerButton(
              context,
              widget.secondButtonText,
              toDate,
              false,
            ),
          ],
        );
      },
    );
  }

  Widget _buildDatePickerButton(
    BuildContext context,
    String buttonText,
    DateTime? date,
    bool isFromDate,
  ) {
    return GestureDetector(
      onTap: () => _showDatePicker(context, isFromDate),
      child: Container(
        width: AppConstant.deviceWidth(context) / 2.5,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Iconsax.calendar_1_outline,
                  color: AppColors.kPrimaryColor,
                ),
                Spacing.horizontalSpace(10),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            if (date != null)
              Text(
                DateFormat('d-M-yyyy').format(date),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
