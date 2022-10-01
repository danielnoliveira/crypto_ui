import 'package:crypto_ui/core/enums/e_file_type.dart';
import 'package:crypto_ui/pages/home/widgets/app_bar_animation_wrapper.dart';
import 'package:crypto_ui/pages/home/widgets/inrow_button.dart';
import 'package:crypto_ui/pages/home/widgets/left_content_animation_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size defaultSize;
  HomeAppBar({
    Key? key,
    required this.defaultSize,
  }) : super(key: key);
  final formatFloat = NumberFormat('#,###.0#', 'en_US');

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return AppBarAnimationWrapper(
      keepAlive: false,
      child: Container(
        padding:
            EdgeInsets.only(left: md.width * 0.09, right: md.width * 0.064),
        decoration: const BoxDecoration(
          color: Color(0x1fffffff),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HorizontalContentAnimationWrapper(
                        horizontalValue: -50,
                        child: Text(
                          'Wallet (USD)',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 20 / 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      HorizontalContentAnimationWrapper(
                        horizontalValue: -65,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                formatFloat.format(10056.9),
                                style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 40,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '\$',
                                style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  height: 40 / 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      HorizontalContentAnimationWrapper(
                        horizontalValue: -45,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Color(0XFFF1F381),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.chartLine,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '2.8 %',
                                style: GoogleFonts.manrope(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 18 / 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  HorizontalContentAnimationWrapper(
                    horizontalValue: 55,
                    child: Image.asset(
                      'assets/avatar.png',
                      fit: BoxFit.contain,
                      width: md.width * 0.1093,
                      height: md.width * 0.1093,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InRowButton(
                    title: 'Add',
                    fileType: eFileType.Icon,
                    iconData: Icons.add,
                  ),
                  InRowButton(
                    title: 'Send',
                    fileType: eFileType.Image,
                    imagePath: 'assets/withdraw.png',
                  ),
                  InRowButton(
                    title: 'Request',
                    fileType: eFileType.Image,
                    imagePath: 'assets/deposit.png',
                  ),
                  InRowButton(
                    title: 'Bill',
                    fileType: eFileType.Image,
                    imagePath: 'assets/bill.png',
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => defaultSize;
}
