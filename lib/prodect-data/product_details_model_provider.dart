import 'package:flutter/cupertino.dart';

class product_details_model_provider extends ChangeNotifier{
  String _selectsize='';
  String get selectsize=>_selectsize;

  void updateselectsize(String size){
    _selectsize=size;
    notifyListeners();
  }
}