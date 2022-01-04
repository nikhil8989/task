import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './screens/dashbord_screen.dart';
import './screens/image_viewr_screen.dart';

import './services/secure_storage_controller.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget maiScreen;
  final token = await SecureStorageController.getToken();
  if (token.isNotEmpty) {
    maiScreen = const HomeScreen();
  } else {
    maiScreen = const LoginScreen();
  }

  runApp(MyApp(screen: maiScreen));
}

class MyApp extends StatelessWidget {
  final Widget screen;
  const MyApp({
    Key? key,
    this.screen = const LoginScreen(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: screen,
      routes: {
        "login": (context) => const LoginScreen(),
        "home": (context) => const HomeScreen(),
        "dashbord": (context) => const DashBordScreen(),
        "imageviewr": (context) => const ImageViewerScreen(),
      },
    );
  }
}
