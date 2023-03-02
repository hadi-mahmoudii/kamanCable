import 'package:flutter/material.dart';

import '../../Features/Products/Models/category.dart';
import '../Config/routes.dart';

class FiveNavigationButton extends StatelessWidget {
  const FiveNavigationButton({
    Key? key,
    required int curIndex,
    required Color mainFontColor,
  })  : _curIndex = curIndex,
        // _mainFontColor = mainFontColor,
        super(key: key);

  final int _curIndex;
  // final Color _mainFontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Color(0xFFF9F9F9),
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey.withOpacity(.75),
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Color(0xFFF9F9F9),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                Icons.person,
                size: 30,
              ),
            ),
            label: 'پروفایل',
            // title: Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Text(
            //     "پروفایل",
            //     style: TextStyle(
            //       color: _curIndex == 0 ? _mainFontColor : Colors.grey,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // activeIcon: Icon(
            //   FontAwesomeIcons.user,
            //   color: _mainFontColor,
            // ),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0xFFF9F9F9),
            icon: Icon(
              Icons.rss_feed,
              size: 30,
            ),
            label: 'خبرنامه',
            // title: Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Text(
            //     "خبرنامه",
            //     style: TextStyle(
            //       color: _curIndex == 1 ? _mainFontColor : Colors.grey,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // activeIcon: Icon(
            //   FontAwesomeIcons.rss,
            //   color: _mainFontColor,
            // ),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0xFFF9F9F9),
            icon: Icon(
              Icons.format_align_right_outlined,
              size: 30,
            ),
            label: 'محصولات',
            // title: Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Text(
            //     "محصولات",
            //     style: TextStyle(
            //       color: _curIndex == 2 ? _mainFontColor : Colors.grey,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // activeIcon: Icon(
            //   FontAwesomeIcons.alignRight,
            //   color: _mainFontColor,
            // ),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0xFFF9F9F9),
            icon: Icon(
              Icons.edit,
              size: 30,
            ),
            label: 'ابزارها',
            // title: Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Text(
            //     "ابزار ها",
            //     style: TextStyle(
            //       color: _curIndex == 3 ? _mainFontColor : Colors.grey,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // activeIcon: Icon(
            //   FontAwesomeIcons.edit,
            //   color: _mainFontColor,
            // ),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0xFFF9F9F9),
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'خانه',
            // title: Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Text(
            //     "خانه",
            //     style: TextStyle(
            //       color: _curIndex == 4 ? _mainFontColor : Colors.grey,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // activeIcon: SvgPicture.asset(
            //   'assets/Icons/homeheart.svg',
            //   width: 25,
            //   height: 25,
            //   color: _mainFontColor,
            // ),
          ),
        ],
        currentIndex: _curIndex,
        onTap: (index) {
          if (_curIndex != index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed(Routes.profileMainScreen);
                break;
              case 1:
                Navigator.of(context).pushNamed(Routes.blogScreen);
                break;
              case 2:
                Navigator.of(context).pushNamed(
                  Routes.categoryScreen,
                  arguments: CategoryModel(
                      id: '(null)',
                      name: 'دسته بندی محصولات',
                      nameE: 'PRODUCTS CATEGORIES',
                      image: null,
                      parentId: null,
                      count: '2000'),
                );
                break;
              case 3:
                Navigator.of(context).pushNamed(Routes.toolsMainScreen);
                break;
              case 4:
                Navigator.of(context).pushNamed(Routes.homeScreen);
                break;
              default:
            }
          }
        },
      ),
    );
  }
}
