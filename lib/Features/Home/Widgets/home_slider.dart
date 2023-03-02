// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';

import '../../../Cores/Config/image_datas.dart';
import '../../../Cores/Config/routes.dart';
import '../../../Cores/Config/user.dart';

// import '../../../Core/Config/app_session.dart';
// import '../../../Core/Config/routes.dart';
// import '../../../Core/Widgets/flutter_icons.dart';
// import '../../Product/Models/category.dart';
// import '../Models/home_slider.dart';

class HomeHeaderImagesBox extends StatefulWidget {
  const HomeHeaderImagesBox({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeHeaderImagesBox> createState() => _HomeHeaderImagesBoxState();
}

class _HomeHeaderImagesBoxState extends State<HomeHeaderImagesBox> {
  int _current = 0;
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // print(homeHeaderImageSwiper[_current].image);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: homeHeaderImageSwiper.length,
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                itemBuilder: (ctx, ind) {
                  // String route = '';
                  // Object arguments = homeHeaderImageSwiper[_current].modelId;
                  return InkWell(
                    onTap: () {
                      if (ind == 1) {
                        Navigator.of(context).pushNamed(Routes.toolsMainScreen);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        homeHeaderImageSwiper[ind]['image']!,
                        width: MediaQuery.of(context).size.width - 40,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () async {
                  _controller.jumpTo(
                    _controller.position.pixels -
                        MediaQuery.of(context).size.width +
                        40,
                    // duration: const Duration(milliseconds: 50),
                    // curve: Curves.linear,
                  );
                  setState(() {
                    if (_current > 0) {
                      _current--;
                    }
                  });
                },
                icon: const Icon(
                  Icons.chevron_left,
                  size: 25,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: homeHeaderImageSwiper.asMap().entries.map((entry) {
                  return GestureDetector(
                    // onTap: () => _controller.jumpToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _current != entry.key
                            ? Colors.grey.withOpacity(.5)
                            : mainFontColor,
                      ),
                      child: const Text(' '),
                    ),
                  );
                }).toList(),
              ),
              IconButton(
                onPressed: () async {
                  _controller.jumpTo(
                    _controller.position.pixels +
                        MediaQuery.of(context).size.width -
                        40,
                    // duration: const Duration(milliseconds: 50),
                    // curve: Curves.linear,
                  );
                  setState(() {
                    if (_current < homeHeaderImageSwiper.length - 1) {
                      _current++;
                    }
                  });
                },
                icon: const Icon(
                  Icons.chevron_right,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
