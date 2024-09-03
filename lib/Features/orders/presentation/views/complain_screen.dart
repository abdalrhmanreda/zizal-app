import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../Core/widgets/custom_button.dart';
import '../../../../../../Core/widgets/custom_snack_bar.dart';
import '../../../../../../generated/l10n.dart';
import '../../../customer/create_order/data/repos/order_repo_imp.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();

  final String orderId;
}

class _ComplainScreenState extends State<ComplainScreen> {
  late TextEditingController dataController;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    dataController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    dataController.dispose();
    super.dispose();
  }

  void makeComplain({
    required String accessToken,
    required String complain,
    required String orderId,
  }) {
    setState(() {
      isLoading = true;
    });

    OrderRepoImpl()
        .makeComplain(
      accessToken: accessToken,
      complain: complain,
      orderId: orderId,
    )
        .then((value) {
      value.fold((l) {
        setState(() {
          isLoading = false;
        });
        customSnackBar(
          context: context,
          text: S.of(context).network_error,
          color: Colors.red,
        );
      }, (r) {
        setState(() {
          isLoading = false;
        });
        customSnackBar(
          context: context,
          text: S.of(context).ok,
          color: Colors.green,
        );
        Navigator.pop(context);
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      customSnackBar(
        context: context,
        text: S.of(context).network_error,
        color: Colors.red,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).make_complain,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppVariables.appSize(context).width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: dataController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return S.of(context).empty_field;
                    }
                    return null;
                  },
                  textDirection: AppFunctions.isArabic()
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  maxLines: 4, // Optional - for multiline input
                  textInputAction: TextInputAction.send,
                  decoration: InputDecoration(
                    labelText: S.of(context).complain_hint,
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: MyColors.grayColor!,
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (isLoading == true) ...[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CircularProgressIndicator(
                      color: MyColors.buttonsColor!,
                    ),
                  ),
                ),
              ],
              CustomButton(
                fnc: () {
                  if (formKey.currentState!.validate()) {
                    makeComplain(
                      accessToken:
                          CacheHelper.getDate(key: AppKeys.accessTokenKey),
                      complain: dataController.text,
                      orderId: widget.orderId,
                    );
                  }
                },
                w: 0.7,
                h: 0.11,
                child: Text(
                  S.of(context).make_complain,
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
