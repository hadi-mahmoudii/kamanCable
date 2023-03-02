import 'package:flutter/material.dart';

class TranslatorsResultTable extends StatefulWidget {
  const TranslatorsResultTable({
    Key? key,
    required double deviceBlockSize,
    required double deviceWidth,
    required this.values,
  })  : _deviceBlockSize = deviceBlockSize,
        _deviceWidth = deviceWidth,
        super(key: key);

  final double _deviceBlockSize;
  final double _deviceWidth;

  final List<Map<String, String>> values;

  @override
  _TranslatorsResultTableState createState() => _TranslatorsResultTableState();
}

class _TranslatorsResultTableState extends State<TranslatorsResultTable> {
  int currentInd = 0;
  @override
  Widget build(BuildContext context) {
    var themedata = Theme.of(context);
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 5),
      // height: 65,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              color: themedata.primaryColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'تفسیر ورودی ها',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 4.6 * widget._deviceBlockSize,
                  ),
                ),
                Text(
                  'data Interpretation'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white38,
                    fontFamily: 'montserrat',
                    fontSize: 3 * widget._deviceBlockSize,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 5 * widget._deviceBlockSize),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Divider(
                    color: Colors.white,
                    height: 4,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, ind) {
                    if (widget.values[ind]['type'] == '') {
                      return Container();
                    } else {
                      currentInd += 1;
                      return TranslatorsTableDataRow(
                        deviceBlockSize: widget._deviceBlockSize,
                        devicewidth: widget._deviceWidth,
                        title: widget.values[ind]['title'],
                        type: widget.values[ind]['type'],
                        backgroundColor: currentInd % 2 == 1
                            ? Color.fromRGBO(0x1B, 55, 95, 1)
                            : null,
                      );
                    }
                  },
                  itemCount: widget.values.length,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TranslatorsTableDataRow extends StatelessWidget {
  const TranslatorsTableDataRow({
    Key? key,
    required double deviceBlockSize,
    required double devicewidth,
    required String? title,
    required String? type,
    Color? backgroundColor,
  })  : _deviceBlockSize = deviceBlockSize,
        _backgroundColor = backgroundColor,
        _title = title,
        _type = type,
        super(key: key);

  final double _deviceBlockSize;
  final String? _title;
  final String? _type;

  final Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: 5,
        // horizontal: 4 * _deviceBlockSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              child: Text(
                _type!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 3.5 * _deviceBlockSize,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            width: _deviceBlockSize * 10,
            child: Text(
              _title!,
              style: TextStyle(
                fontFamily: 'montserrat',
                color: Colors.white,
                fontSize: 3.5 * _deviceBlockSize,
              ),
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}
