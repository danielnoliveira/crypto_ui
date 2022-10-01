import 'package:crypto_ui/pages/home/home_page_view.dart';
import 'package:crypto_ui/pages/home/home_page_view_model.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageViewModel createState() => HomePageView();
}
