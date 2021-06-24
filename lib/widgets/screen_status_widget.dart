import 'package:advanced_flutter/screens/screen_status.dart';
import 'package:flutter/cupertino.dart';

class ScreenStatusWidget extends StatelessWidget {
  final Widget body;
  final Widget error;
  final Widget loading;
  final Widget empty;
  final Status screenStatus;

  const ScreenStatusWidget(
      {required Key key,
        required this.body,
        required this.error,
        required this.loading,
        required this.empty,
        required this.screenStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (screenStatus) {
      case Status.initial:
      case Status.loading:
        return loading;
        break;
      case Status.error:
        return error;
        break;
      case Status.empty:
        return empty;

        break;
      case Status.loaded:
        return body;
    }
    return error;
  }
}