import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Features/customer/create_order/presentation/widgets/create_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../controller/order_cubit/order_cubit.dart';

class CreateOrderInput extends StatefulWidget {
  const CreateOrderInput({
    super.key,
  });

  @override
  State<CreateOrderInput> createState() => _CreateOrderInputState();
}

class _CreateOrderInputState extends State<CreateOrderInput> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.verticalSpace(20),
            Text(
              S.of(context).receiverInfo,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.kPrimaryColor,
                  ),
            ),
            Spacing.verticalSpace(10),
            //اسم الزبون
            CreateOrderItem(
              inputType: TextInputType.text,
              controller: context.read<OrderCubit>().clientNameController,
              title: S.of(context).client_name,
              label: S.of(context).abdalrhman,
              maxLine: 1,
            ),
            Spacing.verticalSpace(15),
            //رقم الزبون
            CreateOrderItem(
              inputType: TextInputType.phone,
              controller: context.read<OrderCubit>().clientPhoneController,
              title: S.of(context).client_phone,
              label: '+9644721722',
              maxLine: 1,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).empty_field;
                }
                if (value.length != 11) {
                  return S
                      .of(context)
                      .invalid_phone; // Add this key in your localization file
                }
                return null;
              },
            ),
            Spacing.verticalSpace(20),
            CreateOrderItem(
              inputType: TextInputType.streetAddress,
              controller: context.read<OrderCubit>().addressController,
              title: S.of(context).address,
              label: S.of(context).address,
              maxLine: 1,
            ),

            Spacing.verticalSpace(20),
            //اقرب نقطة
            CreateOrderItem(
              inputType: TextInputType.text,
              controller: context.read<OrderCubit>().nearestPointController,
              title: S.of(context).nearest_point,
              label: S.of(context).address_hint,
              maxLine: 3,
            ),
            Spacing.verticalSpace(20),
            Text(
              S.of(context).aboutOrder,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.kPrimaryColor,
                  ),
            ),
            Spacing.verticalSpace(10),
            //السعر
            CreateOrderItem(
              inputType: TextInputType.number,
              controller: context.read<OrderCubit>().priceController,
              title: S.of(context).price,
              label: '1000',
              maxLine: 1,
            ),
            Spacing.verticalSpace(20),
            //العدد
            CreateOrderItem(
              inputType: TextInputType.number,
              controller: context.read<OrderCubit>().theNumberController,
              title: S.of(context).count,
              label: '1',
              maxLine: 1,
            ),
            Spacing.verticalSpace(20),
            //النوع
            CreateOrderItem(
              inputType: TextInputType.text,
              controller: context.read<OrderCubit>().typeController,
              title: S.of(context).amountType,
              label: S.of(context).type_hint,
              maxLine: 1,
            ),
            Spacing.verticalSpace(20),
            //الملاحظات
            CreateOrderItem(
              inputType: TextInputType.text,
              controller: context.read<OrderCubit>().notesController,
              title: S.of(context).notes,
              label: S.of(context).notes,
              maxLine: 3,
            ),
            Spacing.verticalSpace(20),
          ],
        );
      },
    );
  }
}
