// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Edite`
  String get edite {
    return Intl.message(
      'Edite',
      name: 'edite',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get generalSetting {
    return Intl.message(
      'General',
      name: 'generalSetting',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Help and support`
  String get helpAndSupport {
    return Intl.message(
      'Help and support',
      name: 'helpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get Privace {
    return Intl.message(
      'Privacy policy',
      name: 'Privace',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Translate to english`
  String get transToEnglish {
    return Intl.message(
      'Translate to english',
      name: 'transToEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Translate to arabic`
  String get transToArabic {
    return Intl.message(
      'Translate to arabic',
      name: 'transToArabic',
      desc: '',
      args: [],
    );
  }

  /// `log In`
  String get logIn {
    return Intl.message(
      'log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNum {
    return Intl.message(
      'Phone Number',
      name: 'phoneNum',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Required`
  String get phoneNumRequired {
    return Intl.message(
      'Phone Number Required',
      name: 'phoneNumRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Password Required`
  String get passRequired {
    return Intl.message(
      'Password Required',
      name: 'passRequired',
      desc: '',
      args: [],
    );
  }

  /// `Order registered`
  String get Order_registered {
    return Intl.message(
      'Order registered',
      name: 'Order_registered',
      desc: '',
      args: [],
    );
  }

  /// `Ready for shipment`
  String get Ready_for_shipment {
    return Intl.message(
      'Ready for shipment',
      name: 'Ready_for_shipment',
      desc: '',
      args: [],
    );
  }

  /// `On the way with the representative`
  String get On_the_way_with_the_representative {
    return Intl.message(
      'On the way with the representative',
      name: 'On_the_way_with_the_representative',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get Delivered {
    return Intl.message(
      'Delivered',
      name: 'Delivered',
      desc: '',
      args: [],
    );
  }

  /// `Replaced Orders`
  String get Replace_order {
    return Intl.message(
      'Replaced Orders',
      name: 'Replace_order',
      desc: '',
      args: [],
    );
  }

  /// `Partial Return`
  String get Partial_Return {
    return Intl.message(
      'Partial Return',
      name: 'Partial_Return',
      desc: '',
      args: [],
    );
  }

  /// `Full Return`
  String get Full_Return {
    return Intl.message(
      'Full Return',
      name: 'Full_Return',
      desc: '',
      args: [],
    );
  }

  /// `Postponed`
  String get Postponed {
    return Intl.message(
      'Postponed',
      name: 'Postponed',
      desc: '',
      args: [],
    );
  }

  /// `Change the address`
  String get Change_the_address {
    return Intl.message(
      'Change the address',
      name: 'Change_the_address',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get Resend {
    return Intl.message(
      'Resend',
      name: 'Resend',
      desc: '',
      args: [],
    );
  }

  /// `Being processed`
  String get Being_processed {
    return Intl.message(
      'Being processed',
      name: 'Being_processed',
      desc: '',
      args: [],
    );
  }

  /// `With the receiving representative`
  String get With_the_receiving_representative {
    return Intl.message(
      'With the receiving representative',
      name: 'With_the_receiving_representative',
      desc: '',
      args: [],
    );
  }

  /// `Number of orders`
  String get orders_number {
    return Intl.message(
      'Number of orders',
      name: 'orders_number',
      desc: '',
      args: [],
    );
  }

  /// `Number of processed orders`
  String get management_orders {
    return Intl.message(
      'Number of processed orders',
      name: 'management_orders',
      desc: '',
      args: [],
    );
  }

  /// `Qr Code Number`
  String get barcode_hint {
    return Intl.message(
      'Qr Code Number',
      name: 'barcode_hint',
      desc: '',
      args: [],
    );
  }

  /// `Scan Qr Code`
  String get scan_barcode {
    return Intl.message(
      'Scan Qr Code',
      name: 'scan_barcode',
      desc: '',
      args: [],
    );
  }

  /// `Upload Qr Code`
  String get upload_barcode {
    return Intl.message(
      'Upload Qr Code',
      name: 'upload_barcode',
      desc: '',
      args: [],
    );
  }

  /// `Total price`
  String get total_prices {
    return Intl.message(
      'Total price',
      name: 'total_prices',
      desc: '',
      args: [],
    );
  }

  /// `Login Successfully`
  String get login_Success {
    return Intl.message(
      'Login Successfully',
      name: 'login_Success',
      desc: '',
      args: [],
    );
  }

  /// `Wrong phone or password`
  String get login_error {
    return Intl.message(
      'Wrong phone or password',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Kind`
  String get kind {
    return Intl.message(
      'Kind',
      name: 'kind',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Total price`
  String get total_price {
    return Intl.message(
      'Total price',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get order_status {
    return Intl.message(
      'Order Status',
      name: 'order_status',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message(
      'User Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `User Phone`
  String get user_phone {
    return Intl.message(
      'User Phone',
      name: 'user_phone',
      desc: '',
      args: [],
    );
  }

  /// `Create Order`
  String get create_order {
    return Intl.message(
      'Create Order',
      name: 'create_order',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get governorate {
    return Intl.message(
      'Governorate',
      name: 'governorate',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get country_hint {
    return Intl.message(
      'Egypt',
      name: 'country_hint',
      desc: '',
      args: [],
    );
  }

  /// `The Place`
  String get place {
    return Intl.message(
      'The Place',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// `falstin street`
  String get address_hint {
    return Intl.message(
      'falstin street',
      name: 'address_hint',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Choose governorate`
  String get choose_area {
    return Intl.message(
      'Choose governorate',
      name: 'choose_area',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet`
  String get network_error {
    return Intl.message(
      'Check your internet',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `Order Created!`
  String get order_created {
    return Intl.message(
      'Order Created!',
      name: 'order_created',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get old_pass {
    return Intl.message(
      'Old Password',
      name: 'old_pass',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_pass {
    return Intl.message(
      'New Password',
      name: 'new_pass',
      desc: '',
      args: [],
    );
  }

  /// `Check old password and make the new one more strong`
  String get check_pass {
    return Intl.message(
      'Check old password and make the new one more strong',
      name: 'check_pass',
      desc: '',
      args: [],
    );
  }

  /// `This password is too short`
  String get pass_is_too_short {
    return Intl.message(
      'This password is too short',
      name: 'pass_is_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Order Price`
  String get order_price {
    return Intl.message(
      'Order Price',
      name: 'order_price',
      desc: '',
      args: [],
    );
  }

  /// `Received Price`
  String get received_amount {
    return Intl.message(
      'Received Price',
      name: 'received_amount',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Price`
  String get delivery_mount {
    return Intl.message(
      'Delivery Price',
      name: 'delivery_mount',
      desc: '',
      args: [],
    );
  }

  /// `Client Price`
  String get client_amount {
    return Intl.message(
      'Client Price',
      name: 'client_amount',
      desc: '',
      args: [],
    );
  }

  /// `No Orders Yet`
  String get no_orders_yet {
    return Intl.message(
      'No Orders Yet',
      name: 'no_orders_yet',
      desc: '',
      args: [],
    );
  }

  /// `Status Activated`
  String get status_activated {
    return Intl.message(
      'Status Activated',
      name: 'status_activated',
      desc: '',
      args: [],
    );
  }

  /// `Active status`
  String get active_status {
    return Intl.message(
      'Active status',
      name: 'active_status',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Medical Supplies`
  String get type_hint {
    return Intl.message(
      'Medical Supplies',
      name: 'type_hint',
      desc: '',
      args: [],
    );
  }

  /// `Money`
  String get money {
    return Intl.message(
      'Money',
      name: 'money',
      desc: '',
      args: [],
    );
  }

  /// `Commodity`
  String get commodity {
    return Intl.message(
      'Commodity',
      name: 'commodity',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Nearest Point`
  String get nearest_point {
    return Intl.message(
      'Nearest Point',
      name: 'nearest_point',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirm_order {
    return Intl.message(
      'Confirm Order',
      name: 'confirm_order',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Amount Type`
  String get amountType {
    return Intl.message(
      'Amount Type',
      name: 'amountType',
      desc: '',
      args: [],
    );
  }

  /// `Make Complain`
  String get make_complain {
    return Intl.message(
      'Make Complain',
      name: 'make_complain',
      desc: '',
      args: [],
    );
  }

  /// `Type The Complain Details`
  String get complain_hint {
    return Intl.message(
      'Type The Complain Details',
      name: 'complain_hint',
      desc: '',
      args: [],
    );
  }

  /// `There is an empty field`
  String get empty_field {
    return Intl.message(
      'There is an empty field',
      name: 'empty_field',
      desc: '',
      args: [],
    );
  }

  /// `Complains`
  String get complains {
    return Intl.message(
      'Complains',
      name: 'complains',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message(
      'price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `The Statement`
  String get statement {
    return Intl.message(
      'The Statement',
      name: 'statement',
      desc: '',
      args: [],
    );
  }

  /// `The Client Name`
  String get client_name {
    return Intl.message(
      'The Client Name',
      name: 'client_name',
      desc: '',
      args: [],
    );
  }

  /// `The Client Phone`
  String get client_phone {
    return Intl.message(
      'The Client Phone',
      name: 'client_phone',
      desc: '',
      args: [],
    );
  }

  /// `The Count`
  String get count {
    return Intl.message(
      'The Count',
      name: 'count',
      desc: '',
      args: [],
    );
  }

  /// `Choose Profile`
  String get choose_profile {
    return Intl.message(
      'Choose Profile',
      name: 'choose_profile',
      desc: '',
      args: [],
    );
  }

  /// `No Complains yet`
  String get no_complains {
    return Intl.message(
      'No Complains yet',
      name: 'no_complains',
      desc: '',
      args: [],
    );
  }

  /// `The last date of statement`
  String get statements_last_press {
    return Intl.message(
      'The last date of statement',
      name: 'statements_last_press',
      desc: '',
      args: [],
    );
  }

  /// `The First date of statement`
  String get statements_first_press {
    return Intl.message(
      'The First date of statement',
      name: 'statements_first_press',
      desc: '',
      args: [],
    );
  }

  /// `No statements found`
  String get no_statements {
    return Intl.message(
      'No statements found',
      name: 'no_statements',
      desc: '',
      args: [],
    );
  }

  /// `Orders with No statements`
  String get orders_with_no_statements {
    return Intl.message(
      'Orders with No statements',
      name: 'orders_with_no_statements',
      desc: '',
      args: [],
    );
  }

  /// `Qr Code must be not empty`
  String get barcode_validation {
    return Intl.message(
      'Qr Code must be not empty',
      name: 'barcode_validation',
      desc: '',
      args: [],
    );
  }

  /// `Make QR Code`
  String get makeQRCode {
    return Intl.message(
      'Make QR Code',
      name: 'makeQRCode',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR Code`
  String get scanQRCode {
    return Intl.message(
      'Scan QR Code',
      name: 'scanQRCode',
      desc: '',
      args: [],
    );
  }

  /// `Send Without QR Code`
  String get sendWithoutQR {
    return Intl.message(
      'Send Without QR Code',
      name: 'sendWithoutQR',
      desc: '',
      args: [],
    );
  }

  /// `Generate QR Code`
  String get generateQR {
    return Intl.message(
      'Generate QR Code',
      name: 'generateQR',
      desc: '',
      args: [],
    );
  }

  /// `Send on WhatsApp`
  String get sendMessageWhatsApp {
    return Intl.message(
      'Send on WhatsApp',
      name: 'sendMessageWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Send Notification`
  String get sendNotification {
    return Intl.message(
      'Send Notification',
      name: 'sendNotification',
      desc: '',
      args: [],
    );
  }

  /// `You have two ways to contact the receiving representative`
  String get receiveMethod {
    return Intl.message(
      'You have two ways to contact the receiving representative',
      name: 'receiveMethod',
      desc: '',
      args: [],
    );
  }

  /// `Add New Order`
  String get addNewOrder {
    return Intl.message(
      'Add New Order',
      name: 'addNewOrder',
      desc: '',
      args: [],
    );
  }

  /// `Request a Receipt Representative`
  String get requestAReceiptRepresentative {
    return Intl.message(
      'Request a Receipt Representative',
      name: 'requestAReceiptRepresentative',
      desc: '',
      args: [],
    );
  }

  /// `Abdalrhman`
  String get abdalrhman {
    return Intl.message(
      'Abdalrhman',
      name: 'abdalrhman',
      desc: '',
      args: [],
    );
  }

  /// `Receiver Information`
  String get receiverInfo {
    return Intl.message(
      'Receiver Information',
      name: 'receiverInfo',
      desc: '',
      args: [],
    );
  }

  /// `About Order`
  String get aboutOrder {
    return Intl.message(
      'About Order',
      name: 'aboutOrder',
      desc: '',
      args: [],
    );
  }

  /// `Governorate and Region`
  String get governorateEndregion {
    return Intl.message(
      'Governorate and Region',
      name: 'governorateEndregion',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Package with Recieving Presentative`
  String get packageWithRecievingPresentative {
    return Intl.message(
      'Package with Recieving Presentative',
      name: 'packageWithRecievingPresentative',
      desc: '',
      args: [],
    );
  }

  /// `Package Wait For Transporter`
  String get packageWaitForTransporter {
    return Intl.message(
      'Package Wait For Transporter',
      name: 'packageWaitForTransporter',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get order_details {
    return Intl.message(
      'Order Details',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get order_number {
    return Intl.message(
      'Order Number',
      name: 'order_number',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer {
    return Intl.message(
      'Customer',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `Customer Number`
  String get customer_number {
    return Intl.message(
      'Customer Number',
      name: 'customer_number',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Amount Type`
  String get amount_type {
    return Intl.message(
      'Amount Type',
      name: 'amount_type',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Amount`
  String get delivery_amount {
    return Intl.message(
      'Delivery Amount',
      name: 'delivery_amount',
      desc: '',
      args: [],
    );
  }

  /// `Created At`
  String get created_at {
    return Intl.message(
      'Created At',
      name: 'created_at',
      desc: '',
      args: [],
    );
  }

  /// `Updated At`
  String get updated_at {
    return Intl.message(
      'Updated At',
      name: 'updated_at',
      desc: '',
      args: [],
    );
  }

  /// `Page`
  String get page {
    return Intl.message(
      'Page',
      name: 'page',
      desc: '',
      args: [],
    );
  }

  /// `Receiver Presentative`
  String get receiver_presentative {
    return Intl.message(
      'Receiver Presentative',
      name: 'receiver_presentative',
      desc: '',
      args: [],
    );
  }

  /// `Client Full Name`
  String get client_full_name {
    return Intl.message(
      'Client Full Name',
      name: 'client_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Client Mobile`
  String get client_mobile {
    return Intl.message(
      'Client Mobile',
      name: 'client_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Client Role`
  String get client_role {
    return Intl.message(
      'Client Role',
      name: 'client_role',
      desc: '',
      args: [],
    );
  }

  /// `Client Pic`
  String get client_pic {
    return Intl.message(
      'Client Pic',
      name: 'client_pic',
      desc: '',
      args: [],
    );
  }

  /// `Client Pages`
  String get client_pages {
    return Intl.message(
      'Client Pages',
      name: 'client_pages',
      desc: '',
      args: [],
    );
  }

  /// `There is no orders`
  String get thereNoOrders {
    return Intl.message(
      'There is no orders',
      name: 'thereNoOrders',
      desc: '',
      args: [],
    );
  }

  /// `Choose Distribution Representative`
  String get choose_distribution_representative {
    return Intl.message(
      'Choose Distribution Representative',
      name: 'choose_distribution_representative',
      desc: '',
      args: [],
    );
  }

  /// `Appoint`
  String get appoint {
    return Intl.message(
      'Appoint',
      name: 'appoint',
      desc: '',
      args: [],
    );
  }

  /// `Compelete Orders`
  String get compeleteOrders {
    return Intl.message(
      'Compelete Orders',
      name: 'compeleteOrders',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone Number`
  String get invalid_phone {
    return Intl.message(
      'Invalid Phone Number',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Recorded Done`
  String get recordedDone {
    return Intl.message(
      'Recorded Done',
      name: 'recordedDone',
      desc: '',
      args: [],
    );
  }

  /// `In The Way`
  String get inTheWay {
    return Intl.message(
      'In The Way',
      name: 'inTheWay',
      desc: '',
      args: [],
    );
  }

  /// `With The Receiving Representative`
  String get withTheReceivingRepresentative {
    return Intl.message(
      'With The Receiving Representative',
      name: 'withTheReceivingRepresentative',
      desc: '',
      args: [],
    );
  }

  /// `On The Store`
  String get onTheStore {
    return Intl.message(
      'On The Store',
      name: 'onTheStore',
      desc: '',
      args: [],
    );
  }

  /// `With The Distribution Representative`
  String get withTheDistributionRepresentative {
    return Intl.message(
      'With The Distribution Representative',
      name: 'withTheDistributionRepresentative',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message(
      'Statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `It Was Delivered But Not Billed`
  String get ItWasDeliveredButNotBilled {
    return Intl.message(
      'It Was Delivered But Not Billed',
      name: 'ItWasDeliveredButNotBilled',
      desc: '',
      args: [],
    );
  }

  /// `Client Info`
  String get clientInfo {
    return Intl.message(
      'Client Info',
      name: 'clientInfo',
      desc: '',
      args: [],
    );
  }

  /// `There is no orders`
  String get thereIsNoOrders {
    return Intl.message(
      'There is no orders',
      name: 'thereIsNoOrders',
      desc: '',
      args: [],
    );
  }

  /// `On the way with the representative`
  String get on_the_way_with_delegate {
    return Intl.message(
      'On the way with the representative',
      name: 'on_the_way_with_delegate',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Replacement`
  String get replacement {
    return Intl.message(
      'Replacement',
      name: 'replacement',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Postponed`
  String get postponed {
    return Intl.message(
      'Postponed',
      name: 'postponed',
      desc: '',
      args: [],
    );
  }

  /// `Partial Return`
  String get partial_return {
    return Intl.message(
      'Partial Return',
      name: 'partial_return',
      desc: '',
      args: [],
    );
  }

  /// `Total Return`
  String get total_return {
    return Intl.message(
      'Total Return',
      name: 'total_return',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get status_inprogress {
    return Intl.message(
      'In Progress',
      name: 'status_inprogress',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for Distribution representative`
  String get status_waiting_distribution {
    return Intl.message(
      'Waiting for Distribution representative',
      name: 'status_waiting_distribution',
      desc: '',
      args: [],
    );
  }

  /// `Order Recorded`
  String get status_recorded {
    return Intl.message(
      'Order Recorded',
      name: 'status_recorded',
      desc: '',
      args: [],
    );
  }

  /// `On the Way with the representative`
  String get status_in_the_way {
    return Intl.message(
      'On the Way with the representative',
      name: 'status_in_the_way',
      desc: '',
      args: [],
    );
  }

  /// `Order Delivered`
  String get status_delivered {
    return Intl.message(
      'Order Delivered',
      name: 'status_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Order Replacement`
  String get status_replace {
    return Intl.message(
      'Order Replacement',
      name: 'status_replace',
      desc: '',
      args: [],
    );
  }

  /// `Partial Return`
  String get status_part_return {
    return Intl.message(
      'Partial Return',
      name: 'status_part_return',
      desc: '',
      args: [],
    );
  }

  /// `Full Return`
  String get status_full_return {
    return Intl.message(
      'Full Return',
      name: 'status_full_return',
      desc: '',
      args: [],
    );
  }

  /// `With Receiving representative`
  String get status_wrp {
    return Intl.message(
      'With Receiving representative',
      name: 'status_wrp',
      desc: '',
      args: [],
    );
  }

  /// `Delayed`
  String get status_delayed {
    return Intl.message(
      'Delayed',
      name: 'status_delayed',
      desc: '',
      args: [],
    );
  }

  /// `Address Change`
  String get status_change_data {
    return Intl.message(
      'Address Change',
      name: 'status_change_data',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get status_resend {
    return Intl.message(
      'Resend',
      name: 'status_resend',
      desc: '',
      args: [],
    );
  }

  /// `Ready for Sending`
  String get status_ready {
    return Intl.message(
      'Ready for Sending',
      name: 'status_ready',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for Transporter`
  String get status_wait_transporter {
    return Intl.message(
      'Waiting for Transporter',
      name: 'status_wait_transporter',
      desc: '',
      args: [],
    );
  }

  /// `With Transporter`
  String get status_transporter {
    return Intl.message(
      'With Transporter',
      name: 'status_transporter',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `There is no search results`
  String get thereIsNoSearch {
    return Intl.message(
      'There is no search results',
      name: 'thereIsNoSearch',
      desc: '',
      args: [],
    );
  }

  /// `Choose Date`
  String get chooseDate {
    return Intl.message(
      'Choose Date',
      name: 'chooseDate',
      desc: '',
      args: [],
    );
  }

  /// `From Date`
  String get fromDate {
    return Intl.message(
      'From Date',
      name: 'fromDate',
      desc: '',
      args: [],
    );
  }

  /// `To Date`
  String get toDate {
    return Intl.message(
      'To Date',
      name: 'toDate',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Change Order Status`
  String get change_order_status {
    return Intl.message(
      'Change Order Status',
      name: 'change_order_status',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
