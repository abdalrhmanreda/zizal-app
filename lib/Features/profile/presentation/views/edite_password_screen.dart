import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Features/profile/data/models/change_pass_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Core/constatnts/colors.dart';
import '../../../../Core/themes/colors/app_colors.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/repos/profile_repo_imp.dart';

class EditePassScreen extends StatefulWidget {
  const EditePassScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditePassScreen> createState() => _EditePassScreenState();
}

class _EditePassScreenState extends State<EditePassScreen> {
  late TextEditingController oldController;
  late TextEditingController newController;
  final formKey = GlobalKey<FormState>();

  bool isNotSee = true;
  bool isNotSee2 = true;
  bool loading = false;

  ChangePassModel? changePassModel;

  @override
  void initState() {
    oldController = TextEditingController(text: '');
    newController = TextEditingController(text: '');

    super.initState();
  }

  @override
  void dispose() {
    oldController.dispose();
    newController.dispose();
    super.dispose();
  }

  void changePass({
    required String oldPass,
    required String newPass,
  }) async {
    setState(() {
      loading = true;
    });

    ProfileRepoImpl()
        .changePass(
      accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
      oldPass: oldPass,
      newPass: newPass,
    )
        .then((value) {
      value.fold((l) {}, (r) {
        changePassModel = r;
      });
      setState(() {
        loading = false;
      });
      customSnackBar(
        context: context,
        text: S.of(context).ok,
        color: Colors.green,
      );
      Navigator.pop(context);
    }).catchError((error) {
      print("l.message+++++++++++++");
      print(error.toString());
      setState(() {
        loading = false;
      });

      customSnackBar(
        context: context,
        text: S.of(context).check_pass,
        color: Colors.red,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${S.of(context).edite} ${S.of(context).pass}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 15.w,
            vertical: 15.h,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: oldController,
                  obscureText: isNotSee,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return S.of(context).passRequired;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).old_pass,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isNotSee = !isNotSee;
                          });
                        },
                        icon: Icon(
                          isNotSee
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey[400],
                        )),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                Spacing.verticalSpace(35),
                TextFormField(
                  controller: newController,
                  decoration: InputDecoration(
                    hintText: S.of(context).new_pass,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isNotSee2 = !isNotSee2;
                          });
                        },
                        icon: Icon(
                          isNotSee2
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey[400],
                        )),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return S.of(context).passRequired;
                    } else if (value.length < 8) {
                      return S.of(context).pass_is_too_short;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                Spacing.verticalSpace(40),
                if (loading == true) ...[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: CircularProgressIndicator(
                        color: MyColors.buttonsColor!,
                      ),
                    ),
                  ),
                ],
                Center(
                  child: CustomButton(
                    w: 0.6,
                    h: 0.12,
                    fnc: () {
                      if (formKey.currentState!.validate()) {
                        print(oldController.text);
                        print(newController.text);
                        changePass(
                          oldPass: oldController.text,
                          newPass: newController.text,
                        );
                      }
                    },
                    child: Text(
                      S.of(context).edite,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kWhiteColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
