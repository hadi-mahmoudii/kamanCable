import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../Entities/power_datas.dart';
import '../Widgets/PowerConsumption/power_bottom_selector.dart';
import '../Widgets/tools-header.dart';

class PowerConsumptionScreen extends StatefulWidget {
  static const route = '/PowerConsumptionScreen';

  @override
  _PowerConsumptionScreenState createState() => _PowerConsumptionScreenState();
}

class _PowerConsumptionScreenState extends State<PowerConsumptionScreen> {
  // bool firstCategorySelected = false;
  bool showLayer2 = true;
  bool showLayer3 = false;
  bool showLayer4 = false;
  TextEditingController layer2Ctrl = new TextEditingController();
  TextEditingController layer3Ctrl = new TextEditingController();
  TextEditingController layer4Ctrl = new TextEditingController();
  List<PowerObject> layer2Datas = [];
  List<PowerObject> layer3Datas = [];
  List<PowerObject> layer4Datas = [];
  List<PowerObject> layer5Datas = [];
  String layer2Parent = '';
  String? layer3Parent = '';
  String? layer4Parent = '';

  String resultValue = '';
  String resultParent = '';

  bool isInit = true;
  resetLayers({
    bool layer1 = false,
    bool layer2 = true,
    bool layer3 = true,
    bool layer4 = true,
  }) {
    if (layer1) {}
    if (layer2) {
      showLayer2 = false;
      layer2Ctrl.text = '';
      layer2Datas = [];
      layer2Parent = '';
    }
    if (layer3) {
      showLayer3 = false;
      layer3Ctrl.text = '';
      layer3Datas = [];
      layer3Parent = '';
    }
    if (layer4) {
      showLayer4 = false;
      layer4Ctrl.text = '';
      layer4Datas = [];
      layer4Parent = '';
    }
    resultValue = '';
    // setState(() {});
  }

  String resultCalculator(
    String parent,
    List<PowerObject> datas,
    Function function,
  ) {
    datas.forEach((data) {});
    String result = '';
    function();
    return result;
  }

