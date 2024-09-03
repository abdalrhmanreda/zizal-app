import 'package:alzilzal/Core/constatnts/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';

class AppVariables {
  static Size appSize(context) {
    Size size = MediaQuery.of(context).size;
    return size;
  }

  static List<String> areaList = [];
  static List<String> areaFromGovList = [];
  static List<String> profileList = [];
  static Map<String, String?> areaMap = {};
  static Map<String, int> areaMapIds = {};
  static Map<String, String> profileMap = {};
  static Map<String, String?> areasFromGovMap = {};

  static List<String> orderStatusListSending(context) {
    return [
      'inprogress',
      'in-the-way',
      'resend',
      'part-return',
      'full-return',
      'delivered',
      'delayed',
      'replace',
    ];
  }

  static List<String> orderStatusList(context) {
    return [
      'resend',
      'in-the-way',
      'delayed',
      'delivered',
      'part-return',
      'full-return',
      'inprogress',
      'wrp',
      'recorded',
      'change-data',
      'replace',
    ];
  }

  static List<String> orderTitlesStatusListSending(context) {
    return [
      S.of(context).Being_processed,
      S.of(context).On_the_way_with_the_representative,
      S.of(context).resend,
      S.of(context).Partial_Return,
      S.of(context).Full_Return,
      S.of(context).Delivered,
      S.of(context).status_delayed,
      S.of(context).Change_the_address,
    ];
  }

  static List<String> orderTitlesStatusList(context) {
    return [
      S.of(context).Resend,
      S.of(context).On_the_way_with_the_representative,
      S.of(context).Postponed,
      S.of(context).Delivered,
      S.of(context).Partial_Return,
      S.of(context).Full_Return,
      S.of(context).Being_processed,
      S.of(context).With_the_receiving_representative,
      S.of(context).Order_registered,
      S.of(context).Change_the_address,
      S.of(context).Replace_order,
    ];
  }

  static List<String> orderTitlesInRepUserList(context) {
    return [
      S.of(context).On_the_way_with_the_representative,
      S.of(context).orders_with_no_statements,
      S.of(context).Delivered,
      S.of(context).Partial_Return,
      S.of(context).Full_Return,
      S.of(context).Resend,
      S.of(context).Postponed,
    ];
  }

  static List<String> orderStatusImageList(context) {
    return [
      AssetsManager.orderManagementImage,
      AssetsManager.orderRecordedImage,
      AssetsManager.orderWithReceivingRepImage,
      AssetsManager.orderResendImage,
      AssetsManager.orderReturnedTotallyImage,
      AssetsManager.orderReturnedTotallyImage,
      AssetsManager.withRepRecievingImage,
      AssetsManager.orderNotNowImage,
      AssetsManager.orderChangeAddressImage,
      AssetsManager.orderReceivedImage,
      AssetsManager.orderResendImage,
    ];
  }

  static List<String> orderStatusRepUserImageList(context) {
    return [
      Assets.iconsCargoTruck,
      Assets.iconsDone,
      Assets.iconsPen,
      Assets.iconsWallet,
      Assets.iconsWallet,
      Assets.iconsArrow,
      AssetsManager.orderNotNowImage,
    ];
  }

  static Map<String, String> citiesMap = {
    "Baghdad": "بغداد",
    "Basra": "البصرة",
    "Nineveh": "نينوى",
    "Erbil": "اربيل",
    "Najaf": "النجف",
    "Kirkuk": "كركوك",
    "Anbar": "الانبار",
    "Diyala": "ديالى",
    "Double": "المثنى",
    "Al-Qadisiyah": "القادسية",
    "Maysan": "ميسان",
    "Wasit": "واسط",
    "Salahaddin": "صلاح الدين",
    "Dohuk": "دهوك",
    "Sulaymaniyah": "السليمانية",
    "Babylon": "بابل",
    "Karbala": "كربلاء",
    "Nasiriyah": "ناصرية"
  };
}
