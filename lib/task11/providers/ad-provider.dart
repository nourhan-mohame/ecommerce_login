import 'package:ecommerce_login/task11/models/ads-models.dart';
import 'package:flutter/cupertino.dart';

class adprovider extends ChangeNotifier{
  List<Ad> _ads=[];
  List<Ad> get ads => _ads;

  void setAds(List<Ad> ads) {
    _ads = ads;
    notifyListeners();
  }


}
