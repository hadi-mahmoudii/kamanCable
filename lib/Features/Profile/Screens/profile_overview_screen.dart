import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
class ProfileOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    final double _deviceHeight = _media.size.height;
    final double _deviceHeightBlockSize = _deviceHeight / 100;
    // final String _title = 'نام و نام خانوادگی';
    // final IconData _icon = Icons.person;
    final String _name = 'مهدیه بیگی';
    final String _mobile = '09122314565';
    final String _idCode = '0371451515';
    final String _creditCard = '13497478952795788';
    final String _email = 'Mahdie@gmail.com';
    final String _password = 'testtest';


    return Scaffold(
      appBar: PreferredSize(
        child: SimpleAppbar('حساب کاربری من'),
        preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SimpleHeader2('اطلاعات حساب کاربری', 'MY PROFILE'),
            SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ProfileDetailsNavigationRow(
                  deviceBlockSize: _deviceBlockSize,
                  title: 'نام و نام خانوادگی',
                  deviceHeightBlockSize: _deviceHeightBlockSize,
                  name: _name,
                  mainFontColor: _mainFontColor,
                  icon: Icons.person,
                  navigate: () =>Navigator.of(context).pushNamed(Routes.profileOverviewNameScreen),
                  fontFamily: 'iranyekan',
                ),
                Divider(),
                ProfileDetailsNavigationRow(
                  deviceBlockSize: _deviceBlockSize,
                  title: 'شماره تلفن همزاه',
                  deviceHeightBlockSize: _deviceHeightBlockSize,
                  name: _mobile,
                  mainFontColor: _mainFontColor,
                  icon: Icons.call,
                  navigate: () =>Navigator.of(context).pushNamed(Routes.profileOverviewNumberScreen),
                ),
                Divider(),
                ProfileDetailsNavigationRow(
                  deviceBlockSize: _deviceBlockSize,
                  title: 'کدملی',
                  deviceHeightBlockSize: _deviceHeightBlockSize,
                  name: _idCode,
                  mainFontColor: _mainFontColor,
                  icon: FontAwesomeIcons.solidIdCard,
                  navigate: () =>Navigator.of(context).pushNamed(Routes.profileOverviewIdScreen),
                ),
                Divider(),
                ProfileDetailsNavigationRow(
                  deviceBlockSize: _deviceBlockSize,
                  title: 'شماره کارت (جهت بازگرداندن وجه)',
                  deviceHeightBlockSize: _deviceHeightBlockSize,
                  name: _creditCard,
                  mainFontColor: _mainFontColor,
                  icon: FontAwesomeIcons.creditCard,
                  navigate: () =>Navigator.of(context).pushNamed(Routes.profileOverviewCreditScreen),
                ),
                Divider(),
                ProfileDetailsNavigationRow(
                  deviceBlockSize: _deviceBlockSize,
                  title: 'پست الکترونیکی',
                  deviceHeightBlockSize: _deviceHeightBlockSize,
                  name: _email,
                  mainFontColor: _mainFontColor,
                  icon: Icons.alternate_email,
                  navigate: () =>Navigator.of(context).pushNamed(Routes.profileOverviewEmailScreen),
                ),
                Divider(),
                ProfileDetailsNavigationRow(
                  deviceBlockSize: _deviceBlockSize,
                  title: 'رمزعبور',
                  deviceHeightBlockSize: _deviceHeightBlockSize,
                  name: _password.replaceAll(RegExp('.'), '●'),
                  mainFontColor: _mainFontColor,
                  icon: FontAwesomeIcons.lock,
                  navigate: () =>Navigator.of(context).pushNamed(Routes.profileOverviewPasswordScreen),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailsNavigationRow extends StatelessWidget {
  const ProfileDetailsNavigationRow({
    Key? key,
    required double deviceBlockSize,
    required String title,
    required double deviceHeightBlockSize,
    required String name,
    required Color mainFontColor,
    required IconData icon,
    required Function navigate,
    String fontFamily = 'montserrat',
  })  : _deviceBlockSize = deviceBlockSize,
        _title = title,
        _deviceHeightBlockSize = deviceHeightBlockSize,
        _name = name,
        _mainFontColor = mainFontColor,
        _icon = icon,
        _navigate = navigate,
        _fontFamily = fontFamily,
        super(key: key);

  final double _deviceBlockSize;
  final String _title;
  final double _deviceHeightBlockSize;
  final String _name;
  final Color _mainFontColor;
  final IconData _icon;
  final Function _navigate;
  final _fontFamily;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _navigate as void Function()?,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 5 * _deviceBlockSize,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  _title,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 3 * _deviceBlockSize,
                  ),
                ),
                SizedBox(height: 1.5 * _deviceHeightBlockSize),
                Text(
                  _name,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: _mainFontColor,
                    fontSize: 3.5 * _deviceBlockSize,
                    fontFamily: _fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 2 * _deviceBlockSize,
            ),
            Icon(
              _icon,
              color: Colors.grey,
              size: 5 * _deviceBlockSize,
            )
          ],
        ),
      ),
    );
  }
}
