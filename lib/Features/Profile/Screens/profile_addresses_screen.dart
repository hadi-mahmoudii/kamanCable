import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
class ProfileAddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainColor = _theme.primaryColor;
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    final double _deviceHeight = _media.size.height;
    final double _deviceHeightBlockSize = _deviceHeight / 100;

    final String _address =
        'قم ، بلوارامین ،نبش کوچه 35 ، سمت راست ، پلاک 54 ، زنگ سمت چپ';
    final String _name = 'مهدیه بیگی';
    final String _mobile = '09122314565';
    final String _home = '02352991245';

    return Scaffold(
      appBar: PreferredSize(
        child: SimpleAppbar('حساب کاربری من'),
        preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SimpleHeader2('آدرس های من', 'MY ADDRESSES'),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) => ProfileAddressRow(
              deviceBlockSize: _deviceBlockSize,
              mainColor: _mainColor,
              deviceHeightBlockSize: _deviceHeightBlockSize,
              devicewidth: _devicewidth,
              address: _address,
              mainFontColor: _mainFontColor,
              name: _name,
              mobile: _mobile,
              home: _home,
              index: (index + 1).toString(),
            ),
            itemCount: 2,
            separatorBuilder: (ctx, index) => SizedBox(
              height: 25,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Row(
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => Navigator.of(context)
                      .pushNamed(Routes.profileAddressAddScreen),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 10 * _deviceBlockSize,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileAddressRow extends StatelessWidget {
  const ProfileAddressRow({
    Key? key,
    required double deviceBlockSize,
    required Color mainColor,
    required double deviceHeightBlockSize,
    required double devicewidth,
    required String address,
    required Color mainFontColor,
    required String name,
    required String mobile,
    required String home,
    required String index,
  })  : _deviceBlockSize = deviceBlockSize,
        _mainColor = mainColor,
        _deviceHeightBlockSize = deviceHeightBlockSize,
        _devicewidth = devicewidth,
        _address = address,
        _mainFontColor = mainFontColor,
        _name = name,
        _mobile = mobile,
        _home = home,
        _index = index,
        super(key: key);

  final double _deviceBlockSize;
  final Color _mainColor;
  final double _deviceHeightBlockSize;
  final double _devicewidth;
  final String _address;
  final Color _mainFontColor;
  final String _name;
  final String _mobile;
  final String _home;
  final String _index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3 * _deviceBlockSize,
                vertical: 20,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _mainColor,
                      boxShadow: [
                        BoxShadow(
                          color: _mainColor,
                          spreadRadius: .1,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 5 * _deviceBlockSize,
                    ),
                  ),
                  SizedBox(
                    height: _deviceHeightBlockSize,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          spreadRadius: .1,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 5 * _deviceBlockSize,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color.fromRGBO(220, 220, 220, 1)),
                  left: BorderSide(color: Color.fromRGBO(220, 220, 220, 1)),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          // color: Colors.red,
                          width: _devicewidth * .55,
                          child: Text(
                            _address,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: _mainFontColor,
                              fontSize: 3 * _deviceBlockSize,
                              height: 1.2,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _deviceBlockSize,
                        ),
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: 4 * _deviceBlockSize,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          // color: Colors.red,
                          width: _devicewidth * .55,
                          child: Text(
                            _name,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: _mainFontColor,
                              fontSize: 3 * _deviceBlockSize,
                              height: 1.2,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _deviceBlockSize,
                        ),
                        Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 4 * _deviceBlockSize,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          // color: Colors.red,
                          width: _devicewidth * .55,
                          child: Text(
                            _mobile,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: _mainFontColor,
                              fontSize: 3 * _deviceBlockSize,
                              height: 1.2,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _deviceBlockSize,
                        ),
                        Icon(
                          FontAwesomeIcons.mobileAlt,
                          color: Colors.grey,
                          size: 4 * _deviceBlockSize,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          // color: Colors.red,
                          width: _devicewidth * .55,
                          child: Text(
                            _home,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: _mainFontColor,
                              fontSize: 3 * _deviceBlockSize,
                              height: 1.2,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _deviceBlockSize,
                        ),
                        Icon(
                          Icons.call,
                          color: Colors.grey,
                          size: 4 * _deviceBlockSize,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                _index,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 9 * _deviceBlockSize,
                  color: _mainFontColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
