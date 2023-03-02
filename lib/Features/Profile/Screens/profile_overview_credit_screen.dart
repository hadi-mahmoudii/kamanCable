import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';

class ProfileOverveiwCreditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final Color _secondColor = _theme.accentColor;

    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    final double _deviceHeight = _media.size.height;
    final double _deviceHeightBlockSize = _deviceHeight / 100;

    final String _creditCard = '13497478952795788';

    return Scaffold(
      appBar: PreferredSize(
        child: SimpleAppbar('اطلاعات حساب کاربری'),
        preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SimpleHeader2('شماره حساب بانکی', 'BANK ACCOUNT'),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Color.fromRGBO(110, 80, 150, 1),
              ),
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    'لطفا شماره ی کارت خود را برای بازگشت مبلغ های احتمالی وارد کنید',
                    style: TextStyle(
                      fontSize: 2.5 * _deviceBlockSize,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.5 * _deviceBlockSize,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: _mainFontColor,
                    ),
                    child: Icon(
                      FontAwesomeIcons.starOfLife,
                      color: Colors.white,
                      size: 5 * _deviceBlockSize,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                initialValue: _creditCard,
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: Icon(
                      FontAwesomeIcons.creditCard,
                    ),
                  ),
                  labelText: 'شماره کارت',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'iranyekan',
                    fontWeight: FontWeight.w100,
                  ),
                  isDense: true,
                ),
                textDirection: TextDirection.rtl,
                keyboardType: TextInputType.number,
                style: TextStyle(fontFamily: 'montserrat'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _mainFontColor,
                    ),
                    child: Text(
                      'تایید اطلاعات ✔',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _secondColor,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
