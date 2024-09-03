import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../Core/constatnts/variables.dart';

class OrdersStatusLoading extends StatelessWidget {
  const OrdersStatusLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, index) => Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: Colors.grey[600]!,
        highlightColor: Colors.white,
        child: Container(
          height: AppVariables.appSize(context).width * 0.34,
          width: AppVariables.appSize(context).width * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[700],
          ),
        ),
      ),
      itemCount: 11,
      crossAxisCount: 3,
    );
  }
}
