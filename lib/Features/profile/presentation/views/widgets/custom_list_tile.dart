import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../Core/constatnts/app_functions.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          AppFunctions.isArabic() ? TextDirection.rtl : TextDirection.ltr,
      child: ListTile(
        onTap: () {
          function();
        },
        leading: Image.asset(
          imagePath,
          height: 30,
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Icon(AppFunctions.isArabic()
            ? IconlyLight.arrowLeft2
            : IconlyLight.arrowRight2),
      ),
    );
  }
}
