import 'dart:math';

import 'package:flutter/material.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

Widget spacedDivider = Column(
  children: const <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}

const double zero = 0.0;
const double xxs = 4.0;
const double xs = 8.0;
const double s = 12.0;
const double base = 16.0;
const double m = 24.0;
const double l = 32.0;
const double xl = 48.0;
const double xxl = 64.0;

const EdgeInsets allInsetsZero = EdgeInsets.all(zero);
const EdgeInsets allInsetsXxs = EdgeInsets.all(xxs);
const EdgeInsets allInsetsXs = EdgeInsets.all(xs);
const EdgeInsets allInsetsS = EdgeInsets.all(s);
const EdgeInsets allInsetsBase = EdgeInsets.all(base);
const EdgeInsets allInsetsM = EdgeInsets.all(m);
const EdgeInsets allInsetsL = EdgeInsets.all(l);
const EdgeInsets allInsetsXl = EdgeInsets.all(xl);
const EdgeInsets allInsetsXxl = EdgeInsets.all(xxl);

const EdgeInsets allInsets14 = EdgeInsets.all(14);
const EdgeInsets allInsets6 = EdgeInsets.all(6);

const EdgeInsets horizontalInsetsZero = EdgeInsets.symmetric(horizontal: zero);
const EdgeInsets horizontalInsetsXxs = EdgeInsets.symmetric(horizontal: xxs);
const EdgeInsets horizontalInsetsXs = EdgeInsets.symmetric(horizontal: xs);
const EdgeInsets horizontalInsetsS = EdgeInsets.symmetric(horizontal: s);
const EdgeInsets horizontalInsetsBase = EdgeInsets.symmetric(horizontal: base);
const EdgeInsets horizontalInsetsM = EdgeInsets.symmetric(horizontal: m);
const EdgeInsets horizontalInsetsL = EdgeInsets.symmetric(horizontal: l);
const EdgeInsets horizontalInsetsXl = EdgeInsets.symmetric(horizontal: xl);
const EdgeInsets horizontalInsetsXxl = EdgeInsets.symmetric(horizontal: xxl);

const EdgeInsets verticalInsetsZero = EdgeInsets.symmetric(vertical: zero);
const EdgeInsets verticalInsetsXxs = EdgeInsets.symmetric(vertical: xxs);
const EdgeInsets verticalInsetsXs = EdgeInsets.symmetric(vertical: xs);
const EdgeInsets verticalInsetsS = EdgeInsets.symmetric(vertical: s);
const EdgeInsets verticalInsetsBase = EdgeInsets.symmetric(vertical: base);
const EdgeInsets verticalInsetsM = EdgeInsets.symmetric(vertical: m);
const EdgeInsets verticalInsetsL = EdgeInsets.symmetric(vertical: l);
const EdgeInsets verticalInsetsXl = EdgeInsets.symmetric(vertical: xl);
const EdgeInsets verticalInsetsXxl = EdgeInsets.symmetric(vertical: xxl);

const EdgeInsets symmetric12And6 =
    EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
const EdgeInsets symmetric16And12 =
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
const EdgeInsets symmetric24And12 =
    EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);

const EdgeInsets leftInsetsZero = EdgeInsets.only(left: zero);
const EdgeInsets leftInsetsXxs = EdgeInsets.only(left: xxs);
const EdgeInsets leftInsetsXs = EdgeInsets.only(left: xs);
const EdgeInsets leftInsetsS = EdgeInsets.only(left: s);
const EdgeInsets leftInsetsBase = EdgeInsets.only(left: base);
const EdgeInsets leftInsetsM = EdgeInsets.only(left: m);
const EdgeInsets leftInsetsL = EdgeInsets.only(left: l);
const EdgeInsets leftInsetsXl = EdgeInsets.only(left: xl);
const EdgeInsets leftInsetsXxl = EdgeInsets.only(left: xxl);

const EdgeInsets rightInsetsZero = EdgeInsets.only(right: zero);
const EdgeInsets rightInsetsXxs = EdgeInsets.only(right: xxs);
const EdgeInsets rightInsetsXs = EdgeInsets.only(right: xs);
const EdgeInsets rightInsetsS = EdgeInsets.only(right: s);
const EdgeInsets rightInsetsBase = EdgeInsets.only(right: base);
const EdgeInsets rightInsetsM = EdgeInsets.only(right: m);
const EdgeInsets rightInsetsL = EdgeInsets.only(right: l);
const EdgeInsets rightInsetsXl = EdgeInsets.only(right: xl);
const EdgeInsets rightInsetsXxl = EdgeInsets.only(right: xxl);

const EdgeInsets topInsetsZero = EdgeInsets.only(top: zero);
const EdgeInsets topInsetsXxs = EdgeInsets.only(top: xxs);
const EdgeInsets topInsetsXs = EdgeInsets.only(top: xs);
const EdgeInsets topInsetsS = EdgeInsets.only(top: s);
const EdgeInsets topInsetsBase = EdgeInsets.only(top: base);
const EdgeInsets topInsetsM = EdgeInsets.only(top: m);
const EdgeInsets topInsetsL = EdgeInsets.only(top: l);
const EdgeInsets topInsetsXl = EdgeInsets.only(top: xl);
const EdgeInsets topInsetsXxl = EdgeInsets.only(top: xxl);

const EdgeInsets bottomInsetsZero = EdgeInsets.only(bottom: zero);
const EdgeInsets bottomInsetsXxs = EdgeInsets.only(bottom: xxs);
const EdgeInsets bottomInsetsXs = EdgeInsets.only(bottom: xs);
const EdgeInsets bottomInsetsS = EdgeInsets.only(bottom: s);
const EdgeInsets bottomInsetsBase = EdgeInsets.only(bottom: base);
const EdgeInsets bottomInsetsM = EdgeInsets.only(bottom: m);
const EdgeInsets bottomInsetsL = EdgeInsets.only(bottom: l);
const EdgeInsets bottomInsetsXl = EdgeInsets.only(bottom: xl);
const EdgeInsets bottomInsetsXxl = EdgeInsets.only(bottom: xxl);
