
import 'attribute.dart';

class ProductModel {
  final String id;
  final String name;
  final String nameE;
  final String image;
  final String description;
  final List<AttributeModel> variablesAttribute;
  final List<AttributeModel>? optionsAttribute;
  final Map<String, String> otherDetails;
  ProductModel({
    required this.id,
    required this.name,
    required this.nameE,
    required this.image,
    required this.description,
    required this.variablesAttribute,
    required this.otherDetails,
    this.optionsAttribute,
  });
  factory ProductModel.fromJson(Map datas) {
    List<AttributeModel> variableItems = [];
    datas['attributes']['variations'].forEach(
      (element) {
        variableItems.add(
          AttributeModel.fromJson(element),
        );
      },
    );
    Map<String, String> otherDetails = {};
    try {
      datas['form_detail']['product_category'].forEach(
        (ky, val) {
          otherDetails[ky] = val;
        },
      );
    } catch (e) {}
    // print(otherDetails);
    return ProductModel(
      id: datas['id'].toString(),
      name: datas['name'].toString(),
      nameE: datas['name_en'].toString(),
      image: datas['thumbnail'].toString(),
      description: datas['description'].toString(),
      variablesAttribute: variableItems,
      otherDetails: otherDetails,
    );
  }
}
