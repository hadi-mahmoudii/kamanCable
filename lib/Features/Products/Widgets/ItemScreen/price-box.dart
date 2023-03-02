import 'package:flutter/material.dart';

class ProductItemPriceBox extends StatelessWidget {
  final double deviceBlockSize;
  final String itemOrgPrice;
  final String itemOffPrice;
  final String itemOffPercent;
  final Color mainColor;
  final Color secondColor;

  const ProductItemPriceBox({
    Key? key,
    required this.deviceBlockSize,
    required this.itemOrgPrice,
    required this.itemOffPrice,
    required this.itemOffPercent,
    required this.mainColor,
    required this.secondColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 45 * deviceBlockSize,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black,
              ),
              color: mainColor,
            ),
            child: TextButton(
              onPressed: () => Scaffold.of(context).showSnackBar(
                new SnackBar(
                  backgroundColor: mainColor,
                  content: Text(
                    'به سبد خرید اضافه شد.',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.white),
                  ),
                  duration: Duration(seconds: 2),
                ),
              ),
              // Navigator.pushNamed(context, UserCardListScreen.route),
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    ' افزودن به سبد خرید',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 4 * deviceBlockSize, color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                  Icon(Icons.add, size: 14, color: Colors.white),
                  Spacer(),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 43 * deviceBlockSize,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Spacer(),
                Container(
                  height: itemOffPrice != '0.0'
                      ? 9 * deviceBlockSize
                      : 4.5 * deviceBlockSize,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'تومان',
                        style: TextStyle(
                          fontSize: 2.5 * deviceBlockSize,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 12 * deviceBlockSize,
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      itemOffPrice != '0.0'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  itemOrgPrice,
                                  style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 3.5 * deviceBlockSize,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 3, left: 1),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(7),
                                      topLeft: Radius.circular(7),
                                      bottomRight: Radius.circular(7),
                                    ),
                                    color: secondColor,
                                  ),
                                  child: Text(
                                    '%$itemOffPercent',
                                    style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 2.2 * deviceBlockSize,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Container(),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              itemOffPrice != '0.0'
                                  ? itemOffPrice
                                  : itemOrgPrice,
                              style: TextStyle(
                                fontFamily: 'montserrat',
                                color: mainColor,
                                fontSize: 5 * deviceBlockSize,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
