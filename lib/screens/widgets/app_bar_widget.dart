import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String titel;
  const AppBarWidget({
    Key? key,
    required this.titel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return SizedBox(
      height: kToolbarHeight + 20,
      width: mediaQueryData.size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: SizedBox(
              height: kToolbarHeight * 0.4,
              width: kToolbarHeight * 0.4,
              child: Image.asset(
                "assets/images/Menu_Icon-4.png",
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            titel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: kToolbarHeight * 0.4,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: kToolbarHeight * 0.4,
            width: kToolbarHeight * 0.4,
            child: Image.asset(
              "assets/images/Mask_Group-1.png",
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            height: kToolbarHeight * 0.8,
            width: kToolbarHeight * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kToolbarHeight),
              child: Image.asset(
                "assets/images/profile.jpg",
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
