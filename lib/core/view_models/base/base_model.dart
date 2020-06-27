import 'package:flutter/widgets.dart';

class BaseModel with ChangeNotifier {
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  void goTo(BuildContext context,
      {String path, bool pushAndReplace = false, dynamic args}) {
    if (pushAndReplace) {
      Navigator.pushNamedAndRemoveUntil(
          context, path, (Route<dynamic> route) => false,
          arguments: args);
    } else {
      Navigator.pushNamed(context, path, arguments: args);
    }
  }
}
