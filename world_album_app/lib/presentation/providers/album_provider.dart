import 'package:flutter/material.dart';

class AlbumProvider extends ChangeNotifier{
  String? selectedItem;
  num? pageNumber;
  
  Future<void> changeItem(String? value, num page) async{
    if (value == null){
      return;
    }
    selectedItem = value;
    pageNumber =  page;
    notifyListeners();
  }


}