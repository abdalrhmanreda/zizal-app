import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:alzilzal/Core/constatnts/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class TestApi extends StatefulWidget {
  const TestApi({Key? key}) : super(key: key);

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  Future<pw.ImageProvider> _loadAssetImage(String path) async {
    final data = await rootBundle.load(path);
    return pw.MemoryImage(
      data.buffer.asUint8List(),
    );
  }

  Future<pw.Document> createInvoicePdf(List<List<String>> data) async {
    final pdf = pw.Document();
    final logo = await _loadAssetImage(AssetsManager.appLogo);

    // pdf.addPage(
    //   pw.Page(
    //     build: (pw.Context context) {
    //       return pw.Column(
    //         crossAxisAlignment: pw.CrossAxisAlignment.start,
    //         children: [
    //           pw.Row(children: [
    //             pw.Image(
    //               logo,
    //               fit: pw.BoxFit.cover,
    //               width: 50,
    //               height: 50,
    //             ),
    //             pw.SizedBox(
    //               width: 5,
    //             ),
    //             pw.Text(
    //               'ALZILZAL',
    //               style: pw.TextStyle(
    //                 color: PdfColors.red,
    //                 fontSize: 28,
    //                 fontWeight: pw.FontWeight.bold,
    //               ),
    //             ),
    //           ]),
    //
    //           // Add more widgets for your invoice data
    //           pw.Text('Date: 2023-12-31'),
    //           pw.Text('Invoice Number: 2000'),
    //           pw.ListView.builder(
    //             itemCount: 10,
    //             itemBuilder: (context, index) {
    //               return pw.Row(
    //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   pw.Text(
    //                       "item.description item.description item.description item.description item.description"),
    //                   pw.Text('{item.amount.toStringAsFixed(2)}'),
    //                 ],
    //               );
    //             },
    //           ),
    //           pw.Divider(),
    //           pw.Align(
    //             alignment: pw.Alignment.centerRight,
    //             child: pw.Text('Total: 1999'),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );
    // Add a page with a table
    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Row(children: [
            pw.Image(
              logo,
              fit: pw.BoxFit.cover,
              width: 50,
              height: 50,
            ),
            pw.SizedBox(
              width: 5,
            ),
            pw.Text(
              'ALZILZAL',
              style: pw.TextStyle(
                color: PdfColors.red,
                fontSize: 28,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ]),
          pw.TableHelper.fromTextArray(
            border: pw.TableBorder(
              top: pw.BorderSide(color: PdfColors.red),
              horizontalInside: pw.BorderSide(color: PdfColors.red),
              bottom: pw.BorderSide(color: PdfColors.red),
              right: pw.BorderSide(color: PdfColors.red),
              left: pw.BorderSide(color: PdfColors.red),
              verticalInside: pw.BorderSide(color: PdfColors.red),
            ),
            data: data,
            headers: ['H1', 'H2', 'H3', 'H4', 'H5'],
            headerDecoration: pw.BoxDecoration(
              color: PdfColors.green,
            ),
            headerStyle: pw.TextStyle(color: PdfColors.red),
            tableDirection: AppFunctions.isArabic()
                ? pw.TextDirection.rtl
                : pw.TextDirection.ltr,
          ),
        ],
      ),
    );

    return pdf;
  }

  List<List<String>> data = [
    <String>[
      'R1',
      'R1',
      'R1',
      'R1',
      'R1',
    ], // Header row
    <String>[
      'R2',
      'R2',
      'R2',
      'R2',
      'R2',
    ], // Header row
  ];

  void _previewPdf() async {
    final pdfDocument = await createInvoicePdf(data);

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfDocument.save(),
      usePrinterSettings: true,
      name: 'Test pdf',
      format: PdfPageFormat.legal,
    );
  }

  @override
  void initState() {
    // AuthRepoImpl()
    //     .loginFunction(phoneOrEmail: '0101112131415', pass: "Aziz@1234");
    //OrderRepoImpl().fetchAreas();
    // OrderRepoImpl().createOrderFunc(
    //   accessToken:
    //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA5MzA5NDIwLCJqdGkiOiJhZmQwMzBjYjhlNWI0YmY5OWQyNzY1NmY2YmI2Y2E4YiIsInVzZXJfaWQiOjV9.teAOSrAxUs-Fi5t8s2PtClOMw1LZ-gNvFaEOGoM-cRE",
    //   customerName: 'abdelrhamn',
    //   customerNumber: "01067106891",
    //   country: "assiut",
    //   address: "assiut",
    //   area: "2",
    //   amount: "50000",
    //   notes: "notes",
    // );

    // ReceivingRepoImpl().createNewPackageFun(
    //   accessToken:
    //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA5MzA5NDIwLCJqdGkiOiJhZmQwMzBjYjhlNWI0YmY5OWQyNzY1NmY2YmI2Y2E4YiIsInVzZXJfaWQiOjV9.teAOSrAxUs-Fi5t8s2PtClOMw1LZ-gNvFaEOGoM-cRE",
    //   code: "123456978456654321",
    // );

    //CustomerHomeRepoImpl().fetchBanners();

    // CustomerOrdersRepoImpl().fetchOrdersByStatus(
    //   status: 'recorded',
    //   accessToken: CacheHelper.getDate(key: AppKeys.accessTokenKey),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // final pdf = createInvoicePdf();
              _previewPdf();
            },
            child: Text('Create and Preview Invoice'),
          )
        ],
      ),
    );
  }
}
