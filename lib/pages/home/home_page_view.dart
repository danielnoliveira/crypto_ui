import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:crypto_ui/core/helpers/color_helper.dart';
import 'package:crypto_ui/core/mocks/cryptocoins_list.dart';
import 'package:crypto_ui/pages/home/home_page_view_model.dart';
import 'package:crypto_ui/pages/home/widgets/crypto_list_item.dart';
import 'package:crypto_ui/pages/home/widgets/crypto_list_item_animation_wrapper.dart';
import 'package:crypto_ui/pages/home/widgets/home_app_bar.dart';
import 'package:crypto_ui/pages/home/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;

    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: HomeAppBar(
          defaultSize: Size(md.width, 332),
        ),
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Container(
          width: md.width,
          height: md.height,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: md.width * 0.06094),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: md.width,
                  height: 332 + statusBarHeight,
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  'Portifolios',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    height: 32 / 20,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return CryptoListItemAnimationWrapper(
                          index: index,
                          child: CryptoListItem(
                              cryptoCoin: myBunchOfCoins[index]));
                    },
                    itemCount: myBunchOfCoins.length,
                    shrinkWrap: true,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
