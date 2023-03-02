import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Features/Auth/Providers/auth.dart';
import 'Config/user.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  bool isInit = true;
  bool isLoggediIn = false;
  @override
  void didChangeDependencies() {
    if (isInit) {
      // Provider.of<ConnectivityProvider>(context).checkConnection();
      var sizes = MediaQuery.of(context).size;
      Provider.of<User>(context, listen: false).setSizes(sizes);
      var authObject = Provider.of<Auth>(context);
      authObject.tryAutoLogin(context).then((result) {
        setState(() {
          if (result) {
            isLoggediIn = true;
          } else {
            isLoggediIn = false;
          }
          isInit = false;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    return AnnotatedRegion(
      child: Scaffold(
        backgroundColor: _mainFontColor,
        bottomNavigationBar: Container(
          height: User.deviceBlockSize * 13,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Kaman Cable',
                // 'کــــــــــــــابل کــــــــــــمان',
                style: TextStyle(
                  color: Color(0xFFE2A44A),
                  fontSize: 5 * User.deviceBlockSize,
                  letterSpacing: 2,
                  fontFamily: 'montserrat',
                ),
                textDirection: TextDirection.rtl,
              ),
              Text(
                'Industries',
                style: TextStyle(
                  color: Color(0xFFE2A44A),
                  fontSize: 5 * User.deviceBlockSize,
                  letterSpacing: 5,
                  fontFamily: 'montserrat',
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: User.deviceHeigth * .2,
              ),
              Image.asset(
                'assets/Icons/App_icon.png',
                height: 45 * User.deviceBlockSize,
                width: 45 * User.deviceBlockSize,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: User.deviceBlockSize,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Color(0xFFE2A44A),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'صنــــــــــایع',
                        style: TextStyle(
                          fontSize: 9 * User.deviceBlockSize,
                          color: Color(0xFFE2A44A),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        'کــــــــــــــابل',
                        style: TextStyle(
                          fontSize: 9 * User.deviceBlockSize,
                          color: Color(0xFFE2A44A),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        'کـــــــــــمان',
                        style: TextStyle(
                          fontSize: 9 * User.deviceBlockSize,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFE2A44A),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: User.deviceHeigth * .2,
              ),
            ],
          ),
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: _mainFontColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
