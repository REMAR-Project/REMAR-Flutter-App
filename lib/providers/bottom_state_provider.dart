import 'package:flutter/cupertino.dart';

class BottomStateProvider extends ChangeNotifier{
  bool isOptionSelected = false;
  void updateBottomBar({required bool selected}){
    isOptionSelected = selected;
    notifyListeners();
  }

}