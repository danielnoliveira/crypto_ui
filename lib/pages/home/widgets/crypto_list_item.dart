import 'package:crypto_ui/pages/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:crypto_ui/core/models/cryptocoin_model.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoListItem extends StatelessWidget {
  final CryptoCoinModel cryptoCoin;
  const CryptoListItem({
    Key? key,
    required this.cryptoCoin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailsPage(
                cryptocoinShortName: cryptoCoin.shortName,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cryptoCoin.bgColor.withOpacity(0.2)),
              alignment: Alignment.center,
              child: Image.asset(cryptoCoin.iconPath),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cryptoCoin.shortName,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 24 / 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  cryptoCoin.name,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    height: 20 / 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  cryptoCoin.value.toString(),
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 24 / 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  cryptoCoin.getAppreciationString(),
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    height: 20 / 12,
                    color: cryptoCoin.appreciation >= 10
                        ? Colors.green
                        : cryptoCoin.appreciation <= -2
                            ? Colors.red
                            : Color(0xffF1F381),
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
