import 'package:flutter/material.dart';

class DrawerCardWidget extends StatelessWidget {
  final IconData icon;
  final String titel;
  final Function function;
  final bool isDisable;
  const DrawerCardWidget({
    Key? key,
    required this.icon,
    required this.function,
    required this.titel,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (!isDisable) {
          function();
          return;
        }
      },
      child: Container(
        height: (mediaQueryData.size.height - mediaQueryData.padding.top) * 0.08,
        width: mediaQueryData.size.width,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              icon,
              size: mediaQueryData.size.height * 0.03,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              titel,
              style: TextStyle(
                fontSize: mediaQueryData.size.height * 0.025,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
