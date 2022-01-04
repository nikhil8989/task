import 'package:flutter/material.dart';

import '../../services/secure_storage_controller.dart';

import '../widgets/drawer_card_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: mediaQueryData.padding.top,
          ),
          Container(
            height: (mediaQueryData.size.height - mediaQueryData.padding.top) * 0.15,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: FutureBuilder(
              future: SecureStorageController.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasError && snapshot.hasData) {
                    final response = snapshot.data as Map<String, String>;
                    final name = response["username"] as String;
                    final email = response["email"] as String;
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: mediaQueryData.size.height * 0.03,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: mediaQueryData.size.height * 0.022,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      "Somthing went wrong",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          DrawerCardWidget(
            icon: Icons.dashboard,
            function: () {
              Navigator.of(context).pushNamed("dashbord");
            },
            titel: "Dashboard",
          ),
          DrawerCardWidget(
            icon: Icons.logout,
            function: () {
              SecureStorageController.removeToken();
              Navigator.of(context).pushReplacementNamed("login");
            },
            titel: "Logout",
          ),
        ],
      ),
    );
  }
}
