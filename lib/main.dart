import 'package:flutter/material.dart';
import 'core/firebase/noti_firebase.dart';
import 'core/getx/get_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseNotificationService().init();
  runApp(
      GetApp()
  );
}
