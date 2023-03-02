import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../Cores/Config/user.dart';
import '../../../../Cores/Widgets/date_picker.dart';
// import 'package:intl/intl.dart' as datee;

class FilterBlogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              // initialValue: '_mobile',
              decoration: InputDecoration(
                icon: SizedBox(
                  width: 10,
                  height: 10,
                  child: Icon(
                    Icons.search,
                    size: 6 * _deviceBlockSize,
                  ),
                ),
                labelText: 'جست و جو در متن',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'iranyekan',
                  fontWeight: FontWeight.w100,
                ),
                isDense: true,
              ),
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'montserrat',
                color: _mainFontColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DatePicker(
                controller: new TextEditingController(),
                label: 'تاریخ ثبت بعد از',
                color: mainFontColor,
                dateLabelCtrl: new TextEditingController(),
                icon: Icons.calendar_today,
              ),
              DatePicker(
                controller: new TextEditingController(),
                color: mainFontColor,
                label: 'تاریخ ثبت زودتر از',
                dateLabelCtrl: new TextEditingController(),
                icon: Icons.calendar_today,
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: 40 * _deviceBlockSize,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Container(
              color: _mainFontColor,
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    'فیلتر اخبار',
                    style: TextStyle(
                        fontSize: 4 * _deviceBlockSize, color: Colors.white),
                  ),
                  Icon(
                    FontAwesomeIcons.filter,
                    size: 4 * _deviceBlockSize,
                    color: Colors.white,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class DatePicker extends StatefulWidget {
//   const DatePicker({
//     Key key,
//     @required this.dateCTRL,
//     @required double deviceBlockSize,
//     @required String label,
//   })  : _deviceBlockSize = deviceBlockSize,
//         _label = label,
//         super(key: key);

//   final TextEditingController dateCTRL;
//   final double _deviceBlockSize;
//   final String _label;

//   @override
//   _DatePickerState createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Container(
//         width: 40 * widget._deviceBlockSize,
//         child: InkWell(
//           onTap: () async {
//             var res = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(2010, 1),
//               lastDate: DateTime(2101),
//             );
//             if (res != null) {
//               setState(
//                 () {
//                   widget.dateCTRL.text = datee.DateFormat('y-M-d').format(res);
//                 },
//               );
//             }
//           },
//           child: TextField(
//             enabled: false,
//             controller: widget.dateCTRL,
//             decoration: InputDecoration(
//               icon: SizedBox(
//                 height: 10,
//                 width: 10,
//                 child: Icon(
//                   FontAwesomeIcons.clock,
//                   size: 5 * widget._deviceBlockSize,
//                 ),
//               ),
//               labelStyle: TextStyle(
//                 fontWeight: FontWeight.w100,
//                 fontSize: 4 * widget._deviceBlockSize,
//               ),
//               labelText: widget._label,
//               isDense: true,
//               contentPadding: EdgeInsets.only(
//                 bottom: 5,
//                 left: 2,
//               ),
//               // border: InputBorder.none,
//             ),
//             style: TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 5 * widget._deviceBlockSize,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
