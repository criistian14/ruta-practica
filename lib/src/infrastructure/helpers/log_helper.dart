import 'package:talker/talker.dart';

abstract class LogHelper {
  const LogHelper();

  void showError(Exception error);
  void showSuccess(Object message, {String? title});
}

class LogHelperImpl extends LogHelper {
  const LogHelperImpl({
    required Talker talker,
  }) : _talker = talker;

  final Talker _talker;

  @override
  void showError(Exception error) {
    _talker.error(error);
  }

  @override
  void showSuccess(
    Object message, {
    String? title,
  }) {
    final messageText = message.toString();

    _talker.logTyped(
      _CustomSuccessLogTalker(messageText, maybeTitle: title ?? 'Success'),
    );
  }
}

class _CustomSuccessLogTalker extends TalkerLog {
  _CustomSuccessLogTalker(
    super.message, {
    required this.maybeTitle,
  });

  final String maybeTitle;

  @override
  String get title => maybeTitle;

  @override
  AnsiPen get pen => AnsiPen()..xterm(121);
}
