import 'package:omikuji/value_notifiers/fortune_value_notifier.dart';
import 'dart:math';

class FortuneRepository implements IFortuneRepository {
  Future<String> fetch() {
    return Future.delayed(const Duration(seconds: 1)).then((_) {
      Random ran = new Random();
      var f = ran.nextDouble();
      if (f > 0.8) {
        return '大吉';
      } else if (f > 0.6) {
        return '吉';
      } else if (f > 0.4) {
        return '中吉';
      } else if (f > 0.2) {
        return '小吉';
      } else {
        return '大凶';
      }
    });
  }
}
