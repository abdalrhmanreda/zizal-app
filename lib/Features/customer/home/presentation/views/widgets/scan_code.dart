// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
//
// import '../../../../../../generated/l10n.dart';
//
// class QRCodeScannerDialog extends StatefulWidget {
//   final void Function(String code)? onCodeScanned;
//
//   const QRCodeScannerDialog({Key? key, this.onCodeScanned}) : super(key: key);
//
//   @override
//   _QRCodeScannerDialogState createState() => _QRCodeScannerDialogState();
// }
//
// class _QRCodeScannerDialogState extends State<QRCodeScannerDialog> {
//   bool isScanCompleted = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       content: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         height: 350.h, // Define the height explicitly
//         width: double.maxFinite, // Make it full width
//         child: MobileScanner(
//           fit: BoxFit.cover,
//           controller: MobileScannerController(
//             detectionTimeoutMs: 250,
//             autoStart: true,
//           ),
//           onDetect: (capture) {
//             if (!isScanCompleted) {
//               String? code;
//               final List<Barcode> barcodes = capture.barcodes;
//               final Uint8List? image = capture.image;
//               for (final barcode in barcodes) {
//                 debugPrint('Barcode found! ${barcode.rawValue}');
//                 code = barcode.rawValue;
//               }
//               isScanCompleted = true;
//               if (widget.onCodeScanned != null) {
//                 widget.onCodeScanned!(code!);
//               }
//               Navigator.pop(context); // Close the dialog after scanning
//             }
//           },
//           startDelay: true,
//           overlay: QRScannerOverlay(
//             borderRadius: 10,
//             scanAreaHeight: 350.h,
//             scanAreaWidth: MediaQuery.of(context).size.width,
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text(S.of(context).ok,
//               style: Theme.of(context).textTheme.bodyMedium),
//         ),
//       ],
//     );
//   }
// }
//
// void showQRCodeScannerDialog(BuildContext context,
//     {void Function(String code)? onCodeScanned}) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return QRCodeScannerDialog(onCodeScanned: onCodeScanned);
//     },
//   );
// }
