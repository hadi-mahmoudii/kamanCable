

class CategoryProductsModel {
  final String id;
  final String name;
  final String nameE;
  final String image;
  // final String count;
  // final String parentId;

  CategoryProductsModel({
    required this.id,
    required this.name,
    required this.nameE,
    required this.image,
    // @required this.parentId,
    // this.count,
  });
  factory CategoryProductsModel.fromJson(Map datas) {
    return CategoryProductsModel(
      id: datas['id'].toString(),
      name: datas['name'].toString(),
      nameE: datas['name_en'].toString(),
      image: datas['thumbnail'].toString(),
      // parentId: datas['parent_id'].toString() != 'null'
      //     ? datas['parent_id'].toString()
      //     : '',
      // count: datas['children_count'].toString(),
    );
  }
}
