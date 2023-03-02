class Urls {
  static const baseUrl = 'https://www.willaengine.ir/api/v1';
  static const domain = 'https://www.kamancable.ir';

  static const login = '$baseUrl/login';

  static const signUp = '$baseUrl/register';

  static const verifyForgetPassNumber = '$baseUrl/verify-forgot-password';
  static const sendRePass = '$baseUrl/reset-password';
  static const getForgetPassNumber = '$baseUrl/forgot-password';
  static const verifyRegisterNumber = '$baseUrl/verify-register';

  static const getMyOrderForms = '$baseUrl/order-photos';
  static const addMyOrderForms = '$baseUrl/order-photos-client';
  static String updateMyOrderForms(String id) {
    return '$baseUrl/order-photos-client/$id';
  }

  static String deleteMyOrderForms(String id) {
    return '$baseUrl/order-photos/$id';
  }

  static const addImage = '$baseUrl/file';
  static String removeImage(String id) {
    return '$baseUrl/file/$id';
  }

  static const getBlogItems = '$baseUrl/get-articles?per_page=10';
  // static const getCategories = '$baseUrl/get-product-categories';
  static getCategories(String id) {
    return '$baseUrl/get-product-categories?filters[parent_id]=$id';
  }

  static getProducts(String id,String page) {
    return '$baseUrl/get-products?filters[product_category]=$id&page=$page';
  }

  static getProduct(String? id) {
    return '$baseUrl/get-products/$id';
  }

  static const sendComment = '$baseUrl/comments';
  static String getComments(String? id, String? type) {
    return '$baseUrl/get-comments?per_page=10&rel_id=$id&rel_type=$type';
  }
}
