import 'package:flutter/material.dart';

import '../../../../../Core/constatnts/assets_manager.dart';
import '../../../../../Core/constatnts/variables.dart';
import '../../../../../generated/l10n.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).aboutUs,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AssetsManager.appLogo2,
                  fit: BoxFit.cover,
                  height: AppVariables.appSize(context).width * 0.5,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'شركة الزلزال :',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
              Text(
                'شركة توصيل  مختصة بتوصيل الطلبات  داخل العراق .',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '-الشركة مسؤلة عن توصيل الطلبات فقط .',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '-يتحمل العميل مسؤلية محتويات الطلب كاملاً .',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '-الشركة مسجلة رسمياً في وزارة التجارة - دائرة مسجل الشركاتً .',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
