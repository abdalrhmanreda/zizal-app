import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Features/sending_representative/home/data/models/rep_orders_model.dart';
import 'package:alzilzal/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constatnts/app_functions.dart';
import '../../../../../generated/l10n.dart';
import '../../../orders/presentation/views/sending_rep_order_details_screen.dart';
import '../../../orders/presentation/views/widgets/orders_by_status_item.dart';

class OrdersByStatusScreen extends StatelessWidget {
  const OrdersByStatusScreen(
      {Key? key, required this.title, required this.ordersList})
      : super(key: key);

  final String title;
  final List<InTheWayOrders> ordersList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ordersList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesBox,
                  width: 150.w,
                  height: 150.h,
                ),
                Spacing.verticalSpace(25),
                Center(
                  child: Text(
                    S.of(context).thereIsNoOrders,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20.sp,
                        ),
                  ),
                ),
              ],
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  AppFunctions.pushTo(
                    context: context,
                    screen: SendingRepOrderDetailsScreen(
                      order: ordersList[index],
                    ),
                  );
                },
                child: OrdersByStatusItem(
                  order: ordersList[index],
                ),
              ),
              separatorBuilder: (context, index) => Spacing.verticalSpace(25),
              itemCount: ordersList.length,
            ),
    );
  }
}
