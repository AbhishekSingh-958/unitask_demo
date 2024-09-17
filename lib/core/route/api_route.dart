abstract class ApiUrl {
  //http://api.nixler.xyz/v1/events/?city=Delhi&category=66b195fcf061bbc1c22731dd

  // Base Url
  static const String baseUrl = "https://dummyjson.com";

  static String getProducts = '$baseUrl/products';
  static String productCategories = '$baseUrl/products/categories';
}
