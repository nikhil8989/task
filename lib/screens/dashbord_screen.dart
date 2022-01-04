import 'package:flutter/material.dart';

import './widgets/app_bar_widget.dart';
import './widgets/drawer_widget.dart';
import './widgets/artical_list_widget.dart';
import './widgets/video_list_widget.dart';

class DashBordScreen extends StatelessWidget {
  const DashBordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              AppBarWidget(
                titel: "Dashbord",
              ),
              SizedBox(
                height: 30,
              ),
              ArticalListWidget(),
              SizedBox(
                height: 30,
              ),
              VideoListWidget(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: (mediaQueryData.size.height - mediaQueryData.padding.top) * 0.1,
        width: mediaQueryData.size.width,
        child: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              "assets/images/Mask_Group_17.png",
              height: 25,
              width: 25,
            ),
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              "assets/images/Mask_Group_19.png",
              height: 25,
              width: 25,
            ),
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              "assets/images/Mask_Group_18.png",
              height: 25,
              width: 25,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
