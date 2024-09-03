import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../Core/constatnts/app_functions.dart';
import '../../../../../Core/constatnts/colors.dart';

class ProfileCustomUserData extends StatelessWidget {
  const ProfileCustomUserData(
      {Key? key,
      required this.userName,
      required this.userPhone,
      required this.userImage})
      : super(key: key);

  final String userName;
  final String userPhone;
  final String userImage;
  @override
  Widget build(BuildContext context) {
    return AppFunctions.isArabic()
        ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    border: Border.all(
                      color: MyColors
                          .goldenColor, //Colors.blue[300]!, //MyColors.buttonsColor,
                      width: 3,
                    ),
                  ),
                  child: CachedNetworkImage(
                    width: 65,
                    imageUrl: userImage,
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: MyColors.buttonsColor,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(FontAwesomeIcons.user),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      userPhone,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    border: Border.all(
                      color: Colors.blue[300]!, //MyColors.buttonsColor,
                      width: 3,
                    ),
                  ),
                  child: CachedNetworkImage(
                    width: 65,
                    imageUrl: userImage,
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: MyColors.buttonsColor,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(FontAwesomeIcons.user),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      userPhone,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
