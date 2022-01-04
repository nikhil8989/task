import 'package:flutter/material.dart';

import '../services/api_controller.dart';
import '../services/secure_storage_controller.dart';

import '../cnfig/app_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formState = GlobalKey<FormState>();

  void login(BuildContext context) async {
    if (formState.currentState!.validate()) {
      AppMethod.loading(context);
      final response = await ApiController.login(email.text, password.text);
      Navigator.of(context).pop();
      if (response.status) {
        SecureStorageController.setToken(response.data as String);
        SecureStorageController.setUserData(email.text, "UserName");
        AppMethod.tostMessage("Login sucessfully!");
        Navigator.of(context).pushReplacementNamed("home");
        return;
      }
      AppMethod.tostMessage(response.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Container(
            height: (mediaQueryData.size.height - mediaQueryData.padding.top) * 0.6,
            width: mediaQueryData.size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: mediaQueryData.size.width * 0.05,
                left: mediaQueryData.size.width * 0.05,
              ),
              child: Form(
                key: formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: mediaQueryData.size.height * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    TextFormField(
                      controller: email,
                      validator: (text) {
                        final input = text as String;
                        if (input.contains(".") && input.contains("@")) {
                          return null;
                        }
                        return "Pls enter valide email..";
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Enter email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      validator: (text) {
                        final input = text as String;
                        if (input.isEmpty) {
                          return "password can't be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Enter password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (mediaQueryData.size.height - mediaQueryData.padding.top) * 0.08,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => login(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: mediaQueryData.size.height * 0.025,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
