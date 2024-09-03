import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../Core/constatnts/variables.dart';

class BannerLoadingWidget extends StatelessWidget {
  const BannerLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      child: Container(
        height: AppVariables.appSize(context).height * 0.24,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
