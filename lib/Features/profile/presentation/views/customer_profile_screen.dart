import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:alzilzal/Core/themes/colors/app_colors.dart';
import 'package:alzilzal/Core/widgets/custom_button.dart';
import 'package:alzilzal/Core/widgets/loading_page.dart';
import 'package:alzilzal/Features/auth/presentation/views/login_screen.dart';
import 'package:alzilzal/Features/profile/presentation/views/edite_profile_screen.dart';
import 'package:alzilzal/Features/profile/presentation/views/widgets/about_us_screen.dart';
import 'package:alzilzal/Features/profile/presentation/views/widgets/custom_list_tile.dart';
import 'package:alzilzal/Features/profile/presentation/views/widgets/profile_custome_user_data.dart';
import 'package:alzilzal/config/route_path.dart';
import 'package:alzilzal/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/constatnts/app_functions.dart';
import '../../../../../Core/constatnts/assets_manager.dart';
import '../../../../../Core/themes/theme_provider.dart';
import '../../../../Core/constatnts/app_keys.dart';
import '../../../../Core/helpers/cachehelper.dart';
import '../../../../Core/helpers/service_locator.dart';
import '../../../../Core/widgets/custom_snack_bar.dart';
import '../../data/repos/profile_repo_imp.dart';
import '../controller/login_cubit/profile_cubit.dart';
import 'complains_screen.dart';

class GeneralProfileScreen extends StatefulWidget {
  const GeneralProfileScreen({super.key});

  @override
  State<GeneralProfileScreen> createState() => _GeneralProfileScreenState();
}

class _GeneralProfileScreenState extends State<GeneralProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => ProfileCubit(getIt.get<ProfileRepoImpl>())
        ..fetchUserInfo(
          accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
        ),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is SuccessLogoutProfileState) {
            // customSnackBar(
            //   context: context,
            //   text: S.of(context).login_Success,
            //   color: Colors.green,
            // );
          } else if (state is ErrorLogoutProfileState) {
            // customSnackBar(
            //   context: context,
            //   text: S.of(context).login_error,
            //   color: Colors.red,
            // );
          } else if (state is ErrorFetchInfoProfileState) {
            customSnackBar(
              context: context,
              text: S.of(context).network_error,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          Future refresh() async {
            cubit.fetchUserInfo(
              accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
            );
          }

          if (state is LoadingFetchInfoProfileState ||
              state is LoadingLogoutProfileState) {
            return const LoadingPage();
          } else if (state is ErrorFetchInfoProfileState) {
            return const LoadingPage();
          } else {
            return RefreshIndicator(
              onRefresh: refresh,
              color: MyColors.goldenColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0.h,
                        right: 10.w,
                      ),
                      child: Column(
                        children: [
                          if (cubit.userInfoModel != null)
                            ProfileCustomUserData(
                              userName:
                                  cubit.userInfoModel?.fullName ?? "No name",
                              userPhone:
                                  cubit.userInfoModel?.mobile ?? 'No phone',
                              userImage: cubit.userInfoModel?.pic ?? 'No image',
                            ),
                          Spacing.verticalSpace(15),
                          CustomButton(
                            w: 0.6,
                            h: 0.12,
                            fnc: () {
                              AppFunctions.pushTo(
                                  context: context,
                                  screen: EditeProfileScreen(
                                      name: cubit.userInfoModel!.fullName,
                                      phone: cubit.userInfoModel!.mobile));
                            },
                            child: Text(
                              S.of(context).edite,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.kWhiteColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w,
                        vertical: 24.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).generalSetting),
                          Spacing.verticalSpace(10),
                          CustomListTile(
                            imagePath: AssetsManager.electronics,
                            text: S.of(context).complains,
                            function: () async {
                              AppFunctions.pushTo(
                                context: context,
                                screen: const ViewComplainsScreen(),
                              );
                            },
                          ),
                          CustomListTile(
                            imagePath: AssetsManager.cosmetics,
                            text: S.of(context).aboutUs,
                            function: () async {
                              AppFunctions.pushTo(
                                context: context,
                                screen: const AboutUsScreen(),
                              );
                            },
                          ),
                          if ('client' ==
                              CacheHelper.getDate(key: AppKeys.userRoleKey))
                            CustomListTile(
                              imagePath: AssetsManager.withRepRecievingImage,
                              text: S.of(context).requestAReceiptRepresentative,
                              function: () {
                                context.navigateToWidgetByNamed(context,
                                    RoutePath.requestReceiptRepresentative);
                              },
                            ),
                          const Divider(
                            thickness: 1,
                          ),
                          Spacing.verticalSpace(13),
                          Text(S.of(context).setting),
                          Spacing.verticalSpace(10),
                          Directionality(
                            textDirection: AppFunctions.isArabic()
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            child: SwitchListTile(
                              secondary: const Icon(Icons.translate),
                              title: Text(
                                themeProvider.getIsArabic == 'ar'
                                    ? S.of(context).transToEnglish
                                    : S.of(context).transToArabic,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              value: themeProvider.getIsArabic == 'ar'
                                  ? false
                                  : true,
                              onChanged: (value) {
                                themeProvider.setArabic(
                                    translate: value ? 'en' : 'ar');
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            onTap: () async {
                              cubit
                                  .logoutFunction(
                                refreshToken: CacheHelper.getDate(
                                    key: AppKeys.refreshTokenKey),
                                accessToken: CacheHelper.getDate(
                                    key: AppKeys.accessTokenKey),
                              )
                                  .then((value) {
                                AppFunctions.pushAndRemove(
                                    context: context,
                                    screen: const LoginScreen());
                              });
                            },
                            leading: Image.asset(
                              AssetsManager.logout,
                              height: 30,
                            ),
                            title: Text(
                              S.of(context).logout,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            trailing: Icon(AppFunctions.isArabic()
                                ? IconlyLight.arrowLeft2
                                : IconlyLight.arrowRight2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
