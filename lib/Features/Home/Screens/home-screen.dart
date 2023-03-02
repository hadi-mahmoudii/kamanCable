import 'package:flutter/material.dart';
import '../Widgets/home_slider.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/five_navigation_button.dart';
import '../../../Cores/Widgets/header.dart';
import '../../Tools/Screens/awg_to_mili_screen.dart';
import '../../Tools/Screens/cable_selection_screen.dart';
// import '../Widgets/header-image-swiper.dart';
import '../Widgets/home-appbar.dart';
import '../Widgets/newses_swiper.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageController _pageController;
  // int _curIndex = 4;
  // String contents = 'خانه';
  // SwiperController swpcontroller = new SwiperController();
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontCOlor = _theme.primaryColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final _media = MediaQuery.of(context);
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, User.deviceBlockSize * 15),
        child: HomeAppBar(),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            // HeaderImageSwiper(),
            HomeHeaderImagesBox(),
            SizedBox(height: User.deviceBlockSize * 2),
            // SimpleDevider(pixelRatio: _deviceHeightBlockSize / 3),
            // SizedBox(height: _deviceHeightBlockSize),
            // SimpleHeader('فعالیت های ما  ', 'CATEGORIES'),
            // CategoriesGrid(),
            // SimpleDevider(pixelRatio: _deviceHeightBlockSize / 2),
            // SimpleHeader('جدید ترین محصولات  ', 'LATEST PRODUCTS'),
            // NewProducts(),
            SimpleDevider(pixelRatio: 3),
            SimpleHeader('جدیدترین اخبار  ', 'LATEST NEWS'),

            NewsesSwiper(),
            // NewsSwiper(),
            SizedBox(
              height: 25,
            ),
            NavigatorBanner(
              imagePath: 'assets/Images/Banner 2.png',
              navigatePath: AWGToMiliScreen.route,
              mainFontColor: _mainFontCOlor,
            ),
            SizedBox(
              height: 10,
            ),
            NavigatorBanner(
              imagePath: 'assets/Images/Banner 1.png',
              navigatePath: CableSelectionScreen.route,
              mainFontColor: _mainFontCOlor,
            ),

            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      bottomNavigationBar: FiveNavigationButton(
        curIndex: 4,
        mainFontColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class NavigatorBanner extends StatelessWidget {
  const NavigatorBanner({
    Key? key,
    required this.imagePath,
    required this.navigatePath,
    required this.mainFontColor,
  }) : super(key: key);

  final String imagePath;
  final String navigatePath;
  final Color mainFontColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => User.token == 'Bearer '
          ? Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: mainFontColor,
                content: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(Routes.loginScreen),
                  child: Text(
                    'لطفابرای مشاهده ی این بخش وارد حساب کاربری خود شوید',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                duration: Duration(seconds: 2),
              ),
            )
          : Navigator.of(context).pushNamed(navigatePath),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
    );
  }
}

class SimpleDevider extends StatelessWidget {
  const SimpleDevider({
    Key? key,
    required double pixelRatio,
  })  : _pixelRatio = pixelRatio,
        super(key: key);

  final double _pixelRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10 * _pixelRatio),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        height: 2,
        color: Colors.black,
      ),
    );
  }
}
