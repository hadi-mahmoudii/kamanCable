import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Cores/Config/user.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Models/request_result.dart';
import '../../../Cores/Widgets/alert_dialog.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/header2.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../Providers/auth.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  final TextEditingController _usernameCtrl = new TextEditingController();
  final TextEditingController _cellNumberCtrl = new TextEditingController();
  final TextEditingController _passwordCtrl = new TextEditingController();
  final TextEditingController _rePasswordCtrl = new TextEditingController();
  static GlobalKey<FormState> _form = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
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
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            // Image.asset(
            //   'assets/Images/signup.png',
            //   height: 30 * _deviceHeightBlockSize,
            //   width: 30 * _deviceHeightBlockSize,
            //   fit: BoxFit.fitWidth,
            // ),
            SignUpHeader(deviceBlockSize: User.deviceBlockSize),
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
              child: SimpleHeader2('ثبت نام', 'REGISTER'),
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
                                return 'لطفا نام و نام خانوادگی خود را وارد کنید.';
                              } else {
                                return null;
                              }
                            },
                            controller: _usernameCtrl,
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.userAlt,
                                size: 4 * User.deviceBlockSize,
                              ),
                              labelText: 'نام و نام خانوادگی',
                              isDense: true,
                            ),
                            style: TextStyle(
                              fontSize: 5 * User.deviceBlockSize,
                            ),
                            textDirection: TextDirection.rtl,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Directionality(
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
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.phone,
                                size: 4 * User.deviceBlockSize,
                              ),
                              labelText: 'شماره تماس',
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
                            controller: _passwordCtrl,
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
                            textDirection: TextDirection.rtl,
                            keyboardType: TextInputType.text,
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
                                return 'لطفا رمز خود را مجددا وارد کنید.';
                              }
                              if (value.length < 8) {
                                return 'طول رمز باید حداقل 8 کاراکتر باشد!';
                              }
                              if (value != _passwordCtrl.text) {
                                return 'رمز های واردشده یکسان نمی باشند !';
                              }
                              return null;
                            },
                            controller: _rePasswordCtrl,
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                size: 4 * User.deviceBlockSize,
                              ),
                              labelStyle: TextStyle(fontFamily: 'iranyekan'),
                              labelText: 'تکرار کلمه ی عبور',
                              isDense: true,
                            ),
                            style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 5 * User.deviceBlockSize,
                            ),
                            obscureText: true,
                            textDirection: TextDirection.rtl,
                            keyboardType: TextInputType.text,
                          ),
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
                    _form.currentState!.save();
                    setState(() {
                      isLoading = true;
                    });
                    await Provider.of<Auth>(context, listen: false)
                        .signUp(
                      _usernameCtrl.text,
                      _passwordCtrl.text,
                      _cellNumberCtrl.text,
                    )
                        .then((result) {
                      if (result == RequestResult.VerifyPhone) {
                        Navigator.of(context)
                            .popAndPushNamed(Routes.registerVerify);
                      } else if (result == RequestResult.DuplicateNumber) {
                        showDialog(
                          context: context,
                          builder: (ctx) => GlobalAlertDialog(
                            title: 'خطا',
                            content: 'این شماره تلفن قبلااستفاده شده است!',
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                        // print('duplicate');
                      } else {
                        Navigator.of(context).pop();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _mainFontColor,
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
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
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
              FontAwesomeIcons.plus,
              color: Color(0xFFE2A44A),
              size: User.deviceBlockSize * 17,
            ),
            SizedBox(
              width: User.deviceBlockSize,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "JOIN THE",
                  style: TextStyle(
                    color: Color(0xFFE2A44A),
                    fontSize: User.deviceBlockSize * 7.5,
                    fontFamily: 'montserrat',
                  ),
                ),
                Text(
                  "CLUB",
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
