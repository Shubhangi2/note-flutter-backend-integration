

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/note_model.dart';

class NoteProvider  with ChangeNotifier{
   final _dio = Dio();

    List<NoteModel> _noteList = [];
    List<NoteModel> get noteList => _noteList;
    
    void setNoteList(List<NoteModel> list){
      _noteList = list;
    }


    void getNotes() async{
        try{

        }catch(e){
          
        }
    }


}