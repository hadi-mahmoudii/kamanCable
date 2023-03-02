import 'package:flutter/material.dart';

import '../../../../Cores/Widgets/header2.dart';

class ProductsItemScreenDetails extends StatelessWidget {
  final String itemPersianName;
  final String itemEnglishName;
  final String itemDetails;
  final double itemStar;
  final double deviceBlockSize;

  const ProductsItemScreenDetails({
    Key? key,
    required this.itemPersianName,
    required this.itemEnglishName,
    required this.itemDetails,
    required this.itemStar,
    required this.deviceBlockSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SimpleHeader2(itemPersianName, itemEnglishName),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 7),
          child: Text(
            itemDetails != 'null' ? itemDetails : '',
            style: TextStyle(
              color: _mainFontColor,
              fontSize: 3 * deviceBlockSize,
              height: 1.9,
            ),
            // textScaleFactor: _pixelRatio,
            textDirection: TextDirection.rtl,
          ),
        ),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 20),
        //   child: Row(
        //     children: <Widget>[
        //       Text(
        //         itemStar.toString(),
        //         style: TextStyle(
        //           fontSize: 3 * deviceBlockSize,
        //           fontFamily: 'montserrat',
        //           color: _mainFontColor,
        //         ),
        //       ),
        //       RatingBar(
        //         ignoreGestures: true,
        //         initialRating: itemStar,
        //         direction: Axis.horizontal,
        //         itemCount: 5,
        //         itemSize: 15,
        //         itemPadding: EdgeInsets.all(.5),
        //         itemBuilder: (context, _) => Icon(
        //           Icons.star,
        //           color: Colors.redAccent,
        //         ),
        //         onRatingUpdate: (rating) {
        //           // setState(
        //           //   () {
        //           //     itemStar = rating;
        //           //   },
        //           // );
        //         },
        //       ),
        //       Spacer(),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