  List<PowerObject> nextLayerCalculator(
    String? parent,
    List<PowerObject> datas,
  ) {
    List<PowerObject> results = [];
    datas.forEach(
      (data) {
        // if (power != null) {
        //   if (data.parent == parent) {
        //     results.add(data);
        //   }
        // } else
        if (data.parent == parent) {
          results.add(data);
        }
      },
    );
    return results;
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      layer2Parent = 'جریان مصرفی وسایل خانگی';
      layer2Datas = nextLayerCalculator(layer2Parent, PowerDatas.layer2);
      setState(() {
        showLayer2 = true;
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      bottomNavigationBar: Container(
        height: 50,
        child: AppBanner(
          mainFontColor: _mainFontColor,
          // deviceBlockSize: User.deviceBlockSize,
        ),
      ),
      appBar: PreferredSize(
        child: SimpleAppbar('ابزار ها'),
        preferredSize: Size(40, 40),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ToolsHeader(
                eName: 'POWER CONSUMPTION',
                pName: 'توان مصرفی تجهیزات و وسائل',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: Text(
            //       'این مستند محدود به کدام ناحیه است؟',
            //       style: TextStyle(
            //         color: Colors.grey.withOpacity(.5),
            //         fontSize: User.deviceBlockSize * 3,
            //       ),
            //       textDirection: TextDirection.rtl,
            //     ),
            //   ),
            // ),
            // PowerMainCategoryButton(
            //   mainFontColor: _mainFontColor,
            //   pName: 'سیم و کابل مورد نیاز  ساختمان',
            //   eName: 'BUILDING CABLES',
            //   icon: FontAwesomeIcons.building,
            //   isSelected: firstCategorySelected,
            //   function: () {
            //     resetLayers();
            //     layer2Parent = 'سیم و کابل مورد نیاز  ساختمان';
            //     layer2Datas =
            //         nextLayerCalculator(layer2Parent, PowerDatas.layer2);
            //     setState(() {
            //       firstCategorySelected = true;
            //       showLayer2 = true;
            //     });
            //   },
            // ),
            // PowerMainCategoryButton(
            //   mainFontColor: _mainFontColor,
            //   pName: 'جریان مصرفی لوازم خانگی',
            //   eName: 'HOME APPLIANCES',
            //   icon: FontAwesomeIcons.fan,
            //   isSelected: !firstCategorySelected,
            //   function: () {
            //     resetLayers();
            //     layer2Parent = 'جریان مصرفی وسایل خانگی';
            //     layer2Datas =
            //         nextLayerCalculator(layer2Parent, PowerDatas.layer2);
            //     // print(layer2Datas);
            //     setState(() {
            //       firstCategorySelected = false;
            //       showLayer2 = true;
            //     });
            //   },
            // ),
            showLayer2
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: PowerBottomSelector(
                      color: _mainFontColor,
                      icon: null,
                      label: 'انتخاب کنید',
                      controller: layer2Ctrl,
                      datas: layer2Datas,
                      function: (var data) {
                        resetLayers(layer2: false);
                        layer3Parent = data.value;
                        layer3Datas = nextLayerCalculator(
                            layer3Parent, PowerDatas.layer3);
                        if (layer3Datas.length == 1 &&
                            !layer3Datas[0].hasChild) {
                          setState(() {
                            resultValue = layer3Datas[0].value;
                          });
                        } else {
                          setState(() {
                            showLayer3 = true;
                          });
                        }
                      },
                    ),
                  )
                : Container(),
            showLayer3
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: PowerBottomSelector(
                      color: _mainFontColor,
                      icon: null,
                      label: 'انتخاب کنید',
                      controller: layer3Ctrl,
                      datas: layer3Datas,
                      function: (var data) {
                        resetLayers(layer2: false, layer3: false);
                        layer4Parent = data.value;
                        layer4Datas = nextLayerCalculator(
                          layer4Parent,
                          PowerDatas.layer4,
                        );
                        if (layer4Datas.length <= 2) {
                          layer4Datas.forEach((data) {
                            if (data.bigParent != '' &&
                                data.bigParent == layer3Parent &&
                                data.parent == layer4Parent) {
                              setState(() {
                                resultValue = data.value;
                              });
                            }
                          });
                        } else {
                          setState(() {
                            showLayer4 = true;
                          });
                        }
                      },
                    ),
                  )
                : Container(),
            showLayer4
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: PowerBottomSelector(
                      color: _mainFontColor,
                      icon: null,
                      label: 'انتخاب کنید',
                      controller: layer4Ctrl,
                      datas: layer4Datas,
                      function: (var data) {
                        List<PowerObject> tempList =
                            nextLayerCalculator(data.value, PowerDatas.layer5);
                        if (tempList.length > 1) {
                          tempList.forEach((data) {
                            if (data.bigParent != '' &&
                                data.bigParent == layer4Parent) {
                              setState(() {
                                resultValue = data.value;
                              });
                            }
                          });
                        } else {
                          setState(() {
                            resultValue = tempList[0].value;
                          });
                        }
                      },
                    ),
                  )
                : Container(),
            resultValue != ''
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: _mainFontColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      resultValue,
                      style: TextStyle(
                        fontSize: User.deviceBlockSize * 4.5,
                        color: Colors.white,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                  )
                : Container(),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}

class PowerMainCategoryButton extends StatelessWidget {
  const PowerMainCategoryButton({
    Key? key,
    required Color mainFontColor,
    required String eName,
    required String pName,
    required IconData icon,
    required bool isSelected,
    required Function function,
  })  : _mainFontColor = mainFontColor,
        _eName = eName,
        _pName = pName,
        _icon = icon,
        _isSelected = isSelected,
        _function = function,
        super(key: key);

  final Color _mainFontColor;
  final String _eName;
  final String _pName;
  final IconData _icon;
  final bool _isSelected;
  final Function _function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Opacity(
        opacity: _isSelected ? 1 : .25,
        child: InkWell(
          onTap: _function as void Function()?,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFF2D3B63).withOpacity(.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(color: _mainFontColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _pName,
                      style: TextStyle(
                        color: _mainFontColor,
                        fontSize: MediaQuery.of(context).size.width / 100 * 4,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 3),
                    Text(
                      _eName,
                      style: TextStyle(
                        color: _mainFontColor.withOpacity(.5),
                        letterSpacing: 4,
                        fontSize: MediaQuery.of(context).size.width / 100 * 3,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 5),
                Icon(
                  _icon,
                  color: _mainFontColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
