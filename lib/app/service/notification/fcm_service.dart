import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utility/console_log.dart';
import 'local_notif_service.dart';

class FcmService {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  FcmService._();

  static String? fcmToken;

  static Future<void> initNotification() async {
    // Get fcm token
    fcmToken = await FirebaseMessaging.instance.getToken();
    cl('[FcmService].fcmToken = $fcmToken');

    // On iOS, this helps to take the user permissions
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _notificationHandler();
      await _checkForInitialMessage();
    } else {
      cl('[FcmService] User declined or has not accepted permission');
    }
  }

  static Future<void> _notificationHandler() async {
    // Foreground
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    // Background
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    await LocalNotifService.showNotification(
      title: message.notification?.title,
      body: message.notification?.body,
      deepLink: message.data['deep_link'],
    );

    // final inboxListViewModel = locator<InboxListViewModel>();
    // inboxListViewModel.getAllUserNotification();

    cl("[FcmService]._onMessageHandler.data = ${message.data}");
  }

  static Future<void> _onBackgroundHandler(RemoteMessage message) async {
    cl("[FcmService]._onBackgroundHandler.data = ${message.data}");
  }

  // For handling notification when the app is in terminated state
  static Future<void> _checkForInitialMessage() async {
    var initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    cl("[FcmService]._checkForInitialMessage.data = ${initialMessage?.data}");

    if (initialMessage != null) {
      // TODO
    }
  }
}
