import 'package:flutter/material.dart';
import 'package:wedding_project/presentation/widget/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Widget child;
  SiteLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(),
      backgroundColor: const Color(0xffE6EFFD),
      // body: const ResponsiveWidget(
      //   largeScreen: LargeScreen(),
      //   smallScreen: SmallScreen(),
      // ),
      body: Row(
        children: [
          Expanded(flex: 5, child: child),
        ],
      ),
    );
  }
}
