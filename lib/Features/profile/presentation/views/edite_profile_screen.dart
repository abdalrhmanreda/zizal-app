import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../Core/constatnts/app_keys.dart';
import '../../../../Core/constatnts/colors.dart';
import '../../../../Core/helpers/cachehelper.dart';
import '../../../../Core/themes/colors/app_colors.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/repos/profile_repo_imp.dart';
import 'edite_password_screen.dart';

class EditeProfileScreen extends StatefulWidget {
  const EditeProfileScreen({Key? key, required this.name, required this.phone})
      : super(key: key);

  final String name;
  final String phone;
  @override
  State<EditeProfileScreen> createState() => _EditeProfileScreenState();
}

class _EditeProfileScreenState extends State<EditeProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  final formKey = GlobalKey<FormState>();

  bool loading = false;
  void changeNamePhone({
    required String name,
    required String phone,
    required String accessToken,
  }) async {
    setState(() {
      loading = true;
    });

    ProfileRepoImpl()
        .changeNameOrPhone(
      accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
      name: name,
      phone: phone,
    )
        .then((value) {
      value.fold((l) {
        setState(() {
          loading = false;
        });

        customSnackBar(
          context: context,
          text: S.of(context).network_error,
          color: Colors.red,
        );
      }, (r) {
        setState(() {
          loading = false;
        });
        customSnackBar(
          context: context,
          text: S.of(context).ok,
          color: Colors.green,
        );
        //Navigator.pop(context);
      });
    }).catchError((error) {
      setState(() {
        loading = false;
      });

      customSnackBar(
        context: context,
        text: S.of(context).network_error,
        color: Colors.red,
      );
    });
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).edite,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).user_name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: S.of(context).user_name,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Spacing.verticalSpace(25),
                Text(
                  S.of(context).user_phone,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
                ),
                Spacing.verticalSpace(10),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: S.of(context).user_phone,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
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
                        changeNamePhone(
                          name: nameController.text,
                          phone: phoneController.text,
                          accessToken:
                              CacheHelper.getDate(key: AppKeys.accessTokenKey),
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
                Spacing.verticalSpace(20),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: CustomButton(
                    w: 0.6,
                    h: 0.12,
                    fnc: () {
                      AppFunctions.pushTo(
                          context: context, screen: const EditePassScreen());
                    },
                    child: Text(
                      "${S.of(context).edite} ${S.of(context).pass}",
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
