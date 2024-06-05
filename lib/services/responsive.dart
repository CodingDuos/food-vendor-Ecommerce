import 'package:flutter/widgets.dart';

class Responsive {
  static const double _desktopBreakpoint = 1600.0;
  static const double _tabletBreakpoint = 1200.0;

  static bool mobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 900;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < _tabletBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= _tabletBreakpoint &&
        MediaQuery.of(context).size.width < _desktopBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= _desktopBreakpoint;
  }

  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.only(left: 0, right: 0);
    } else if (isTablet(context)) {
      return const EdgeInsets.only(left: 50, right: 50);
    } else {
      return const EdgeInsets.only(left: 200, right: 200, top: 20);
    }
  }

  static double calculateTextSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    const double widthFactor = 0.002;
    const double heightFactor = 0.002;

    double adjustedSize = 16.0;

    adjustedSize += screenWidth * widthFactor;
    adjustedSize += screenHeight * heightFactor;

    return adjustedSize;
  }
}
