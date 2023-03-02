import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Entities/advanced_cable_selection.dart';

class AdvancedCableSelectionProvider extends ChangeNotifier
    with ReassembleHandler {
  @override
  void reassemble() {}

  double tempFactor = 1.22;
  double groundFactor = 1.21;
  double depthFactor = 1.1;
  double numAndDisFactor = 1;
  double totalFactor = 1.62382;

  int barTypeIndex = 0;
  String barTypeValue = 'روشنایی';
  void setBarType(int index, String value) {
    barTypeIndex = index;
    barTypeValue = value;
  }

  int circuitNumberIndex = 0;
  String circuitNumberValue = '1';
  int cableDistanceIndex = 0;
  String cableDistanceValue = 'together';
  void setCircuitNumber(int index, String value) {
    circuitNumberIndex = index;
    circuitNumberValue = value;
    numAndDisFactor = numAndDisValues[cableDistanceIndex][circuitNumberIndex];
    calculateTotalFactor();
  }

  void setCableDistance(int index, String value) {
    cableDistanceIndex = index;
    cableDistanceValue = value;
    numAndDisFactor = numAndDisValues[cableDistanceIndex][circuitNumberIndex];
    calculateTotalFactor();
  }

  double inputValue = 1;
  void setInputValue(double value) {
    inputValue = value;
  }

  double voltageValue = 1;
  void setVoltageValue(double value) {
    voltageValue = value;
  }

  int tempIndex = 0;
  String tempValue = '10';
  setTemp(int index, String value) {
    tempIndex = index;
    tempValue = value;
    calculateTempFactor();
  }

  int insulationMaterialIndex = 0;
  String insulationMaterialValue = 'PVC';
  void setInsulationMaterial(int index, String value) {
    insulationMaterialIndex = index;
    insulationMaterialValue = value;
    calculateTempFactor();
  }

  int insulationPlaceIndex = 0;
  String insulationPlaceValue = 'زمین';
  void setInsulationPlace(int index, String value) {
    insulationPlaceIndex = index;
    insulationPlaceValue = value;
    calculateTempFactor();
    notifyListeners();
  }

  int natureOfSoilIndex = 0;
  String natureOfSoilValue = 'Very Wet Soil';
  void setNatureOfSoil(int index, String value) {
    natureOfSoilIndex = index;
    natureOfSoilValue = value;
    groundFactor = natureOfSoilValues[index];
    calculateTotalFactor();
  }

  int layingDepthIndex = 0;
  String layingDepthValue = '0.5';
  void setLayingDepth(int index, String value) {
    layingDepthIndex = index;
    layingDepthValue = value;
    depthFactor = layingDepthValues[index];
    calculateTotalFactor();
  }

  calculateTempFactor() {
    if (insulationMaterialIndex == 0) {
      if (insulationPlaceIndex == 1)
        tempFactor = pvcAirValues[tempIndex];
      else
        tempFactor = pvcGroundValues[tempIndex];
    } else {
      if (insulationPlaceIndex == 1)
        tempFactor = xlpeAirValues[tempIndex];
      else
        tempFactor = xlpeGroundValues[tempIndex];
    }
    calculateTotalFactor();
  }

  calculateTotalFactor() {
    totalFactor = tempFactor * groundFactor * depthFactor * numAndDisFactor;
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

  double current = 0;
  double eachLineAmp = 0;
  double effectiveAmp = 0;
  calculateResult() {
    double power;
    if (barTypeIndex != 0)
      power = inputValue / 0.85;
    else
      power = inputValue;
    current = power * 1000 / voltageValue;
    eachLineAmp = current / double.parse(circuitNumberValue);
    effectiveAmp = eachLineAmp * totalFactor;
    notifyListeners();
  }

  resetValues() {
    tempFactor = 1.22;
    groundFactor = 1.21;
    depthFactor = 1.1;
    numAndDisFactor = 1;
    totalFactor = 1.62382;
    barTypeIndex = 0;
    barTypeValue = 'روشنایی';
    circuitNumberIndex = 0;
    circuitNumberValue = '1';
    cableDistanceIndex = 0;
    cableDistanceValue = 'together';
    inputValue = 1;
    voltageValue = 1;
    tempIndex = 0;
    tempValue = '10';
    insulationMaterialIndex = 0;
    insulationMaterialValue = 'PVC';
    insulationPlaceIndex = 0;
    insulationPlaceValue = 'زمین';
    natureOfSoilIndex = 0;
    natureOfSoilValue = 'Very Wet Soil';
    layingDepthIndex = 0;
    layingDepthValue = '0.5';
    currentValue = 0.0;
    powerValue = 0.0;
    current = 0;
    eachLineAmp = 0;
    effectiveAmp = 0;
  }
}
