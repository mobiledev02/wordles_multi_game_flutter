// import 'dart:io';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PushNotification {
//   // final SearchGetController _searchController = Get.find<SearchGetController>();
//   // final ReportController _reportController = Get.find<ReportController>();
//   // final AuthController _authController = Get.find<AuthController>();

//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;

//   // // Get push notification permission...
//   static Future<bool> getNotificationPermission() async {
//     bool isNotificationPermission;
//     if (Platform.isAndroid) {
//       isNotificationPermission = await Permission.notification.isGranted;

//       if (!isNotificationPermission) {
//         try {
//           await Permission.notification.request();

//           isNotificationPermission = await Permission.notification.isGranted;
//         } catch (e) {
//           debugPrint(e.toString());
//         }
//       }

//       return isNotificationPermission;
//     } else {
//       await _firebaseMessaging.requestPermission(
//           sound: true, badge: true, alert: true);
//       isNotificationPermission = await Permission.notification.isGranted;
//       //print("permission notification::::::::$isNotificationPermission");
//       return isNotificationPermission;
//     }
//   }

//   //Get FCM device token if Notification is granted...
//   // static Future<String> getFCMToken() async {
//   //   try {
//   //     // if (await getNotificationPermission()) {
//   //     await checkConnectivity();
//   //     return await _firebaseMessaging.getToken() ?? "";
//   //     // } else {
//   //     //   return "";
//   //     // }
//   //   } catch (error) {
//   //     print("Error while fetching FCM token:- $error");
//   //     rethrow;
//   //   }
//   // }

//   static Future<bool> checkConnectivity() async {
//     var connectivity = await Connectivity().checkConnectivity();
//     if (connectivity == ConnectivityResult.none) {
//       return false;
//     }
//     return true;
//   }

//   // Logout user, delete's firebase instance so that notification is not received on mobile...
//   static Future<void> logout() async {
//     await _firebaseMessaging.deleteToken();
//   }
// }
