import 'package:crypto_ui/pages/details/details_page_view_model.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'details_page_view.dart';

class DetailsPage extends StatefulWidget {
  final String cryptocoinShortName;
  const DetailsPage({super.key, required this.cryptocoinShortName});

  @override
  DetailsPageViewModel createState() => DetailsPageView();
}
