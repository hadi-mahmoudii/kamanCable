import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Config/urls.dart';
import '../../../Cores/Config/user.dart';
import '../../../Cores/Models/request.dart';
import '../../../Cores/Widgets/five_navigation_button.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../../Auth/Providers/auth.dart';
import '../Widgets/Main/header.dart';

class ProfileMainScreen extends StatefulWidget {
  @override
  _ProfileMainScreenState createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  bool isInit = true;
  bool isLoggediIn = false;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      await ServerRequest().get(
        Urls.getProducts,
        {
          // 'Authorization': 'Bearer ' + token,
          'Module': 'blog',
          'origin': Urls.domain,
          'X-Requested-With': 'XMLHttpRequest',
          'Content-Type': 'application/json',
        },
      );
      // print(requestResult);
      var authObject = Provider.of<Auth>(context, listen: false);
      setState(() {
        isLoggediIn = authObject.isLoggedIn;
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: PreferredSize(
        child: SimpleAppbar('بازگشت'),
        preferredSize: Size(double.infinity, 40),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: isInit
            ? LoadingWidget(mainFontColor: _mainFontColor)
            : isLoggediIn
                ? ListView(
                    children: <Widget>[
                      ProfileMainHeader(
                        'حساب کاربری من',
                        'MY PROFILE',
                        isLoggediIn,
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              User.phone!,
                              style: TextStyle(
                                fontSize: 5 * User.deviceBlockSize,
                                color: _mainFontColor,
                                fontFamily: 'montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              height: 5,
                            ),
                            Text(
                              User.name!,
                              style: TextStyle(
                                fontSize: 5 * User.deviceBlockSize,
                                color: _mainFontColor,
                              ),
                            ),
                          ],
                        ),
                      )
                      // IgnorePointer(
                      //   ignoring: !isLoggediIn,
                      //   child: ProfileMainNavigationRow(
                      //     deviceBlockSize: User.deviceBlockSize,
                      //     mainFontColor:
                      //         isLoggediIn ? _mainFontColor : Colors.grey,
                      //     secondFontColor: _secondFontColor,
                      //     pTitle: 'پــــــــروفایل',
                      //     eTitle: 'PROFILE',
                      //     icon: Icons.person,
                      //     navigate: () => Navigator.of(context)
                      //         .pushNamed(Routes.profileOverviewScreen),
                      //   ),
                      // ),
                      // IgnorePointer(
                      //   ignoring: !isLoggediIn,
                      //   child: ProfileMainNavigationRow(
                      //     deviceBlockSize: User.deviceBlockSize,
                      //     mainFontColor:
                      //         isLoggediIn ? _mainFontColor : Colors.grey,
                      //     secondFontColor: _secondFontColor,
                      //     pTitle: 'آدرس هــــــــــــای من',
                      //     eTitle: 'MY ADDRESSES',
                      //     icon: FontAwesomeIcons.mapMarkerAlt,
                      //     navigate: () => Navigator.of(context)
                      //         .pushNamed(Routes.profileAddressesScreen),
                      //   ),
                      // ),
                      // IgnorePointer(
                      //   ignoring: !isLoggediIn,
                      //   child: ProfileMainNavigationRow(
                      //     deviceBlockSize: User.deviceBlockSize,
                      //     mainFontColor:
                      //         isLoggediIn ? _mainFontColor : Colors.grey,
                      //     secondFontColor: _secondFontColor,
                      //     pTitle: 'سفارشـــات من',
                      //     eTitle: 'MY ORDERS',
                      //     icon: FontAwesomeIcons.fileAlt,
                      //     navigate: () => Navigator.of(context)
                      //         .pushNamed(Routes.profileOrderScreen),
                      //   ),
                      // ),
                      // IgnorePointer(
                      //   ignoring: !isLoggediIn,
                      //   child: ProfileMainNavigationRow(
                      //     deviceBlockSize: User.deviceBlockSize,
                      //     mainFontColor:
                      //         isLoggediIn ? _mainFontColor : Colors.grey,
                      //     secondFontColor: _secondFontColor,
                      //     pTitle: 'فرم های سفارش من',
                      //     eTitle: 'MY ORDERS FORM',
                      //     icon: FontAwesomeIcons.alignRight,
                      //     navigate: () {
                      //       Provider.of<ProfileProvider>(context, listen: false)
                      //           .getMyOrderItems(true);
                      //       return Navigator.of(context)
                      //           .pushNamed(Routes.profileOrderFormScreen);
                      //     },
                      //     extraIcon: Icons.add,
                      //     extraIconColor:
                      //         isLoggediIn ? _thirdFontColor : Colors.grey,
                      //   ),
                      // ),
                      // Center(
                      //   child: Center(
                      //     child: Text(
                      //       'این صفحه بزودی اضافه خواهد شد . . .',
                      //       textDirection: TextDirection.rtl,
                      //     ),
                      //   ),
                      // )
                    ],
                  )
                : UnloginUserContainer(
                    mainFontColor: _mainFontColor,
                  ),
      ),
      bottomNavigationBar: FiveNavigationButton(
        curIndex: 0,
        mainFontColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class UnloginUserContainer extends StatelessWidget {
  const UnloginUserContainer({
    Key? key,
    required Color mainFontColor,
    // @required double deviceBlockSize,
    // @required double deviceHeightBlockSize,
  })  : _mainFontColor = mainFontColor,
        // this.deviceBlockSize = deviceBlockSize,
        // _deviceHeightBlockSize = deviceHeightBlockSize,
        super(key: key);

  final Color _mainFontColor;
  // final double deviceBlockSize;
  // final double _deviceHeightBlockSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: User.deviceHeigth / 6,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              // width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: _mainFontColor,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'لطفــــــــــــــــا ابتدا',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 7 * User.deviceBlockSize,
                      color: _mainFontColor,
                    ),
                  ),
                  Text(
                    'به حساب کاربری خود',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 7 * User.deviceBlockSize,
                      fontWeight: FontWeight.w700,
                      color: _mainFontColor,
                    ),
                  ),
                  Text(
                    'وارد شـــــــــــوید',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 7 * User.deviceBlockSize,
                      color: _mainFontColor,
                    ),
                  ),
                  Text(
                    'PLEASE DO LOGIN',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 6 * User.deviceBlockSize,
                      color: Colors.black12,
                      fontFamily: 'montserrat',
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(Routes.loginScreen),
              child: Container(
                // margin: EdgeInsets.only(
                //   top: 4 * _deviceHeightBlockSize,
                //   bottom: 2 * _deviceHeightBlockSize,
                // ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _mainFontColor,
                ),
                height: User.deviceBlockSize * 10,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'ورود',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: User.deviceBlockSize * 4,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: User.deviceHeigth / 6,
            )
          ],
        ),
      ),
    );
  }
}
