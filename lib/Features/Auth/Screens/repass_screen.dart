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

class RePassScreen extends StatefulWidget {
  @override
  _RePassScreenState createState() => _RePassScreenState();
}

class _RePassScreenState extends State<RePassScreen> {
  bool isLoading = false;
  TextEditingController _password = new TextEditingController();
  TextEditingController _rePassword = new TextEditingController();
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
      body: ListView(
        children: <Widget>[
          RePassScreenHeader(deviceBlockSize: User.deviceBlockSize),
          // Image.asset(
          //   'assets/Images/signin.png',
          //   height: 30 * _deviceHeightBlockSize,
          //   width: 30 * _deviceHeightBlockSize,
          //   fit: BoxFit.fitWidth,
          // ),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SimpleHeader2('رمز عبور جدید', 'NEW PASSWORD'),
          ),
          SizedBox(
            height: 20,
          ),
          isLoading
              ? LoadingWidget(mainFontColor: _mainFontColor)
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: <Widget>[
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.length < 8) {
                                return 'طول رمز باید حداقل 8 کاراکتر باشد.';
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
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.length < 8) {
                                return 'طول رمز باید حداقل 8 کاراکتر باشد.';
                              }
                              if (value != _password.text) {
                                return 'پسورد ها یکسان نیستند.';
                              }
                              return null;
                            },
                            controller: _rePassword,
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
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
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
                  // print(_password.text);
                  await Provider.of<Auth>(context, listen: false)
                      .sendRePass(_password.text)
                      .then((result) async {
                    if (result == RequestResult.Accept) {
                      await showDialog(
                        context: context,
                        builder: (ctx) => GlobalAlertDialog(
                          title: '',
                          content: 'رمز شما با موفقیت تغییر یافت.',
                        ),
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (ctx) => GlobalAlertDialog(
                          title: 'خطا',
                          content:
                              'متاسفانه خطایی رخ داده است.دقایقی دیگر امتحان کنید!',
                        ),
                      );
                    }
                    Navigator.of(context).pushReplacementNamed(
                      Routes.loginScreen,
                    );
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
                  height: 12 * User.deviceBlockSize,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'تنظیم مجدد',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 4 * User.deviceBlockSize,
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
    );
  }
}

class RePassScreenHeader extends StatelessWidget {
  const RePassScreenHeader({
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
            Image.asset('assets/Icons/key.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "KEEP IT",
                  style: TextStyle(
                    color: Color(0xFFE2A44A),
                    fontSize: User.deviceBlockSize * 7.5,
                    fontFamily: 'montserrat',
                  ),
                ),
                Text(
                  "SAFE",
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
