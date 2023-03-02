import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BlogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            // onTap: () =>
            //     Navigator.of(context).pushNamed(FilterBlogScreen.route),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                FontAwesomeIcons.filter,
                size: 8 * _deviceBlockSize,
              ),
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'خبر ها',
                style: TextStyle(
                  fontSize: 6 * _deviceBlockSize,
                  fontWeight: FontWeight.w700,
                ),
                textDirection: TextDirection.rtl,
              ),
              Text(
                ' BLOG',
                style: TextStyle(
                  fontFamily: 'montserrat',
                  letterSpacing: 4,
                  color: Colors.grey,
                  fontSize: 3 * _deviceBlockSize,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
