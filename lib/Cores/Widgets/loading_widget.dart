import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Config/user.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    required Color mainFontColor,
  })  : _mainFontColor = mainFontColor,
        super(key: key);

  final Color _mainFontColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCubeGrid(
        size: User.deviceBlockSize * 8,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: _mainFontColor,
              // color: index.isEven ? _mainFontColor: _secondColor,
            ),
          );
        },
      ),
    );
  }
}
