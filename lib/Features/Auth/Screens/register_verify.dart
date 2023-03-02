import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Cores/Config/user.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Models/request_result.dart';
import '../../../Cores/Widgets/alert_dialog.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/header2.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../../../Cores/main-screen.dart';
import '../Providers/auth.dart';

class RegisterVerifyScreen extends StatefulWidget {
  @override
  _RegisterVerifyScreenState createState() => _RegisterVerifyScreenState();
}

class _RegisterVerifyScreenState extends State<RegisterVerifyScreen> {
  int timerValue = 60;
  bool isLoading = false;
  late Timer globalTimer;
  bool isInit = true;
  final TextEditingController _verifyCodeCtrl = new TextEditingController();
  static GlobalKey<FormState> _form = new GlobalKey<FormState>();

  void checkCode() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<Auth>(context, listen: false)
        .verifyRegister(_verifyCodeCtrl.text)
        .then((result) async {
      if (result == RequestResult.Accept) {
        await showDialog(
          context: context,
          builder: (ctx) => GlobalAlertDialog(
            title: 'ثبت نام',
            content: 'ثبت نام شما با موفقیت انجام شد',
          ),
        );
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => MainScreen(),
          ),
        );
        // Phoenix.rebirth(context);
      } else if (result == RequestResult.WrongCode) {
        await showDialog(
          context: context,
          builder: (ctx) => GlobalAlertDialog(
            title: 'کد نادرست',
            content: 'کد وارد شده صحیح نمی باشد!',
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        // print('done');
      }
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    globalTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          // if (!this.mounted) {
          //   timer.cancel();
          // }
          if (timerValue < 1) {
            timerValue = 60;
            timer.cancel();
          } else {
            setState(() {
              timerValue -= 1;
            });
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    try {
      globalTimer.cancel();
    } catch (e) {}
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      startTimer();
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
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
    // final double User.deviceBlockSize = _devicewidth / 100;
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: AppBanner(
          mainFontColor: _mainFontColor,
          // deviceBlockSize: User.deviceBlockSize,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   height: 20,
              // ),
              // Image.asset(
              //   'assets/Images/registerVerify.png',
              //   height: 30 * _deviceHeightBlockSize,
              //   width: double.infinity,
              //   fit: BoxFit.fitWidth,
              // ),
              RegisterVerifyHeader(deviceBlockSize: User.deviceBlockSize),
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
                child: SimpleHeader2('تایید تلفن همراه', 'SMS VERIFICATION'),
              ),
              SizedBox(
                height: 40,
              ),
              isLoading
                  ? LoadingWidget(mainFontColor: _mainFontColor)
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Form(
                            key: _form,
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'کد ارسال شده به شماره تماس خود را وارد نمایید.',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Container(
                                    width: 100,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 6) {
                                          checkCode();
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.length == 0) {
                                          return 'کد دریافتی را وارد کنید.';
                                        }
                                        if (value.length < 6) {
                                          return 'کد دریافتی را کامل وارد کنید.';
                                        }
                                        return null;
                                      },
                                      controller: _verifyCodeCtrl,
                                      decoration:
                                          InputDecoration(isDense: true),
                                      style: TextStyle(
                                          fontFamily: 'montserrat',
                                          fontSize: 5 * User.deviceBlockSize,
                                          letterSpacing: 5),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      maxLength: 6,
                                    ),
                                  )
                                ],
                              ),
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
                                // Text(
                                //   'ارسال مجدد کد تا ${timerValue.toString()} ثانیه دیگر',
                                //   textDirection: TextDirection.rtl,
                                //   style: TextStyle(
                                //       fontSize: 3 * User.deviceBlockSize,
                                //       color: Colors.white),
                                // ),
                                // SizedBox(
                                //   width: User.deviceBlockSize,
                                // ),
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
                    ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: IgnorePointer(
                  ignoring: isLoading,
                  // ignoring: true,
                  child: InkWell(
                    onTap: () async {
                      if (!_form.currentState!.validate()) {
                        return;
                      }
                      checkCode();
                      // Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _mainFontColor,
                      ),
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'تایید',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
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

class RegisterVerifyHeader extends StatelessWidget {
  const RegisterVerifyHeader({
    Key? key,
    required double deviceBlockSize,
  })  : this.deviceBlockSize = deviceBlockSize,
        super(key: key);

  final double deviceBlockSize;

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
              FontAwesomeIcons.commentAlt,
              color: Color(0xFFE2A44A),
              size: User.deviceBlockSize * 17,
            ),
            SizedBox(
              width: 2 * User.deviceBlockSize,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "JUST A\nQUICK\nCHECK",
                  style: TextStyle(
                      color: Color(0xFFE2A44A),
                      fontSize: User.deviceBlockSize * 7.5,
                      fontFamily: 'montserrat',
                      height: 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//old timerbox ui
// Container(
//                             width: User.deviceBlockSize * 50,
//                             decoration: BoxDecoration(
//                               color: _secondFontColor.withOpacity(.5),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15),
//                                 bottomLeft: Radius.circular(15),
//                                 bottomRight: Radius.circular(15),
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: <Widget>[
//                                 Text(
//                                   'ارسال مجدد کد تا${timerValue.toString()} ثانیه دیگر',
//                                   textDirection: TextDirection.rtl,
//                                   style:
//                                       TextStyle(fontSize: 3 * User.deviceBlockSize),
//                                 ),
//                                 SizedBox(
//                                   width: User.deviceBlockSize,
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: _secondFontColor,
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(15),
//                                       bottomLeft: Radius.circular(15),
//                                       bottomRight: Radius.circular(15),
//                                     ),
//                                   ),
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 7, horizontal: 10),
//                                   child: Icon(
//                                     FontAwesomeIcons.starOfLife,
//                                     size: 5 * User.deviceBlockSize,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
