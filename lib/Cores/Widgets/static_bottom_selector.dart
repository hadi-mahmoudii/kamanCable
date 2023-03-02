import 'package:flutter/material.dart';

import '../Config/user.dart';
import 'input_box.dart';

class StaticBottomSelector extends StatefulWidget {
  final Color color;
  final IconData? icon;
  final String label;
  final Function? function;
  final TextEditingController controller;
  // final BuildContext ctx;
  final bool enable;
  final Map<String, String> datas;

  const StaticBottomSelector({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
    required this.controller,
    // @required this.ctx,
    required this.datas,
    this.function,
    this.enable = true,
  }) : super(key: key);

  @override
  _StaticBottomSelectorState createState() => _StaticBottomSelectorState();
}

class _StaticBottomSelectorState extends State<StaticBottomSelector> {
  bool isTapped = false;
  Map<String, String> datas = {};
  List<String> keys = [];

  @override
  void initState() {
    if (widget.datas.isNotEmpty) datas = widget.datas;
    keys = datas.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputBox(
      color: widget.color,
      icon: widget.icon,
      label: widget.label,
      controller: widget.controller,
      readOnly: true,
      fontFamily: 'montserrat',
      onTapFunction: () async {
        await showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          builder: (mainCtx) => Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            constraints: BoxConstraints(maxHeight: User.deviceHeigth / 2),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, ind) => Container(
                      child: InkWell(
                        onTap: () {
                          widget.controller.text = keys[ind];
                          widget.function!(keys[ind], datas[keys[ind]]);
                          Navigator.of(mainCtx).pop();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            keys[ind],
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 4 * User.deviceBlockSize,
                              fontFamily: 'montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemCount: keys.length,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
