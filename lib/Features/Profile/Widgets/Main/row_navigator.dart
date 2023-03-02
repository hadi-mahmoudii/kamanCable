import 'package:flutter/material.dart';

class ProfileMainNavigationRow extends StatelessWidget {
  const ProfileMainNavigationRow({
    Key? key,
    required double deviceBlockSize,
    required Color mainFontColor,
    required Color secondFontColor,
    required String pTitle,
    required String eTitle,
    required IconData icon,
    required Function navigate,
    IconData? extraIcon,
    Color? extraIconColor,
  })  : _deviceBlockSize = deviceBlockSize,
        _mainFontColor = mainFontColor,
        _secondFontColor = secondFontColor,
        _pTitle = pTitle,
        _eTitle = eTitle,
        _icon = icon,
        _navigate = navigate,
        _extraIcon = extraIcon,
        _extraIconColor = extraIconColor,
        super(key: key);

  final double _deviceBlockSize;
  final Color _mainFontColor;
  final Color _secondFontColor;
  final String _pTitle;
  final String _eTitle;
  final IconData _icon;
  final Function _navigate;
  final IconData? _extraIcon;
  final Color? _extraIconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _navigate as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width - 40,
        child: Row(
          children: <Widget>[
            _extraIcon != null
                ? Icon(
                    _extraIcon,
                    color: _extraIconColor,
                    size: 12 * _deviceBlockSize,
                  )
                : Container(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _pTitle,
                    style: TextStyle(
                      fontSize: 5 * _deviceBlockSize,
                      // fontWeight: FontWeight.w700,
                      color: _mainFontColor,
                    ),
                    textDirection: TextDirection.rtl,
                    // textScaleFactor: _pixelRatio,
                  ),
                  Text(
                    _eTitle,
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      letterSpacing: 4,
                      color: _secondFontColor,
                      fontSize: 3 * _deviceBlockSize,
                    ),
                    textDirection: TextDirection.rtl,
                    // textScaleFactor: _pixelRatio,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5 * _deviceBlockSize,
            ),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Icon(
                _icon,
                color: _mainFontColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
