import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Config/user.dart';
import '../../../Cores/Models/request_result.dart';
import '../../../Cores/Widgets/alert_dialog.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/header2.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../Providers/auth.dart';

class ForgetPassScreen extends StatefulWidget {
  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  int timerValue = 60;
  bool isLoading = false;
  bool codeSended = false;
  late Timer globalTimer;
  final TextEditingController _cellNumberCtrl = new TextEditingController();
  final TextEditingController _verificationCodeCtrl =
      new TextEditingController();
  static GlobalKey<FormState> _form = new GlobalKey<FormState>();
  void startTimer() {
    timerValue = 60;
    const oneSec = const Duration(seconds: 1);
    globalTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          // if(!this.mounted){
          //   timer.cancel();
          // }
          if (timerValue < 1) {
            timer.cancel();
            setState(() {});
          } else {
            setState(() {
              timerValue -= 1;
            });
          }
        },
      ),
    );
  }

  bool letTextBoxEnable() {
    if (!isLoading && !codeSended) {
      return true;
    } else {
      return false;
    }
  }

  bool letCodeBoxEnable() {
    if (!isLoading && codeSended) {
      return true;
    } else {
      return false;
    }
  }

  Future<void>? checkCode(String value) {
    setState(() {
      isLoading = true;
    });
    Provider.of<Auth>(context, listen: false)
        .verifyForgetPass(value)
        .then((result) async {
      if (result == RequestResult.WrongCode) {
        await showDialog(
          context: context,
          builder: (ctx) => GlobalAlertDialog(
            title: 'کد نادرست',
            content: 'کد واردشده صحیح نمی باشد!',
          ),
        );
        _verificationCodeCtrl.text = '';
        setState(() {
          isLoading = false;
        });
        // Navigator.popAndPushNamed(context, Routes.forgetPassScreen);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.rePassScreen);
      }
      // setState(() {
      //   isLoading = false;
      //   codeSended = true;
      // });
    });
    return null;
  }

  Future<void>? requestCode(String cellNumber) {
    setState(() {
      isLoading = true;
    });
    Provider.of<Auth>(context, listen: false)
        .forgetPass(cellNumber)
        .then((result) {
      if (result == RequestResult.VerifyPhone) {
        setState(() {
          isLoading = false;
          codeSended = true;
        });
        startTimer();
      } else {
        showDialog(
          context: context,
          builder: (ctx) => GlobalAlertDialog(
            title: 'خطا',
            content: 'این شماره قبلا ثبت نام نکرده است!',
          ),
        );
        setState(() {
          isLoading = false;
          // codeSended = true;
        });
      }
    });
    return null;
  }

  @override
  void dispose() {
    try {
      globalTimer.cancel();
    } catch (e) {}
    _cellNumberCtrl.dispose();
    _verificationCodeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final Color _secondFontColor = _theme.accentColor;
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double _deviceBlockSize = _devicewidth / 100;
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          child: AppBanner(
            mainFontColor: _mainFontColor,
            // deviceBlockSize: User.deviceBlockSize,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   height: 20,
              // ),
              // Image.asset(
              //   'assets/Images/forgetpass.png',
              //   height: 30 * _deviceHeightBlockSize,
              //   width: double.infinity,
              //   fit: BoxFit.fitWidth,
              //   // fit: BoxFit.contain,
              // ),
              ForgetPassScreenHeader(deviceBlockSize: User.deviceBlockSize),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    InkWell(
                      // padding: EdgeInsets.symmetric(vertical: 5),
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: 20,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'بازگشت',
                              style: TextStyle(
                                fontSize: 4 * User.deviceBlockSize,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 3.5 * User.deviceBlockSize,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SimpleHeader2('بازیابی رمز عبور', 'PASSWORD RECOVERY'),
              ),
              SizedBox(
                height: 20,
              ),
              letTextBoxEnable()
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _form,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.length != 11) {
                                return 'شماره وارد شده صحیح نمی باشد!';
                              }
                              if (value[0] != '0' || value[1] != '9') {
                                return 'شماره وارد شده صحیح نمی باشد!';
                              }
                              return null;
                            },
                            controller: _cellNumberCtrl,
                            enabled: !isLoading,
                            readOnly: codeSended,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.call,
                                size: 4 * User.deviceBlockSize,
                              ),
                              labelText: 'شماره تماس خود را وارد نمایید',
                              labelStyle: TextStyle(fontFamily: 'iranyekan'),
                              isDense: true,
                            ),
                            style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 5 * User.deviceBlockSize,
                            ),
                            textDirection: TextDirection.rtl,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              isLoading
                  ? LoadingWidget(mainFontColor: _mainFontColor)
                  : Container(),
              letCodeBoxEnable()
                  ? Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'کد ارسال شده به شماره تماس خود را وارد نمایید.',
                            textDirection: TextDirection.rtl,
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              onChanged: (value) async {
                                if (value.length == 6) {
                                  await checkCode(value);
                                }
                              },
                              controller: _verificationCodeCtrl,
                              decoration: InputDecoration(isDense: true),
                              style: TextStyle(
                                  fontFamily: 'montserrat',
                                  fontSize: 5 * User.deviceBlockSize,
                                  letterSpacing: 5),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 6,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: User.deviceBlockSize * 50,
                            decoration: BoxDecoration(
                              color: Color(0xFF495065),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                timerValue != 0
                                    ? Text(
                                        'ارسال مجدد کد تا ${timerValue.toString()} ثانیه دیگر',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 3 * User.deviceBlockSize,
                                            color: Colors.white),
                                      )
                                    : InkWell(
                                        onTap: () =>
                                            requestCode(_cellNumberCtrl.text),
                                        child: Text(
                                          'ارسال مجدد کد',
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 3 * User.deviceBlockSize,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  width: User.deviceBlockSize,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: _mainFontColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  child: Icon(
                                    FontAwesomeIcons.starOfLife,
                                    size: 5 * User.deviceBlockSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () async {
                    if (!_form.currentState!.validate()) {
                      return;
                    }
                    codeSended
                        ? await checkCode(_verificationCodeCtrl.text)
                        : await requestCode(_cellNumberCtrl.text);
                    // Navigator.of(context)
                    //     .pushReplacementNamed(Routes.rePassScreen);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _mainFontColor,
                    ),
                    height: 12 * User.deviceBlockSize,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'تایید',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 5 * User.deviceBlockSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPassScreenHeader extends StatelessWidget {
  const ForgetPassScreenHeader({
    Key? key,
    required double deviceBlockSize,
  })  : _deviceBlockSize = deviceBlockSize,
        super(key: key);

  final double _deviceBlockSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF202646), Color(0xFF090B10)],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
          // tileMode: TileMode.repeated,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.refresh,
              color: Color(0xFFE2A44A),
              size: _deviceBlockSize * 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "FORGOT",
                  style: TextStyle(
                    color: Color(0xFFE2A44A),
                    fontSize: _deviceBlockSize * 7.5,
                    fontFamily: 'montserrat',
                  ),
                ),
                Text(
                  "SOMETHING?",
                  style: TextStyle(
                    color: Color(0xFFE2A44A),
                    fontSize: _deviceBlockSize * 7.5,
                    fontFamily: 'montserrat',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
