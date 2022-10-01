import 'package:crypto_ui/core/models/cryptocoin_model.dart';
import 'package:flutter/cupertino.dart';

final List<CryptoCoinModel> myBunchOfCoins = [
  CryptoCoinModel(
    name: 'Bitcoin',
    shortName: 'BTC',
    value: 0.00012,
    appreciation: 2.1,
    iconPath: 'assets/bitcoin.png',
    bgColor: Color(0xffF7931A),
  ),
  CryptoCoinModel(
    name: 'Skycoin',
    shortName: 'SKY',
    value: 0.0232,
    appreciation: 13.2,
    iconPath: 'assets/skycoin.png',
    bgColor: Color(0xff0072FF),
  ),
  CryptoCoinModel(
    name: 'Clams',
    shortName: 'CLAM',
    value: 0.0091,
    appreciation: 1.07,
    iconPath: 'assets/clams.png',
    bgColor: Color(0xff4F99CA),
  ),
  CryptoCoinModel(
    name: 'Bytecoin',
    shortName: 'BCN',
    value: 0.01315,
    appreciation: -2.5,
    iconPath: 'assets/bytecoin.png',
    bgColor: Color(0xffF04086),
  ),
];
