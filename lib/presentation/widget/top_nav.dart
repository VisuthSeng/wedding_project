import 'package:flutter/material.dart';
import 'package:wedding_project/presentation/widget/responsive_widget.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? const Row(
              children: [],
            )
          : IconButton(
              onPressed: () {
                key.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.red,
              )),
      elevation: 0,
      title: Row(
        children: [
          const Visibility(
              child: CustomText(
            text: 'Wedding Thika & DaRo',
            color: Colors.blue,
            size: null,
            weight: FontWeight.bold,
          )),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              // Get.to(() => const SmallScreen());
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ),
          Container(
            width: 2,
            height: 22,
            color: Colors.grey[350],
          ),
          const SizedBox(
            width: 24,
          ),
          const CustomText(
            text: 'Admin',
            size: null,
            color: Colors.blue,
            weight: null,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person_outline),
              ),
            ),
          ),
        ],
      ),
      iconTheme: const IconThemeData(color: Colors.amber),
      backgroundColor: const Color(0xffFFFFFF),
    );
