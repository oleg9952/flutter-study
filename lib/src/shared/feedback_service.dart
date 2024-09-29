import 'package:vibration/vibration.dart';

class FeedbackService {
  static void editing() {
    Vibration.vibrate(pattern: [0, 50, 30, 50], intensities: [0, 70, 0, 70]);
  }

  static void deleting() {
    Vibration.vibrate(duration: 50, amplitude: 50);
  }

  static void adding() {
    Vibration.vibrate(duration: 50, amplitude: 50);
  }
}
