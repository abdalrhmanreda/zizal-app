import 'dart:io';

import 'package:alzilzal/Core/components/custom_button.dart';
import 'package:alzilzal/Core/components/progress_indector.dart';
import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Features/sort_staff/presentation/views/sort_staff_layout_screen.dart';
import 'package:alzilzal/generated/l10n.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/components/toast.dart';
import '../../../../Core/helpers/service_locator.dart';
import '../../../customer/layout/presentation/views/customer_layout_screen.dart';
import '../../../receiving_representative/home/presentation/views/receiving_layout_screen.dart';
import '../../../sending_representative/layout/presentation/views/sending_rep_layout_screen.dart';
import '../../data/repos/login_repo_imp.dart';
import '../controller/login_cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  late TextEditingController passController;

  final formKey = GlobalKey<FormState>();
  String? fcmToken;

  bool isNotSee = true;
  var fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    phoneController = TextEditingController();
    passController = TextEditingController();
    fcm.getToken().then((token) {
      print("FCM token =>");
      print(token);
      fcmToken = token;
    });
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            showToast(
              message: S.of(context).login_Success,
              state: ToastState.SUCCESS,
            );
          } else if (state is ErrorLoginState) {
            showToast(
              message: S.of(context).login_error,
              state: ToastState.ERROR,
            );
          } else if (state is ErrorAddFCMLoginState ||
              state is ErrorCreateFCMLoginState) {
            showToast(
              message: S.of(context).network_error,
              state: ToastState.ERROR,
            );
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).logIn,
                        textAlign: AppFunctions.isArabic()
                            ? TextAlign.right
                            : TextAlign.left,
                        textDirection: AppFunctions.isArabic()
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                            ),
                      ),
                      Spacing.verticalSpace(20),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: S.of(context).phoneNum,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return S.of(context).phoneNumRequired;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      Spacing.verticalSpace(30),
                      TextFormField(
                        controller: passController,
                        decoration: InputDecoration(
                          hintText: S.of(context).pass,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isNotSee = !isNotSee;
                              });
                            },
                            icon: Icon(
                              isNotSee
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return S.of(context).passRequired;
                          }
                          return null;
                        },
                        obscureText: isNotSee,
                      ),
                      Spacing.verticalSpace(
                          AppConstant.deviceHeight(context) / 2),
                      state is LoadingLoginState
                          ? const Center(child: CustomLoadingIndicator())
                          : Center(
                              child: CustomAppButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    cubit
                                        .loginFunction(
                                      phoneOrEmail: phoneController.text,
                                      pass: passController.text,
                                    )
                                        .then((value) {
                                      if (cubit.loginModel?.fcmToken == null ||
                                          cubit.loginModel?.fcmToken ==
                                              "fcm_token") {
                                        if (Platform.isAndroid) {
                                          cubit
                                              .addFcmFunc(
                                            accessToken: CacheHelper.getDate(
                                                key: AppKeys.accessTokenKey),
                                            fcmToken: fcmToken!,
                                          )
                                              .then((value) {
                                            cubit
                                                .createFcmDevice(
                                              name: cubit.loginModel!.fullName,
                                              type: 'android',
                                              fcmToken: fcmToken!,
                                            )
                                                .then((value) {
                                              ///Todo add all roles conditions to navigate to its screens
                                              if (cubit.loginModel!.role ==
                                                  'sort_staff') {
                                                AppFunctions.pushAndRemove(
                                                  context: context,
                                                  screen:
                                                      const SortStaffLayoutScreen(),
                                                );
                                              } else if (cubit
                                                      .loginModel!.role ==
                                                  'Distribution representative') {
                                                AppFunctions.pushAndRemove(
                                                  context: context,
                                                  screen:
                                                      const SendingRepLayoutScreen(),
                                                );
                                              } else if (cubit
                                                      .loginModel!.role ==
                                                  'Receiving representative') {
                                                AppFunctions.pushAndRemove(
                                                  context: context,
                                                  screen:
                                                      const ReceivingLayoutScreen(),
                                                );
                                              } else if (cubit
                                                          .loginModel!.role ==
                                                      'client' ||
                                                  cubit.loginModel!.role ==
                                                      'client_assistant' ||
                                                  cubit.loginModel!.role ==
                                                      "follow up") {
                                                AppFunctions.pushAndRemove(
                                                  context: context,
                                                  screen:
                                                      const UserLayoutScreen(),
                                                );
                                              }
                                            });
                                          });
                                        } else if (Platform.isIOS) {
                                          cubit
                                              .addFcmFunc(
                                            accessToken: CacheHelper.getDate(
                                                key: AppKeys.accessTokenKey),
                                            fcmToken: fcmToken!,
                                          )
                                              .then((value) {
                                            cubit
                                                .createFcmDevice(
                                              name: cubit.loginModel!.fullName,
                                              type: 'ios',
                                              fcmToken: fcmToken!,
                                            )
                                                .then((value) {
                                              ///Todo add all roles conditions to navigate to its screens
                                              if (cubit.loginModel!.role ==
                                                  'sort_staff') {
                                                AppFunctions.pushAndRemove(
                                                  context: context,
                                                  screen:
                                                      const SortStaffLayoutScreen(),
                                                );
                                              } else if (cubit
                                                      .loginModel!.role ==
                                                  'Distribution representative') {
                                                AppFunctions.pushAndRemove(
                                                  context: context,
                                                  screen:
                                                      const SendingRepLayoutScreen(),
                                                );
                                              } else if (cubit
                                                      .loginModel!.role ==
                                                  'Receiving representative') {
                                                AppFunctions.pushAndRemove(
                                                  context: context,
                                                  screen:
                                                      const ReceivingLayoutScreen(),
                                                );
                                              } else if (cubit
                                                          .loginModel!.role ==
                                                      'client' ||
                                                  cubit.loginModel!.role ==
                                                      'client_assistant' ||
                                                  cubit.loginModel!.role ==
                                                      "follow up") {
                                                AppFunctions.pushAndRemove(
                                                  context: context,
                                                  screen:
                                                      const UserLayoutScreen(),
                                                );
                                              }
                                            });
                                          });
                                        }
                                      } else {
                                        ///Todo navigate to screen by role
                                        if (cubit.loginModel!.role ==
                                            'sort_staff') {
                                          AppFunctions.pushAndRemove(
                                            context: context,
                                            screen:
                                                const SortStaffLayoutScreen(),
                                          );
                                        } else if (cubit.loginModel!.role ==
                                            'Distribution representative') {
                                          AppFunctions.pushAndRemove(
                                            context: context,
                                            screen:
                                                const SendingRepLayoutScreen(),
                                          );
                                        } else if (cubit.loginModel!.role ==
                                            'Receiving representative') {
                                          AppFunctions.pushAndRemove(
                                            context: context,
                                            screen:
                                                const ReceivingLayoutScreen(),
                                          );
                                        } else if (cubit.loginModel!.role ==
                                                'client' ||
                                            cubit.loginModel!.role ==
                                                'client_assistant' ||
                                            cubit.loginModel!.role ==
                                                'follow up') {
                                          AppFunctions.pushAndRemove(
                                            context: context,
                                            screen: const UserLayoutScreen(),
                                          );
                                        }
                                      }
                                    });
                                  }
                                },
                                text: S.of(context).logIn,
                                height: 50.h,
                                width: AppConstant.deviceWidth(context) / 1.5,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.kWhiteColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
