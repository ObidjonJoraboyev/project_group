import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../data/models/notification_model.dart';

class NotificationService {
  static final NotificationService notificationService =
      NotificationService._();

  factory NotificationService() {
    return notificationService;
  }

  NotificationService._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init(GlobalKey<NavigatorState> key, BuildContext context) async {
    //android
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("app_icon");

    //ios
    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: (int? id, String? title,
                String? body, String? payload) async {});

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (notification) {
        if (notification.payload != null) {
          //Navigator.push(
          //context,
          //MaterialPageRoute(
          //               builder: (context) {
          //                 return const CategoriesScreen();
          //               },
          //             ),
          // );
        }
      },
    );
  }

  @pragma("vm:entry-point")
  void notificationTapBackground(NotificationResponse notificationResponse) {}

  AndroidNotificationChannel androidNotificationChannel =
      const AndroidNotificationChannel(
    "id",
    "name",
    importance: Importance.max,
    description: "Notification added",
  );

  void deleteSelectedNotification(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }

  void showNotification({required NotificationModel notificationModel}) {
    flutterLocalNotificationsPlugin.show(
      notificationModel.id,
      notificationModel.name,
      notificationModel.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          playSound: true,
          icon: "app_icon",
          priority: Priority.max,
          showProgress: true,
          largeIcon: const DrawableResourceAndroidBitmap('app_icon'),
        ),
      ),
      payload: "Sample creator by admins",
    );
  }

  void clearAll() {
    flutterLocalNotificationsPlugin.cancelAll();
  }
}
