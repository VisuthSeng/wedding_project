import 'package:flutter/material.dart';
import 'package:wedding_project/core/constant/app_color.dart';

class FormHeader extends StatelessWidget {
  final String title;
  const FormHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border(
            bottom: BorderSide(
              color: AppColor.wedding,
            ),
          ),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(5),
          //   topRight: Radius.circular(5),
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(
                title,
                style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
