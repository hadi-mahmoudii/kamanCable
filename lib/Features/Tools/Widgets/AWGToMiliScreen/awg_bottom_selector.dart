import 'package:flutter/material.dart';

import '../../../../Cores/Config/user.dart';
import '../../../../Cores/Widgets/input_box.dart';
import '../../Entities/awg_to_mil_datas.dart';

class AWGBottomSelector extends StatefulWidget {
  final Color color;
  final IconData? icon;
  final String label;
  final Function? function;
  final TextEditingController controller;
  // final BuildContext ctx;
  final bool enable;
  // final List<PowerObject> datas;

  const AWGBottomSelector({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
    required this.controller,
    // @required this.ctx,
    // @required this.datas,
    this.function,
    this.enable = true,
  }) : super(key: key);

  @override
  _AWGBottomSelectorState createState() => _AWGBottomSelectorState();
}

class _AWGBottomSelectorState extends State<AWGBottomSelector> {
  bool isTapped = false;
  // List<PowerObject> datas = [];
  List<String> keys = [];

  @override
  void initState() {
    // if (awgDatas != null) datas = awgDatas;
    // keys = datas.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InputBox(
        color: widget.color,
        icon: widget.icon,
        label: widget.label,
        controller: widget.controller,
        readOnly: true,
        // fontFamily: 'montserrat',
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
                            Navigator.of(mainCtx).pop();
                            widget.controller.text = awgDatas[ind].keys.first;
                            widget.function!(awgDatas[ind].values.first);
                            // Navigator.of(mainCtx).pop();
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              awgDatas[ind].keys.first,
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
                      itemCount: awgDatas.length,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
