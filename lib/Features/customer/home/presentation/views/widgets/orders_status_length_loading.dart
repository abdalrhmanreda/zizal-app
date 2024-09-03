import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../Core/constatnts/variables.dart';

class OrdersStatusLoading extends StatelessWidget {
  const OrdersStatusLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          period: const Duration(seconds: 2),
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.white,
          child: Container(
            width: AppVariables.appSize(context).width,
            height: AppVariables.appSize(context).width * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        DynamicHeightGridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          builder: (context, index) => Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.white,
            child: Container(
              width: AppVariables.appSize(context).width * 0.45,
              height: AppVariables.appSize(context).width * 0.38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
            ),
          ),
          itemCount: 11,
          crossAxisCount: 2,
        ),
      ],
    );
  }
}
