import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:simple_splashscreen/simple_splashscreen.dart';

import 'Cores/Config/routes.dart';
import 'Cores/Config/user.dart';
import 'Cores/main-screen.dart';
import 'Cores/splash_screen.dart';
import 'Features/Auth/Providers/auth.dart';
import 'Features/Auth/Screens/forget_pass_screen.dart';
import 'Features/Auth/Screens/login_screen.dart';
import 'Features/Auth/Screens/register_verify.dart';
import 'Features/Auth/Screens/repass_screen.dart';
import 'Features/Auth/Screens/signup_screen.dart';
import 'Features/Blog/Providers/blog_provider.dart';
import 'Features/Blog/Screens/blog-details-screen.dart';
import 'Features/Blog/Screens/blog-screen.dart';
import 'Features/Blog/Screens/filter-blog-screen.dart';
import 'Features/Comment/Providers/comment_provider.dart';
import 'Features/Comment/Screens/comments-screen.dart';
import 'Features/Home/Screens/home-screen.dart';
import 'Features/Products/Screens/category_products_screen.dart';
import 'Features/Products/Screens/category_screen.dart';
import 'Features/Products/Screens/product-item-details-screen.dart';
import 'Features/Products/Screens/product-item-screen.dart';
import 'Features/Products/Screens/products-filter-screen.dart';
import 'Features/Profile/Screens/profile_address_add_screen.dart';
import 'Features/Profile/Screens/profile_addresses_screen.dart';
import 'Features/Profile/Screens/profile_main_screen.dart';
import 'Features/Profile/Screens/profile_overview_credit_screen.dart';
import 'Features/Profile/Screens/profile_overview_email_screen.dart';
import 'Features/Profile/Screens/profile_overview_id_screen.dart';
import 'Features/Profile/Screens/profile_overview_name_screen.dart';
import 'Features/Profile/Screens/profile_overview_number_screen.dart';
import 'Features/Profile/Screens/profile_overview_password_screen.dart';
import 'Features/Profile/Screens/profile_overview_screen.dart';
import 'Features/Tools/Providers/advanced_cable_selection.dart';
import 'Features/Tools/Providers/cable_selection.dart';
import 'Features/Tools/Screens/Telecomunication_screen.dart';
import 'Features/Tools/Screens/advanced_cable_selection_screen.dart';
import 'Features/Tools/Screens/awg_to_mili_screen.dart';
import 'Features/Tools/Screens/buildings_cables_screen.dart';
import 'Features/Tools/Screens/cable_selection_screen.dart';
import 'Features/Tools/Screens/celenec_screen.dart';
import 'Features/Tools/Screens/power_consumption_screen.dart';
import 'Features/Tools/Screens/tools_main_screen.dart';
import 'Features/Tools/Screens/translator_selector_screen.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     // systemNavigationBarColor: Colors.blue, // navigation bar color
  //     statusBarColor: Colors.white, // status bar color
  //     // statusBarBrightness: Brightness.dark,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: User()),
        // ChangeNotifierProvider.value(value: ProfileProvider()),
        ChangeNotifierProvider.value(value: CableSelectionProvider()),
        ChangeNotifierProvider.value(value: AdvancedCableSelectionProvider()),
        // ChangeNotifierProvider.value(value: ConnectivityProvider()),
        ChangeNotifierProvider.value(value: BlogProvider()),
        ChangeNotifierProvider.value(value: CommentProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kaman cable',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(0x1B, 0x27, 0x49, 1),
          // accentColor: Color(0xFFEE3552),
          // Color(0xFF495065)
          fontFamily: 'iranyekan',
          canvasColor: Color(0XFFF9F9F9),
          hoverColor: Colors.blue,
          // cursorColor: Color.fromRGBO(0x1B, 0x27, 0x49, 1),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 18,
              color: mainFontColor,
              fontFamily: 'iranyekanlight',
            ),
            headline2: TextStyle(
              fontSize: 8,
              color: mainFontColor,
              fontFamily: 'montserrat',
              letterSpacing: 4,
            ),
            headline3: TextStyle(
              fontSize: 20,
              color: mainFontColor,
              fontFamily: 'iranyekanregular',
            ),
            headline4: TextStyle(
              fontSize: 15,
              color: mainFontColor,
              // fontFamily: 'monoton',
              // letterSpacing: 4,
            ),
            subtitle1: TextStyle(
              fontSize: 16,
              color: mainFontColor,
              fontFamily: 'iranyekanmedium',
            ),
            subtitle2: const TextStyle(
              fontSize: 12,
              color: Color(0XFFBEBEBE),
            ),
            caption: TextStyle(
              fontSize: 14,
              color: mainFontColor,
              fontFamily: 'iranyekanregular',
            ),
            overline: TextStyle(
              fontSize: 7,
              color: mainFontColor.withOpacity(.9),
            ),
            button: TextStyle(
              fontSize: 12,
              color: mainFontColor,
            ),
            bodyText1: TextStyle(
              fontSize: 10,
              color: mainFontColor,
            ),
            headline5: const TextStyle(
              fontSize: 6,
              color: Color(0XFF1B2749),
              fontFamily: 'iranyekanlight',
            ),
            headline6: TextStyle(
              fontSize: 30,
              color: mainFontColor,
              fontFamily: 'monoton',
            ),
            bodyText2: TextStyle(
              fontSize: 20,
              color: mainFontColor,
            ),
          ),
        ),
        routes: {
          MainScreen.route: (ctx) => new MainScreen(),
          Routes.homeScreen: (ctx) => new HomeScreen(),
          Routes.blogScreen: (ctx) => new BlogScreen(),
          Routes.toolsMainScreen: (ctx) => new ToolsMainScreen(),
          Routes.buildingCablesScreen: (ctx) => new BuildingsCablesScreen(),

          Routes.blogDetailsScreen: (ctx) => new BlogDetailsScreen(),
          FilterBlogScreen.route: (ctx) => new FilterBlogScreen(),
          Routes.commentScreen: (ctx) => new CommentsScreen(),
          CableSelectionScreen.route: (ctx) => new CableSelectionScreen(),
          AdvancedCableSelection.route: (ctx) => new AdvancedCableSelection(),
          Routes.categoryScreen: (ctx) => new CategoryScreen(),
          // ProductsCategoryScreen.route: (ctx) => new ProductsCategoryScreen(),
          Routes.categoryProductsScreen: (ctx) => new CategoryProductsScreen(),
          Routes.productItemScreen: (ctx) => new ProductItemScreen(),

          ProductsFilterScreen.route: (ctx) => new ProductsFilterScreen(),
          // UserCardListScreen.route: (ctx) => new UserCardListScreen(),
          AWGToMiliScreen.route: (ctx) => new AWGToMiliScreen(),
          PowerConsumptionScreen.route: (ctx) => new PowerConsumptionScreen(),
          TranslatorSelectorScreen.route: (ctx) => TranslatorSelectorScreen(),
          CelenecScreen.route: (ctx) => new CelenecScreen(),
          TelecomunicationScreen.route: (ctx) => new TelecomunicationScreen(),
          Routes.profileMainScreen: (ctx) => new ProfileMainScreen(),
          Routes.profileAddressesScreen: (ctx) => new ProfileAddressesScreen(),
          Routes.profileAddressAddScreen: (ctx) =>
              new ProfileAddressAddScreen(),
          Routes.profileOverviewScreen: (ctx) => new ProfileOverviewScreen(),
          Routes.profileOverviewCreditScreen: (ctx) =>
              new ProfileOverveiwCreditScreen(),
          Routes.profileOverviewEmailScreen: (ctx) =>
              new ProfileOverveiwEmailScreen(),
          Routes.profileOverviewIdScreen: (ctx) =>
              new ProfileOverveiwIdScreen(),
          Routes.profileOverviewNameScreen: (ctx) =>
              new ProfileOverveiwNameScreen(),
          Routes.profileOverviewNumberScreen: (ctx) =>
              new ProfileOverveiwNumberScreen(),
          Routes.profileOverviewPasswordScreen: (ctx) =>
              new ProfileOverveiwPasswordScreen(),
          // Routes.profileOrderScreen: (ctx) => new ProfileOrdersScreen(),
          // Routes.profileOrderDetailsScreen: (ctx) =>
          //     new ProfileOrderDetailsScreen(),
          // Routes.userCardAddressSelectScreen: (ctx) =>
          //     UserCardAddressSelectScreen(),
          // Routes.userCardSendMethodScreen: (ctx) => UserCardSendMethodScreen(),
          Routes.loginScreen: (ctx) => LoginScreen(),
          Routes.registerScreen: (ctx) => SignupScreen(),
          Routes.forgetPassScreen: (ctx) => ForgetPassScreen(),
          Routes.rePassScreen: (ctx) => RePassScreen(),
          // Routes.profileOrderFormScreen: (ctx) => ProfileOrderFormScreen(),
          // Routes.profileOrderFormAddScreen: (ctx) =>
          //     ProfileOrderFormAddScreen(),
          // Routes.userCardDeliveryTimeScreen: (ctx) =>
          //     UserCardDeliveryTimeScreen(),
          // Routes.userCardPaymentMethodScreen: (ctx) =>
          //     UserCardPaymentMethodScreen(),
          Routes.registerVerify: (ctx) => RegisterVerifyScreen(),
          Routes.productItemDetailsScreen: (ctx) => ProductItemDetailsScreen(),
        },
        home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return SplashScreen();
            else
              return MainScreen();
          },
        ),
      ),
    );
  }
}
//willa.arts.kamancable
