import 'package:shared_preferences/shared_preferences.dart';

abstract class AppLocalDataSource {
  Future<void> setUserLoggedInStatus(bool isLoggedIn);

  Future<bool> get isLoggedIn;
}

class AppLocalDataSourceImpl extends AppLocalDataSource {
  @override
  Future<bool> get isLoggedIn async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool('isLoggedIn') ?? false;
  }

  @override
  Future<void> setUserLoggedInStatus(bool isLoggedIn) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isLoggedIn', isLoggedIn);
  }
}
