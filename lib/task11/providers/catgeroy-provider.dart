
import 'package:ecommerce_login/task11/models/catgeroy.dart';
import 'package:flutter/cupertino.dart';

class catgeroyprovider extends ChangeNotifier{
  List<catgeroy_data> _catgerioes=[];
  List<catgeroy_data> get categories => _catgerioes;

  void setCategories(List<catgeroy_data> categories) {
    _catgerioes = categories;
    notifyListeners();
  }
}