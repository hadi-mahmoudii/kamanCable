import 'package:flutter/material.dart';

class TXTFeild extends StatelessWidget {
  final String label;
  final TextEditingController textCtrl;
  final IconData icon;
  final TextInputType? keyType;
  final int? minline;
  final int? maxline;
  final currentFocosNode;
  final nextFocosNode;
  final TextInputAction? inputAction;
  final Function validate;
  final bool readOnly;
  final double marginLeft;
  final double marginRight;
  final String fontFamily;
  final TextAlign textAlign;

  const TXTFeild({
    Key? key,
    required this.label,
    required this.textCtrl,
    required this.icon,
    required this.validate,
    this.minline,
    this.maxline,
    this.keyType,
    this.currentFocosNode,
    this.nextFocosNode,
    this.inputAction,
    this.readOnly = false,
    this.marginRight = 25,
    this.marginLeft = 25,
    this.fontFamily = 'iranyekan',
    this.textAlign = TextAlign.right,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceBlocKSize = MediaQuery.of(context).size.width / 100;
    return Container(
      margin: EdgeInsets.only(
        left: marginLeft,
        right: marginRight,
        top: 10,
        bottom: 10,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          validator: validate as String? Function(String?)?,
          controller: textCtrl,
          textAlign: textAlign,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 0),
            labelText: label,
            labelStyle: TextStyle(
              fontFamily: 'iranyekan',
              fontSize: 3 * deviceBlocKSize,
            ),
            suffixIcon: Icon(
              icon,
              size: 7 * deviceBlocKSize,
            ),
            isDense: true,
          ),
          textInputAction: inputAction,
          onFieldSubmitted: (_) {
            try {
              FocusScope.of(context).requestFocus(nextFocosNode);
            } catch (e) {}
          },
          readOnly: readOnly,
          focusNode: currentFocosNode,
          style: TextStyle(
            fontSize: 5 * deviceBlocKSize,
            fontFamily: fontFamily,
          ),
          keyboardType: keyType != null ? keyType : TextInputType.text,
          minLines: minline != null ? minline : 1,
          maxLines: maxline != null ? maxline : 1,
        ),
      ),
    );
  }
}
