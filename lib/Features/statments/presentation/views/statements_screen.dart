import 'package:alzilzal/Core/constatnts/assets_manager.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:alzilzal/Features/statments/presentation/views/widgets/custom_date_picker_row.dart';
import 'package:alzilzal/Features/statments/presentation/views/widgets/custom_drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../../Core/helpers/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Core/constatnts/app_functions.dart';
import '../../../../Core/constatnts/app_keys.dart';
import '../../../../Core/helpers/cachehelper.dart';
import '../../../../Core/themes/colors/app_colors.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_snack_bar.dart';
import '../../data/models/statements_model.dart';
import '../../data/repos/statements_repo_imp.dart';
import '../controller/statements_cubit.dart';

class StatementsScreen extends StatefulWidget {
  const StatementsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatementsScreen> createState() => _StatementsScreenState();
}

class _StatementsScreenState extends State<StatementsScreen> {
  Future<pw.ImageProvider> _loadAssetImage(String path) async {
    final data = await rootBundle.load(path);
    return pw.MemoryImage(
      data.buffer.asUint8List(),
    );
  }

  Future<pw.Document> createInvoicePdf(
      StatementsModel pdfModel, List<List<String>> tableData) async {
    final pdf = pw.Document();
    final logo = await _loadAssetImage(AssetsManager.appLogo);
    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(children: [
                  pw.Image(
                    logo,
                    fit: pw.BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                ]),
                pw.Column(children: [
                  pw.Text(
                    "Orders Count: ${pdfModel.ordersCount.toString()}",
                    style: const pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 11,
                    ),
                  ),
                ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Name: ${pdfModel.clientName.toString()}",
                        style: const pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 11,
                        ),
                      ),
                      pw.Text(
                        "Total price: ${pdfModel.totalAmount.toString()}\$",
                        style: const pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 11,
                        ),
                      ),
                    ]),
                pw.Column(children: [
                  pw.Text(
                    "Page: ${pdfModel.page.toString()}",
                    style: const pw.TextStyle(
                      color: PdfColors.black,
                      fontSize: 11,
                    ),
                  ),
                ]),
              ]),
          pw.SizedBox(height: 15),
          pw.TableHelper.fromTextArray(
            border: const pw.TableBorder(
              top: pw.BorderSide(color: PdfColors.black),
              horizontalInside: pw.BorderSide(color: PdfColors.black),
              bottom: pw.BorderSide(color: PdfColors.black),
              right: pw.BorderSide(color: PdfColors.black),
              left: pw.BorderSide(color: PdfColors.black),
              verticalInside: pw.BorderSide(color: PdfColors.black),
            ),
            data: tableData,
            headers: [
              'Order Number',
              'Created At',
              'Customer Number',
              'Customer',
              'Address',
              'Client Amount',
              'Notes',
            ],
            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.green,
            ),
            headerStyle: const pw.TextStyle(
              color: PdfColors.white,
              fontSize: 10,
            ),
            tableDirection: AppFunctions.isArabic()
                ? pw.TextDirection.rtl
                : pw.TextDirection.ltr,
          ),
        ],
      ),
    );
    return pdf;
  }

  void _previewPdf({
    required StatementsModel pdfModel,
    required List<List<String>> tableData,
  }) async {
    final pdfDocument = await createInvoicePdf(pdfModel, tableData);

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfDocument.save(),
      usePrinterSettings: true,
      name: 'Test pdf',
      format: PdfPageFormat.legal,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatementsCubit(getIt.get<StatementsRepoImpl>())
        ..fetchPages(id: CacheHelper.getDate(key: AppKeys.userId) ?? 1),
      child: BlocConsumer<StatementsCubit, StatementsState>(
        listener: (context, state) {
          if (state is ErrorStatementsState ||
              state is ErrorFetchPagesStatementsState) {
            customSnackBar(
              context: context,
              text: S.of(context).network_error,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          StatementsCubit cubit = StatementsCubit.get(context);
          cubit.extractProfile(StatementsCubit.get(context).pagesModel ?? []);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomDatePickerRow(
                    firstButtonText: S.of(context).fromDate,
                    secondButtonText: S.of(context).toDate,
                  ),
                  Spacing.verticalSpace(20),
                  CustomDropDownList(
                    profileDropValue: cubit.profileDropValue,
                    onChanged: (String? value) {
                      setState(() {
                        cubit.profileDropValue = value;
                      });
                      print(AppVariables.profileMap[cubit.profileDropValue]);
                    },
                  ),
                  Spacing.verticalSpace(20),
                  if (state is LoadingStatementsState)
                    const Center(
                      child: LinearProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  Spacing.verticalSpace(20),
                  CustomButton(
                    fnc: () {
                      if (cubit.profileDropValue == null) {
                        AppFunctions.showErrorORWarningDialog(
                          noBtn: '',
                          fctNO: () {},
                          context: context,
                          okBtn: S.of(context).ok,
                          subtitle: S.of(context).choose_profile,
                          fct: () {},
                        );
                      } else {
                        cubit
                            .fetchStatements(
                          page: cubit.profileDropValue!,
                          accessToken:
                              CacheHelper.getDate(key: AppKeys.accessTokenKey),
                        )
                            .then((value) {
                          if (StatementsCubit.get(context).tableData.isEmpty) {
                            customSnackBar(
                              context: context,
                              text: S.of(context).no_statements,
                              color: Colors.red,
                            );
                          } else {
                            _previewPdf(
                              pdfModel: cubit.statementsModel!,
                              tableData: cubit.tableData,
                            );
                          }
                        });
                      }
                    },
                    w: 0.5,
                    h: 0.12,
                    child: Text(
                      S.of(context).statement,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kWhiteColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
