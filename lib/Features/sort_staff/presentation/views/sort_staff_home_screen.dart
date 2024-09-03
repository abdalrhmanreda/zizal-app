import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constatnts/colors.dart';
import '../../../../../Core/constatnts/variables.dart';
import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../../generated/assets.dart';
import '../../data/repos/sort_staff_repo_imp.dart';
import '../controller/sort_staff_cubit.dart';

class SortStaffHomeScreen extends StatefulWidget {
  const SortStaffHomeScreen({Key? key}) : super(key: key);

  @override
  State<SortStaffHomeScreen> createState() => _SortStaffHomeScreenState();
}

class _SortStaffHomeScreenState extends State<SortStaffHomeScreen> {
  late TextEditingController barcodeController;

  @override
  void initState() {
    barcodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    barcodeController.dispose();
    super.dispose();
  }

  String? _scanBarcodeResult;
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SortStaffCubit(getIt.get<SortStaffRepoImpl>()),
      child: BlocConsumer<SortStaffCubit, SortStaffState>(
        listener: (context, state) {
          if (state is ErrorReceivingPackageState) {
            customSnackBar(
              context: context,
              text: S.of(context).network_error,
              color: Colors.red,
            );
          }
          if (state is SuccessReceivingPackageState) {
            customSnackBar(
              context: context,
              text: S.of(context).packageWaitForTransporter,
              color: Colors.green,
            );
          }
        },
        builder: (context, state) {
          SortStaffCubit cubit = SortStaffCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  if (_scanBarcodeResult != null) ...[
                    Container(
                      width: AppVariables.appSize(context).width * 0.75,
                      height: AppVariables.appSize(context).width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: MyColors.grayColor!,
                        ),
                      ),
                      child: BarcodeWidget(
                        data: _scanBarcodeResult!,
                        barcode: Barcode.code128(),
                        drawText: true,
                      ),
                    ),
                  ],
                  if (_scanBarcodeResult == null) ...[
                    Image.asset(
                      Assets.iconsQrCode,
                      width: AppVariables.appSize(context).width * 0.5,
                      opacity: const AlwaysStoppedAnimation(0.4),
                    ),
                  ],
                  const SizedBox(
                    height: 50,
                  ),
                  if (state is LoadingReceivingPackageState) ...[
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
                      fnc: () {
                        scanBarcodeNormal().then((value) {
                          cubit.receivingPackage(
                            accessToken: CacheHelper.getDate(
                              key: AppKeys.accessTokenKey,
                            ),
                            code: _scanBarcodeResult!,
                          );
                        });
                      },
                      w: .75,
                      h: 0.15,
                      child: Text(
                        S.of(context).scanQRCode,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18.sp,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (_scanBarcodeResult != null) ...[
                    Center(
                        child: Text(
                            "${S.of(context).barcode_hint} $_scanBarcodeResult")),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
