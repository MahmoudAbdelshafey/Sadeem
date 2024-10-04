import 'package:flutter/material.dart';
import 'constants.dart';
import 'size_config.dart';

abstract class AppStyles {
  //Inter Styles
  //Light

  //Regular
  static TextStyle styleInterRegular8(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 7.5),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterRegular10(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 9.6),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterRegular18(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterRegular13(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterRegular28(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 28.8),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  //Medium
  static TextStyle styleInterMedium25(context) {
    return TextStyle(
      color: AppConstants.kPrimaryFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24.7),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterMedium14(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 13.3),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterMedium9(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 9),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  //Semi_Bold
  static TextStyle styleInterSemiBold12(context) {
    return TextStyle(
      color: const Color(0xff231F20),
      fontSize: getResponsiveFontSize(context, fontSize: 11.8),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleInterSemiBold8(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 7.7),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInterSemiBold18(context) {
    return TextStyle(
      color:  const Color(0xff191818),
      fontSize: getResponsiveFontSize(context, fontSize: 17.4),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleInterSemiBold16(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 15.9),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleInterSemiBold11(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 11.2),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleInterSemiBold10(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  //Bold
  static TextStyle styleInterBold5(context) {
    return TextStyle(

      color: AppConstants.kPrimaryFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 5),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleInterBold13(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  // black
  static TextStyle styleInterBlack17(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16.3),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleInterBlack24(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleInterBlack11(context) {
    return TextStyle(
      color: AppConstants.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleInterBlack16(context) {
    return TextStyle(
      color: AppConstants.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleInterBlack34(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 34),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleInterBlack31(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 31),
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  // ////////////////////////////////////////////////////////////////////
  //Roboto Styles
  //Light
  static TextStyle styleRobotoLight25(context) {
    return TextStyle(
      color: AppConstants.kPrimaryFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24.5),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w100,
    );
  }

  //Regular
  static TextStyle styleRobotoRegular14(context) {
    return TextStyle(
      color: Theme.of(context).cardColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRobotoRegular8(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 8.1),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoRegular9(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 9),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoRegular16(context) {
    return TextStyle(
      color: AppConstants.kPrimaryFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoRegular12(context) {
    return TextStyle(
      color: AppConstants.kPrimaryFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoRegular13(context) {
    return TextStyle(
      color: AppConstants.kPrimaryFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 13.2),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoRegular22(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoRegular15(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoRegular17(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 17.5),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  //Medium
  static TextStyle styleRobotoMedium20(context) {
    return TextStyle(
      color: Theme.of(context).cardColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRobotoMedium21(context) {
    return TextStyle(
      color: AppConstants.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20.8),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoMedium14(context) {
    return TextStyle(
      color: Theme.of(context).cardColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRobotoMedium13(context) {
    return TextStyle(
      color: AppConstants.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 13.3),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoMedium17(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16.6),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRobotoMedium24(context) {
    return TextStyle(
      color: AppConstants.darkFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRobotoMedium10(context) {
    return TextStyle(
      color: AppConstants.lightFontColor,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  //Semi_Bold
  static TextStyle styleRobotoSemiBold40(context) {
    return TextStyle(
      color: Theme.of(context).cardColor,
      fontSize: getResponsiveFontSize(context, fontSize: 40),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRobotoSemiBold16(context) {
    return TextStyle(
      color: const Color(0xff828282),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRobotoSemiBold22(context) {
    return TextStyle(
      color: Theme.of(context).cardColor,
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  //Bold
  static TextStyle styleRobotoBold24(context) {
    return TextStyle(
      color: Theme.of(context).cardColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
