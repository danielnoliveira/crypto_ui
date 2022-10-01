import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size defaultSize;
  final String coinName;
  const DetailsAppBar({
    Key? key,
    required this.defaultSize,
    required this.coinName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    double iconSize = 24;
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: md.width * 0.064)
            .copyWith(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: iconSize,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  coinName,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 24 / 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$46,892.1',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    height: 40 / 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: iconSize,
              height: iconSize,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => defaultSize;
}
