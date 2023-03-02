import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

import '../Features/Home/Screens/home-screen.dart';

class MainScreen extends StatefulWidget {
  static const route = '/MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // PageController _pageController;
  // int _curIndex = 4;
  // String contents = 'خانه';
  // SwiperController swpcontroller = new SwiperController();

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    // final Color _mainColor = _theme.primaryColor;
    final Color _mainFontColor = _theme.primaryColor;
    // final _media = MediaQuery.of(context);
    // final double _deviceHeight = _media.size.height;
    // final double _deviceWidth = _media.size.width;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    // final double _deviceWidthBlockSize = _deviceWidth / 100;
    return AnnotatedRegion(
      child: SafeArea(
        child: Scaffold(
          // floatingActionButton: ShopFloatingButton(
          //   deviceWidthBlockSize: _deviceWidthBlockSize,
          //   deviceHeightBlockSize: _deviceHeightBlockSize,
          // ),
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              backgroundColor: _mainFontColor,
              content: Text(
                'برای خروج دکمه ی بازگشت را مجددا فشار دهید',
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
              duration: Duration(seconds: 2),
            ),
            child: HomeScreen(),
            // PageView.builder(
            //   controller: _pageController,
            //   itemCount: 5,
            //   onPageChanged: (index) {
            //     setState(() => _curIndex = index);
            //   },
            //   itemBuilder: (ctx, pos) {
            //     if (_curIndex == 0) {
            //       // return ProductsFilterScreen();
            //       return ProfileMainScreen();
            //     }
            //     if (_curIndex == 1) {
            //       return BlogScreen();
            //     }
            //     if (_curIndex == 2) {
            //       return ProductsScreen();
            //     }
            //     if (_curIndex == 3) {
            //       return ToolsMainScreen();
            //     }
            //     if (_curIndex == 4) {
            //       return HomeScreen();
            //     } else {
            //       return Center(
            //         child: Center(
            //           child: Text(
            //             'این صفحه بزودی اضافه خواهد شد . . .',
            //             textDirection: TextDirection.rtl,
            //           ),
            //         ),
            //       );
            //     }
            //   },
            // ),
          ),
          // bottomNavigationBar: FiveNavigationButton(
          //   curIndex: 4,
          //   mainFontColor: _mainFontColor,
          // ),
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF9F9F9),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
