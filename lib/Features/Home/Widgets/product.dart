import 'package:flutter/material.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Config/user.dart';
import '../../Products/Models/category_products.dart';

class ProductItemCard extends StatefulWidget {
  final CategoryProductsModel datas;
  ProductItemCard(this.datas);
  @override
  _ProductItemCardState createState() => _ProductItemCardState();
}

class _ProductItemCardState extends State<ProductItemCard> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    // final Color _secondColor = _theme.accentColor;
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double _deviceBlockSize = _devicewidth / 100;
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    // var _itemImage = widget.datas['Image'];
    // var _itemPersianName = widget.datas['PersianName'];
    // var _itemEnglishName = widget.datas['EnglishName'];
    // var _itemOrgPrice = widget.datas['OrgPrice'];
    // var _itemOffPrice = widget.datas['OffPrice'];
    // var _itemOffPercnt = widget.datas['OffPercent'];
    // double _itemStar = widget.datas['Star'];

    return Container(
      // height: User.deviceBlockSize * 40,
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 8.0,
        //     offset: Offset(
        //       00.0,
        //       4.0,
        //     ),
        //   )
        // ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          Routes.productItemScreen,
          arguments: widget.datas.id,
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            width: (User.deviceWidth - 60) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white60,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // SizedBox(
                //   height: 10,
                // ),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    child: LayoutBuilder(
                      builder: (ctx, cons) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(widget.datas.image),
                          width: cons.maxWidth,
                          height: cons.maxWidth,
                          // height: 3  5 * User.deviceBlockSize,
                          // width: 35 * User.deviceBlockSize,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        width: double.infinity,
                        child: Text(
                          widget.datas.name,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 3 * User.deviceBlockSize,
                            color: _mainFontColor,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        width: double.infinity,
                        child: Text(
                          widget.datas.nameE,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'montserratlight',
                            letterSpacing: 2,
                            fontSize: 1.7 * User.deviceBlockSize,
                            color: _mainFontColor,
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 2),
                      //   width: double.infinity,
                      //   child: Row(
                      //     children: <Widget>[
                      //       Spacer(),
                      //       Text(
                      //         '3'.toString(),
                      //         style: TextStyle(
                      //           fontSize: 3 * User.deviceBlockSize,
                      //           fontFamily: 'montserrat',
                      //           color: _mainFontColor,
                      //         ),
                      //       ),
                      //       RatingBar(
                      //         ignoreGestures: true,
                      //         initialRating: 3,
                      //         direction: Axis.horizontal,
                      //         itemCount: 5,
                      //         itemSize: 4 * User.deviceBlockSize,
                      //         itemPadding:
                      //             EdgeInsets.all(User.deviceBlockSize / 3),
                      //         itemBuilder: (context, _) => Icon(
                      //           Icons.star,
                      //           color: Colors.amber,
                      //         ),
                      //         onRatingUpdate: (rating) {
                      //           // setState(
                      //           //   () {
                      //           //     _itemStar = rating;
                      //           //   },
                      //           // );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.only(right: 8, left: 12),
                //   child: Divider(
                //     height: 2,
                //     color: Colors.grey,
                //   ),
                // ),
                // Container(
                //   child: Row(
                //     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: <Widget>[
                //       Spacer(),
                //       Container(
                //         height: _itemOffPrice != '0.0'
                //             ? 9 * _deviceBlockSize
                //             : 4.5 * _deviceBlockSize,
                //         // color: Colors.red,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: <Widget>[
                //             Text(
                //               'تومان',
                //               style: TextStyle(
                //                 fontSize: 2.5 * _deviceBlockSize,
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //       Container(
                //         height: 12 * _deviceBlockSize,
                //         child: Column(
                //           children: <Widget>[
                //             Spacer(),
                //             _itemOffPrice != '0.0'
                //                 ? Row(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: <Widget>[
                //                       Text(
                //                         _itemOrgPrice,
                //                         style: TextStyle(
                //                           fontFamily: 'montserrat',
                //                           fontSize: 3.5 * _deviceBlockSize,
                //                           decoration:
                //                               TextDecoration.lineThrough,
                //                           color: _mainFontColor,
                //                         ),
                //                       ),
                //                       Container(
                //                         padding: EdgeInsets.symmetric(
                //                           horizontal: 1,
                //                           vertical: 2,
                //                         ),
                //                         decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.only(
                //                             topRight: Radius.circular(7),
                //                             topLeft: Radius.circular(7),
                //                             bottomRight: Radius.circular(7),
                //                           ),
                //                           color: _secondColor,
                //                         ),
                //                         child: Text(
                //                           '%$_itemOffPercnt',
                //                           style: TextStyle(
                //                             fontFamily: 'montserrat',
                //                             fontSize: 2.2 * _deviceBlockSize,
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       )
                //                     ],
                //                   )
                //                 : Container(),
                //             Row(
                //               children: <Widget>[
                //                 Container(
                //                   child: Text(
                //                     _itemOffPrice != '0.0'
                //                         ? _itemOffPrice
                //                         : _itemOrgPrice,
                //                     style: TextStyle(
                //                       fontFamily: 'montserrat',
                //                       color: _mainFontColor,
                //                       fontSize: 5 * _deviceBlockSize,
                //                       fontWeight: FontWeight.w700,
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Spacer(),
                //           ],
                //         ),
                //       ),
                //       Spacer(),
                //     ],
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 5),
                //   padding: const EdgeInsets.only(right: 8, left: 12),
                //   child: Divider(
                //     height: 2,
                //     color: Colors.grey,
                //   ),
                // ),
                // Container(
                //   // color: Colors.red,
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           boxShadow: [
                //             BoxShadow(
                //               blurRadius: 10,
                //               color: _secondColor,
                //               offset: Offset(0, 5),
                //               spreadRadius: 1
                //             ),
                //           ],
                //         ),
                //         child: CircleAvatar(
                //           backgroundColor: _secondColor,
                //           radius: 4.5 * _deviceBlockSize,
                //           child: SvgPicture.asset(
                //             'assets/Icons/shop.svg',
                //             width: 4.5 * _deviceBlockSize,
                //             height: 4.5 * _deviceBlockSize,
                //             color: _mainFontColor,
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 3,
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           boxShadow: [
                //             BoxShadow(
                //               blurRadius: 10,
                //               color: _mainFontColor,
                //               offset: Offset(0, 5),
                //               spreadRadius: 1
                //             ),
                //           ],
                //         ),
                //         child: CircleAvatar(
                //           backgroundColor: _mainFontColor,
                //           radius: 4.5 * _deviceBlockSize,
                //           child: Icon(
                //             Icons.share,
                //             color: Colors.white,
                //             size: 4.5 * _deviceBlockSize,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: _deviceHeightBlockSize,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
