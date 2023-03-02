import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Cores/Config/user.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Models/request_result.dart';
import '../../../Cores/Widgets/alert_dialog.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/header2.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../../../Cores/main-screen.dart';
import '../Providers/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final TextEditingController _usernameCTRL = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final GlobalKey<FormState> _form = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final Color _secondColor = _theme.accentColor;
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          child: AppBanner(
            mainFontColor: _mainFontColor,
            // deviceBlockSize: User.deviceBlockSize,
          ),
        ),
        body: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              // Image.asset(
              //   'assets/Images/signin.png',
              //   height: 30 * _deviceHeightBlockSize,
              //   width: 30 * _deviceHeightBlockSize,
              //   fit: BoxFit.fitWidth,
              // ),
              LoginHeader(deviceBlockSize: User.deviceBlockSize),
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
                height: 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SimpleHeader2('ورود', 'LOG IN'),
              ),
              isLoading
                  ? LoadingWidget(mainFontColor: _mainFontColor)
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'لطفا شماره تلفن خود را وارد کنید.';
                                }
                                if (value.length != 11) {
                                  return 'لطفا فرمت شماره را بدرستی وارد کنید';
                                } else {
                                  return null;
                                }
                              },
                              controller: _usernameCTRL,
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.phone,
                                  size: 4 * User.deviceBlockSize,
                                ),
                                labelText: 'شماره تماس خود را وارد نمایید',
                                isDense: true,
                                labelStyle: TextStyle(fontFamily: 'iranyekan'),
                              ),
                              style: TextStyle(
                                fontFamily: 'montserrat',
                                fontSize: 5 * User.deviceBlockSize,
                              ),
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'لطفا رمز خود را وارد کنید.';
                                }

                                if (value.length < 8) {
                                  return 'طول رمز باید حداقل 8 کاراکتر باشد!';
                                }
                                return null;
                              },
                              controller: _password,
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.lock,
                                  size: 4 * User.deviceBlockSize,
                                ),
                                labelStyle: TextStyle(fontFamily: 'iranyekan'),
                                labelText: 'کلمه ی عبور',
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontFamily: 'montserrat',
                                fontSize: 5 * User.deviceBlockSize,
                              ),
                              obscureText: true,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: IgnorePointer(
                  ignoring: isLoading,
                  child: InkWell(
                    onTap: () async {
                      if (!_form.currentState!.validate()) {
                        return;
                      }
                      setState(() {
                        isLoading = true;
                      });
                      _form.currentState!.save();
                      await Provider.of<Auth>(context, listen: false)
                          .login(
                        _usernameCTRL.text,
                        _password.text,
                      )
                          .then((result) async {
                        if (result == RequestResult.Accept) {
                          // await showDialog(
                          //   context: context,
                          //   builder: (ctx) => GlobalAlertDialog(
                          //     title: 'ثبت نام',
                          //     content: 'ثبت نام شما با موفقیت انجام شد',
                          //   ),
                          // );
                          // Phoenix.rebirth(context);
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => MainScreen()));
                        } else if (result == RequestResult.VerifyPhone) {
                          await showDialog(
                            context: context,
                            builder: (ctx) => GlobalAlertDialog(
                              title: 'خطا',
                              content:
                                  'مشکلی حین ورود رخ داده است.لطفا دوباره امتحان کنید.',
                            ),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          await showDialog(
                            context: context,
                            builder: (ctx) => GlobalAlertDialog(
                              title: 'خطا',
                              content:
                                  'نام کاربری یا رمز واردشده صحیح نمی باشد.',
                            ),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _mainFontColor,
                      ),
                      height: User.deviceBlockSize * 12,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'ورود',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: User.deviceBlockSize * 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: IgnorePointer(
                  ignoring: isLoading,
                  child: InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.registerScreen),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF2D3B63),
                      ),
                      height: User.deviceBlockSize * 12,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'ثبت نام',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: User.deviceBlockSize * 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(Routes.forgetPassScreen),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _mainFontColor,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'رمز عبور خود را فراموش کرده ام',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: User.deviceBlockSize * 4,
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
      value: SystemUiOverlayStyle(
          statusBarColor: _mainFontColor,
          statusBarIconBrightness: Brightness.light),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key? key,
    required double deviceBlockSize,
  })  : this.deviceBlockSize = deviceBlockSize,
        super(key: key);

  final double deviceBlockSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
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
              Icons.power_settings_new,
              color: Color(0xFFE2A44A),
              size: User.deviceBlockSize * 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LET'S",
                  style: TextStyle(
                    color: Color(0xFFE2A44A),
                    fontSize: User.deviceBlockSize * 7.5,
                    fontFamily: 'montserrat',
                  ),
                ),
                Text(
                  "DIG IN",
                  style: TextStyle(
                    color: Color(0xFFE2A44A),
                    fontSize: User.deviceBlockSize * 7.5,
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
