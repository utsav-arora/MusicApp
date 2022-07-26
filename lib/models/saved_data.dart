import 'package:flutter/material.dart';
import 'package:music_app/models/saved_model.dart';

class SavedData extends ChangeNotifier{
  List saved=[

  ];

  void saveTrack(String name , String id){
    final track= SavedModel(id: id, name: name);
    saved.add(track);
    notifyListeners();
  }
}