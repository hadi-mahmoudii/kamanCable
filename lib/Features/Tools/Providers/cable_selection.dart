import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Entities/cable_selection_datas.dart';

class CableSelectionProvider extends ChangeNotifier with ReassembleHandler {
  @override
  void reassemble() {}
  int guiderTypeIndex = 0;
  String guiderTypeValue = 'مفتولی';
  void setGuiderType(int index, String value) {
    guiderTypeIndex = index;
    guiderTypeValue = value;
    setSelectedTableVarIndex();
  }

  int endodIndex = 0;
  String endodValue = 'بدون اندود';
  void setEndod(int index, String value) {
    endodIndex = index;
    endodValue = value;
    setSelectedTableVarIndex();
  }

  int selectedTableVarIndex = 0;
  void setSelectedTableVarIndex() {
    selectedTableVarIndex = 2 * guiderTypeIndex + endodIndex;
  }

  double voltageValue = 1;
  void setVoltageValue(double value) {
    voltageValue = value;
  }

  double dVoltageValue = 0;
  void setdVoltageValue(double value) {
    dVoltageValue = value;
  }

  double pathDistance = 1;
  void setdPathDistanceValue(double value) {
    pathDistance = value;
  }

  double currentValue = 0.0;

  double powerValue = 0.0;

  String currentToPower(double current) {
    currentValue = current;
    powerValue = currentValue * voltageValue / 1000;
    return powerValue.toString();
  }

  String powerToCurrent(double power) {
    powerValue = power;
    currentValue = powerValue * 1000 / voltageValue;
    return currentValue.toString();
  }

  double? sizeValue = 0.0;
  double? setSizeValue(
    int index,
  ) {
    if (index >= cableTableValues[selectedTableVarIndex].length) {
      sizeValue = 0;
      notifyListeners();
      return sizeValue;
    }
    // print(index);
    // print(currentValue);
    // print(cableTableValues[selectedTableVarIndex][index]);
    // print(pathDistance);
    // print(voltageValue);
    // print(dVoltageValue);
    // print('---------');
    double value = ((((currentValue *
                    cableTableValues[selectedTableVarIndex][index] *
                    pathDistance) /
                1000) /
            voltageValue) *
        100);
    if (value < dVoltageValue) {
      // sizeValue = cableSizes[index];
      sizeValue = checkMinimumSize(currentValue, cableSizes[index]);
      notifyListeners();
      return sizeValue;
    } else {
      return setSizeValue(index + 1);
    }
  }

  resetValues() {
    guiderTypeIndex = 0;
    endodIndex = 0;
    selectedTableVarIndex = 0;
    voltageValue = 1;
    dVoltageValue = 0;
    pathDistance = 1;
    currentValue = 0.0;
    powerValue = 0.0;
    sizeValue = 0.0;
  }

  double? checkMinimumSize(double amper, double size) {
    int index = checkMaximumDatas.indexWhere((data) => data['size'] == size);
    if (checkMaximumDatas[index]['amper']! < amper) {
      return returnFunction(index + 1, amper, size);
    } else {
      return size;
    }
  }

  double? returnFunction(int index, double amper, double size) {
    //this is a retunr function dor calculate good size
    if (index > checkMaximumDatas.length)
      return checkMaximumDatas[index - 1]['size'];
    if (checkMaximumDatas[index]['amper']! < amper) {
      return returnFunction(index + 1, amper, size);
    } else {
      return checkMaximumDatas[index]['size'];
    }
  }
}
