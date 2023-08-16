import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_mode.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  late SharedPreferences prefs;

  @override
  bool build() {
    //prefs = ref.watch(sharedPreferenceProvider).asData!.value;
    _init();
    return true;
  }

  Future<void> toggle() async {
    state = !state;
    prefs.setBool('darkMode', state);
  }

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    final darkMode = prefs.getBool('darkMode');
    state = darkMode ?? true;
  }
}
