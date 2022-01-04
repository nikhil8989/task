import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageController {
  static FlutterSecureStorage instance = const FlutterSecureStorage();

  static void setToken(String token) async {
    await instance.write(key: "token", value: token);
  }

  static void setUserData(String email, String username) async {
    await instance.write(key: "email", value: email);
    await instance.write(key: "username", value: username);
  }

  static Future<Map<String, String>> getUserData() async {
    final email = await instance.read(key: "email");
    final username = await instance.read(key: "username");
    return {
      "email": email ?? "",
      "username": username ?? "",
    };
  }

  static void removeToken() async {
    await instance.delete(key: "token");
    await instance.delete(key: "email");
    await instance.delete(key: "username");
  }

  static Future<String> getToken() async {
    return await instance.read(key: "token") ?? "";
  }
}
