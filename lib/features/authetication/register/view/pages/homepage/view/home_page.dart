import 'package:convert_coin/features/authetication/register/view/pages/convert/view/convert_page.dart';
import 'package:convert_coin/features/authetication/register/view/pages/historic/view/historic.dart';
import 'package:convert_coin/features/authetication/register/view/pages/homepage/controller/home_page_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePageWidget extends StatelessWidget {
  HomePageWidget({Key? key}) : super(key: key);
  final _controller = HomePageController();
  final _pageController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFFFFEBC5),
      body: Observer(builder: (_) {
        return SafeArea(
          child: PageView(
              controller: _pageController,
              onPageChanged: _controller.setBottomSelectedIndex,
              children: [ConvertPageWidget(), HistoricPageWidget()]),
        );
      }),
      bottomNavigationBar: CurvedNavigationBar(
        index: _controller.bottomSelectedIndex,
        onTap: (index) {
          _controller.setBottomSelectedIndex(index);
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
        items: [Icon(Icons.person), Icon(Icons.abc_outlined)],
        buttonBackgroundColor: Color(0xFFFF2C53D),
        color: Color(0xFFFF2D16D),
        backgroundColor: Colors.transparent,
      ),
    ));
  }
}
