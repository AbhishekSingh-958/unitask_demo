import 'package:flutter/material.dart';
import 'package:unitask_demo/core/utils/common_functions.dart';
import 'package:unitask_demo/src/features/home/model/product_category.dart';
import 'package:unitask_demo/src/features/home/model/products_data.dart';
import 'package:unitask_demo/src/features/home/repository/home_product_repo.dart';

class ProductProvider extends ChangeNotifier {
  List<Products> _originalProductList = [];
  List<Products> _filteredProductList = [];
  final List<ProductCategory> _categoryList = [];

  List<String> filteredBrandList = [];
  final Map<String, bool> _isCategorySelectedMap = {};
  final List<String> _filteredCategoryList = [];

  final Set<String> _brandsList = {};

  List<Products> get originalProductList => _originalProductList;
  List<Products> get filteredProductList => _filteredProductList;
  List<ProductCategory> get categoryList => _categoryList;
  Set<String> get brandsList => _brandsList;
  Map<String, bool> get isCategorySelectedMap => _isCategorySelectedMap;

  HomeProductRepository productRepository;
  ProductProvider(this.productRepository);

  Future<void> fetchAllProductCategories() async {
    try {
      final data = await productRepository.fetchAllProductCategories();

      for (int i = 0; i < data.length; i++) {
        _categoryList.add(ProductCategory.fromJson(data[i]));
      }

      // isCategorySelectedMap contains status of category is selected for filter or not.
      // Initially initilize of category with false means none of the category is selected for filter.
      for (int i = 0; i < _categoryList.length; i++) {
        isCategorySelectedMap['${_categoryList[i].name}'] = false;
      }

      notifyListeners();
    } catch (e) {
      showSimpleSnackbar('Check Your Network Connection');
    }
  }

  Future<void> fetchAllProducts() async {
    try {
      final data = await productRepository.fetchAllProducts();

      ProductsData productData = ProductsData.fromJson(data);

      _originalProductList = productData.products ?? [];
      for (int i = 0; i < _originalProductList.length; i++) {
        if (_originalProductList[i].brand != null) {
          _brandsList.add(_originalProductList[i].brand!);
        }
      }
      _filteredProductList = originalProductList;
      notifyListeners();
    } catch (e) {
      showSimpleSnackbar('Check Your Network Connection');
    }
  }

  void filterBrandList(List<String> filterBrandList) {
    filterBrandList = filterBrandList;
    // Join all the brands selected for filter in a string. It makes easier to search for brand in list.
    String searchText = filterBrandList.join(' ');

    // If no brand is selected for filter then show all the products.
    if (filterBrandList.isEmpty && _filteredCategoryList.isEmpty) {
      _filteredProductList = _originalProductList;
    } else {
      _filteredProductList = _originalProductList.where((element) {
        if (element.brand == null) {
          return false;
        } else {
          return searchText
              .toLowerCase()
              .contains(element.brand?.toLowerCase() ?? '');
        }
      }).toList();
    }
    notifyListeners();
  }

  void filterCategoryList() {
    // Join all the categories selected for filter in a string. It makes easier to search for brand in list.
    String searchText = _filteredCategoryList.join(' ');

    // If no category is selected for filter then show all the products.
    if (_filteredCategoryList.isEmpty && filteredBrandList.isEmpty) {
      _filteredProductList = _originalProductList;
    } else {
      _filteredProductList = _originalProductList.where((element) {
        if (element.category == null) {
          return false;
        } else {
          return searchText
              .toLowerCase()
              .contains(element.category?.toLowerCase() ?? '');
        }
      }).toList();
    }
    notifyListeners();
  }

  void changeFilterList(String categoryName) {
    if (isCategorySelectedMap[categoryName] == true) {
      // If category is already selected for filter then remove it from list.
      isCategorySelectedMap[categoryName] = false;
      _filteredCategoryList.remove(categoryName);
    } else {
      // If category is not selected for filter then add it to list.
      isCategorySelectedMap[categoryName] = true;
      _filteredCategoryList.add(categoryName);
    }
  }

  void clearFilteredCategoryList() {
    _filteredCategoryList.clear();
    for (int i = 0; i < _categoryList.length; i++) {
      isCategorySelectedMap['${_categoryList[i].name}'] = false;
    }
    notifyListeners();
  }

  void clearFilteredBrandList() {
    filteredBrandList.clear();
  }
}
