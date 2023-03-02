import 'package:flutter/material.dart';

import '../Config/user.dart';

class InputBox extends StatefulWidget {
  final Color color;
  final IconData? icon;
  final String label;
  final Function? function;
  final Function? onTapFunction;
  final TextEditingController controller;
  final bool enable;
  final TextInputType textType;
  final bool readOnly;
  final int minLines;
  final int maxLines;
  final String fontFamily;

  const InputBox({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
    required this.controller,
    this.function,
    this.onTapFunction,
    this.enable = true,
    this.textType = TextInputType.text,
    this.readOnly = false,
    this.minLines = 1,
    this.maxLines = 5,
    this.fontFamily = 'iranyekan',
  }) : super(key: key);

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.transparent,
      child: FocusScope(
        onFocusChange: (val) {
          setState(() {
            isTapped = val;
          });
        },
        child: TextFormField(
          controller: widget.controller,
          enabled: widget.enable,
          readOnly: widget.readOnly,
          onTap: widget.onTapFunction != null
              ? () async {
                  widget.onTapFunction!();
                }
              : () {},
          // validator: (value) {
          //   if (value.isEmpty) {
          //     return 'لطفا نام و نام خانوادگی خود را وارد کنید.';
          //   } else {
          //     return null;
          //   }
          // },
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            isDense: true,
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.color.withOpacity(.15),
              ),
              // borderRadius: BorderRadius.circular(15),
            ),
            labelText: widget.label,
            labelStyle: TextStyle(
              fontSize: 3 * User.deviceBlockSize,
              color: isTapped ? widget.color : widget.color.withOpacity(.5),
              fontFamily: widget.fontFamily,
            ),
            // suffix: Icon(Icons.expand_more),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.color,
              ),
              // borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.color.withOpacity(.15),
              ),
              // borderRadius: BorderRadius.circular(15),
            ),
            // errorBorder: InputBorder.none,
            // disabledBorder: InputBorder.none,
            suffixIcon: InkWell(
              onTap: widget.function as void Function()? ?? widget.function as void Function()?,
              child: UnconstrainedBox(
                child: SizedBox(
                  width: 0,
                  child: Icon(
                    Icons.expand_more,
                    color:
                        isTapped ? widget.color : widget.color.withOpacity(.15),
                  ),
                ),
              ),
            ),
          ),
          cursorColor: widget.color,
          style: TextStyle(
            fontSize: 5 * User.deviceBlockSize,
            color: widget.color,
            fontFamily: widget.fontFamily,
          ),
          keyboardType: widget.textType,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
        ),
      ),
    );
  }
}
