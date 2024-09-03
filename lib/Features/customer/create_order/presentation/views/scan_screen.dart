import 'package:alzilzal/Core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../config/route_path.dart';
import '../../data/models/scan_screen_arguments.dart'; // Import your localization file

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool isScanCompleted = false;
  String? scannedCode; // State to hold the scanned code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).scanQRCode), // Localized title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              height:
                  MediaQuery.of(context).size.height / 2.5, // Adjust as needed
              width: MediaQuery.of(context).size.width, // Adjust as needed
              child: MobileScanner(
                fit: BoxFit.cover,
                controller: MobileScannerController(
                  detectionTimeoutMs: 250,
                  autoStart: true,
                ),
                onDetect: (capture) {
                  if (!isScanCompleted) {
                    final List<Barcode> barcodes = capture.barcodes;
                    for (final barcode in barcodes) {
                      debugPrint('Barcode found! ${barcode.rawValue}');
                      setState(() {
                        scannedCode = barcode.rawValue; // Update scanned code
                      });
                    }
                    isScanCompleted = true;
                    context.navigateAndReplacement(
                      context,
                      RoutePath.createOrderScreen,
                      arguments: ScanScreenArguments(
                        isQrCode: true,
                        qrCode: scannedCode,
                      ),
                    );
                  }
                },
                startDelay: true,
                overlay: QRScannerOverlay(
                  borderRadius: 10,
                  scanAreaHeight: MediaQuery.of(context).size.height,
                  scanAreaWidth: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            if (scannedCode != null) // Display scanned code if available
              Text(
                '${S.of(context).orderNumber} $scannedCode', // Localized text
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
