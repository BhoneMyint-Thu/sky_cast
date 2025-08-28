
import 'package:sky_cast/core/utils/screen_util.dart';

extension CustomSizeExtensions on num {
  double get w => toDouble() * ScreenUtil.scaleWidth;
  double get h => toDouble() * ScreenUtil.scaleHeight;
  double get sp => ScreenUtil.setSp(toDouble());
}
