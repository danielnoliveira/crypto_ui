import 'package:crypto_ui/pages/home/home_page.dart';
import 'package:crypto_ui/pages/home/widgets/home_bottom_bar.dart';
import 'package:crypto_ui/pages/overview/overview_page.dart';
import 'package:crypto_ui/pages/settings/settings_page.dart';
import 'package:crypto_ui/pages/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  Intl.defaultLocale = 'en-US';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ValueNotifier<int> navigationBarPosition = ValueNotifier(0);
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Market App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: navigationBarPosition,
            builder: (context, value, child) {
              return HomeBottomBar(
                  currentIndex: value,
                  updateCurrentIndex: (int newValue) {
                    navigationBarPosition.value = newValue;
                  });
            }),
        body: ValueListenableBuilder(
          valueListenable: navigationBarPosition,
          builder: (context, value, child) {
            if (navigationBarPosition.value == 0) {
              return HomePage();
            } else if (navigationBarPosition.value == 1) {
              return OverviewPage();
            } else if (navigationBarPosition.value == 2) {
              return WalletPage();
            } else {
              return SettingsPage();
            }
          },
        ),
      ),
    );
  }
}
