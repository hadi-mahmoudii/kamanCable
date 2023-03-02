import 'package:flutter/material.dart';

class ToolsScreenNavigatorBox extends StatelessWidget {
  const ToolsScreenNavigatorBox({
    Key? key,
    required this.color,
    required double deviceBlockSize,
    required String pName,
    required String eName,
    required Function navigate,
  })  : _deviceBlockSize = deviceBlockSize,
        _eName = eName,
        _pName = pName,
        _navigate = navigate,
        super(key: key);

  final Color color;
  final double _deviceBlockSize;
  final String _pName;
  final String _eName;
  final Function _navigate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  _navigate as void Function()?,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: <Widget>[
            Text(
              _eName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 4.5 * _deviceBlockSize,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _pName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 3.5 * _deviceBlockSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
