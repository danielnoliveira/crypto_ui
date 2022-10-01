import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: md.width,
        height: md.height,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
