import 'package:flutter/material.dart';

import '../../../../Cores/Config/user.dart';
import '../../Models/attribute.dart';

class AttributeVariableWidget extends StatefulWidget {
  final AttributeModel attribute;
  const AttributeVariableWidget({
    Key? key,
    required this.attribute,
  }) : super(key: key);

  @override
  _AttributeVariableWidgetState createState() =>
      _AttributeVariableWidgetState();
}

class _AttributeVariableWidgetState extends State<AttributeVariableWidget> {
  var _curColorIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(right: 2 * User.deviceBlockSize),
              // width: MediaQuery.of(context).size.width * 0.65 - 25,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _curColorIndex = index;
                    });
                  },
                  child: ItemRow(
                    item: widget.attribute.values[index],
                    isSelected: _curColorIndex == index ? true : false,
                  ),
                ),
                itemCount: widget.attribute.values.length,
              ),
            ),
          ),
          // Spacer(),
          SizedBox(
            width: 2 * User.deviceBlockSize,
          ),
          Flexible(
            flex: 3,
            // color: Colors.red,
            // // padding: const EdgeInsets.all(5),
            // width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  widget.attribute.name,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 6 * User.deviceBlockSize,
                  ),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  widget.attribute.nameE,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 3 * User.deviceBlockSize,
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

class ItemRow extends StatelessWidget {
  final AttributeItemModel item;
  final bool isSelected;

  const ItemRow({
    Key? key,
    required this.item,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Color _mainColor = theme.primaryColor;

    return Card(
      // color: isSelected ? _mainColor : Colors.white,
      color: Colors.white,
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Text(
                item.name,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  // color: isSelected ? Colors.white : _mainColor,
                  color: _mainColor,
                  fontSize: 2.75 * User.deviceBlockSize,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: isSelected ? Colors.white : _mainColor,
                color: _mainColor,
              ),
              width: 2.75 * User.deviceBlockSize,
              child: Text(' '),
            )
          ],
        ),
      ),
    );
  }
}
