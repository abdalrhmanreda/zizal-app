import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/app_keys.dart';
import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Core/helpers/cachehelper.dart';
import 'package:alzilzal/Core/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../generated/l10n.dart';
import '../../../../Core/constatnts/assets_manager.dart';
import '../../../../Core/widgets/custom_snack_bar.dart';
import '../../../orders/data/models/complain_model.dart';
import '../../data/repos/profile_repo_imp.dart';

class ViewComplainsScreen extends StatefulWidget {
  const ViewComplainsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewComplainsScreen> createState() => _ViewComplainsScreenState();
}

class _ViewComplainsScreenState extends State<ViewComplainsScreen> {
  bool isLoading = false;
  List<ComplainModel> complains = [];

  void fetchComplains({
    required String clientId,
  }) {
    setState(() {
      isLoading = true;
    });

    ProfileRepoImpl()
        .fetchComplains(
      clientId: clientId,
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
        print(l);
      }, (r) {
        setState(() {
          isLoading = false;
        });
        // customSnackBar(
        //   context: context,
        //   text: S.of(context).ok,
        //   color: Colors.green,
        // );
        print("complains ++++++++++");
        setState(() {
          complains = r;
        });

        print(complains);
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      print(error);
      customSnackBar(
        context: context,
        text: S.of(context).network_error,
        color: Colors.red,
      );
    });
  }

  @override
  void initState() {
    fetchComplains(
        clientId: CacheHelper.getDate(key: AppKeys.userId).toString() ?? "5");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (complains.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            S.of(context).complains,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  //shrinkWrap: false,
                  //physics: NeverScrollableScrollPhysics(),
                  reverse: false,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ComplainItem(
                    orderNum: complains[index].order.toString(),
                    complain: complains[index].complain.toString(),
                    status: complains[index].status.toString(),
                    date: complains[index].createdAt.toString(),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: complains.length,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (isLoading == true) {
      return const LoadingPage();
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            S.of(context).complains,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Column(
          children: [
            Container(
              width: AppVariables.appSize(context).width,
              height: AppVariables.appSize(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsManager.productBg),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context).no_complains,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
    }
  }
}

class ComplainItem extends StatelessWidget {
  const ComplainItem({
    Key? key,
    required this.orderNum,
    required this.complain,
    required this.status,
    required this.date,
  }) : super(key: key);

  final String orderNum;
  final String complain;
  final String status;
  final String date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: AppVariables.appSize(context).width,
        height: AppVariables.appSize(context).width * 0.52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            //color: Colors.grey[700].withOpacity(0.4),
            border: Border.all(
              width: 2,
              color: MyColors.grayColor!,
            )),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${S.of(context).order} #$orderNum",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: AppVariables.appSize(context).width * 0.2,
                child: Text(
                  complain,
                  //S.of(context).On_the_way_with_the_representative,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textDirection: AppFunctions.isArabic()
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                status,
                //S.of(context).On_the_way_with_the_representative,
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: MyColors.buttonsColor,
                ),
              ),
              const Spacer(),
              Text(
                AppFunctions.formatCreateDateAndTime(dateTime: date),
                //S.of(context).On_the_way_with_the_representative,
                style: GoogleFonts.cairo(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
