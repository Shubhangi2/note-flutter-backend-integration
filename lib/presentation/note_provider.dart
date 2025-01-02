import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:note_app/data/note_model.dart';

class NoteProvider with ChangeNotifier {
  final dio = Dio();
  final url = "http://localhost:8000";

  List<NoteModel> _noteList = [];
  List<NoteModel> get noteList => _noteList;

  void setNoteList(List<NoteModel> list) {
    _noteList = list;
    notifyListeners();
  }

  void addNote(NoteModel note) {
    _noteList.add(note);
    notifyListeners();
  }

  void updateNote(NoteModel note) {
    final index = _noteList.indexWhere((note) => note.id == note.id);
    if (index != -1) {
      _noteList[index] = note;
      notifyListeners();
    }
  }

  void deleteNote(int id) {
    final index = _noteList.indexWhere((note) => note.id == id);
    if (index != -1) {
      _noteList.removeAt(index);
      notifyListeners();
    }
  }

  Future<Either<String, List<NoteModel>>> getNotes() async {
    Response response;
    List<NoteModel> noteList = [];
    try {
      response = await dio.get("$url/notes",
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        List<NoteModel> noteList =
            data.map<NoteModel>((note) => NoteModel.fromMap(note)).toList();
        setNoteList(noteList);
        print(noteList.length);
      }
      return right(noteList);
    } catch (e) {
      print("failed to get data ${e.toString()}");
      return left("Failed to get data");
    }
  }

  Future<Either<String, String>> insertNote(
      String title, String content) async {
    Response response;
    try {
      var body = {'title': title, 'content': content};
      response = await dio.post("$url/insert",
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: jsonEncode(body));

      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        // setNoteList(_noteList.add(NoteModel.fromMap(data)));
        addNote(NoteModel.fromMap(data));
      }

      return right("Note inserted successfully");
    } catch (e) {
      print("failed to insert data ${e.toString()}");
      return left("Failed to insert data");
    }
  }

  Future<Either<String, String>> UpdateNote(
      String title, String content) async {
    Response response;
    try {
      var body = {'title': title, 'content': content};
      response = await dio.post("$url/update",
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: jsonEncode(body));

      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        updateNote(data);
      }

      return right("Note updated successfully");
    } catch (e) {
      print("failed to insert note ${e.toString()}");
      return left("Failed to update note");
    }
  }
 Future<Either<String, String>> DeleteNote(
      int id) async {
    Response response;
    try {
      var body = {'id': id};
      response = await dio.post("$url/delete",
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: jsonEncode(body));

      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        deleteNote(data);
      }
      return right("Note updated successfully");
    } catch (e) {
      print("failed to insert note ${e.toString()}");
      return left("Failed to update note");
    }
  }
}
