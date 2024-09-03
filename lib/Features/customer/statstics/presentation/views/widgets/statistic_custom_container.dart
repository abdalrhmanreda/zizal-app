import 'package:flutter/material.dart';

import '../../../../../../Core/constatnts/variables.dart';

class StatisticsCustomContainer extends StatelessWidget {
  const StatisticsCustomContainer(
      {Key? key, required this.title, required this.num, required this.color})
      : super(key: key);

  final String title;
  final String num;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppVariables.appSize(context).width,
      height: AppVariables.appSize(context).width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          SizedBox(
            height: AppVariables.appSize(context).width * 0.05,
          ),
          Text(
            num,
            style: Theme.of(context).textTheme.labelLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
