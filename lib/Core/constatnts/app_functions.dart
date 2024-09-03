import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'assets_manager.dart';

class AppFunctions {
  static String convertEnglishNumberToArabic(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }

  static String formatCreateDateAndTime({required String dateTime}) {
    String originalDateString = dateTime;

    DateTime originalDateTime = DateTime.parse(originalDateString);

    String formattedDate =
        DateFormat('yyyy-MM-dd hh:mm a').format(originalDateTime);
    return formattedDate; // Output: 2023-12-02 07:06 PM
  }

  static String formatUpdateDateString({required String dateTime}) {
    // Parse the ISO 8601 date string
    DateTime dateTime2 = DateTime.parse(dateTime).toLocal();

    // Define the desired output format
    DateFormat outputFormat = DateFormat('yyyy-MM-dd h:mm a');

    // Format the date
    return outputFormat.format(dateTime2);
  }

  static void pushAndRemove({required context, required Widget screen}) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }

  static void pushTo({required context, required Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static List<DropdownMenuItem<String>> get areaDropDownList {
    return AppVariables.citiesMap.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text(entry.value),
      );
    }).toList();
  }

  static List<DropdownMenuItem<String>>? get areaFromGovDropDownList {
    List<DropdownMenuItem<String>> menuItems =
        List<DropdownMenuItem<String>>.generate(
      AppVariables.areaFromGovList.length,
      (index) => DropdownMenuItem(
        value: AppVariables.areaFromGovList[index],
        child: Text(
          AppVariables.areaFromGovList[index],
        ),
      ),
    );
    return menuItems;
  }

  static List<DropdownMenuItem<String>>? get profileDropDownList {
    List<DropdownMenuItem<String>>? menuItems =
        List<DropdownMenuItem<String>>.generate(
      AppVariables.profileList.length,
      (index) => DropdownMenuItem(
        value: AppVariables.profileList[index],
        child: Text(
          AppVariables.profileList[index],
        ),
      ),
    );
    return menuItems;
  }

  static void share(String textToShare, {String subject = ''}) {
    // Share.share(
    //     "$textToShare\n https://play.google.com/store/apps/details?id=at.ahmed1khaled.fastakmapp",
    //     subject: subject);
  }

  static Future<void> showErrorORWarningDialog({
    required BuildContext context,
    required String subtitle,
    required String okBtn,
    required String noBtn,
    required Function fct,
    required Function fctNO,
    bool showNoButton = false,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetsManager.waringImage,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: showNoButton,
                      child: TextButton(
                        onPressed: () {
                          fctNO();
                        },
                        child: Text(
                          noBtn,
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        fct();
                        Navigator.pop(context);
                      },
                      child: Text(
                        okBtn,
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  // static Future<void> sendNotification({
  //   required String title,
  //   required String body,
  //   required String type,
  // }) async {
  //   print("Push Notification -------->");
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization':
  //         'key=AAAAxmGcOwI:APA91bGlwvJHOCYCGF8TNpHFosarYpHfTYLqhq5PjdM3C1sbWhC3NPyA38Hdy6q3OMRSAXEzVCWEJ7WqNCbcj2iBZvJrk7J3zath4OsQF5Eyy1-Vux10ptyQksFTFUxrUEhF4Eu5Qp0C'
  //   };
  //   var data = json.encode({
  //     "to": AppVariables.deviceToken,
  //     "notification": {
  //       "title": title,
  //       "body": body,
  //       "mutable_content": true,
  //       "sound": "Tri-tone"
  //     },
  //     "data": {
  //       "type": type,
  //     }
  //   });
  //   var dio = Dio();
  //   var response = await dio.request(
  //     'https://fcm.googleapis.com/fcm/send',
  //     options: Options(
  //       method: 'POST',
  //       headers: headers,
  //     ),
  //     data: data,
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print(json.encode(response.data));
  //   } else {
  //     print(response.statusMessage);
  //   }
  // }

  static bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  static void addInterceptors(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  static String formatTimestamp(String timestamp) {
    // Parse the input timestamp
    DateTime dateTime = DateTime.parse(timestamp);

    // Define the output format (single digits for day and month)
    DateFormat outputFormat = DateFormat('d-M-yyyy HH:mm:ss');

    // Format the parsed DateTime
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }
}
