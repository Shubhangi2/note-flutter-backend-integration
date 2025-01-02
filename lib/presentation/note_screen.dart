import 'package:flutter/material.dart';
import 'package:note_app/data/note_model.dart';
import 'package:note_app/presentation/note_provider.dart';
import 'package:note_app/presentation/utils/show_snackbar.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}


class _NoteScreenState extends State<NoteScreen> {

  @override
  void initState() {
    super.initState();

    callFunctions();
  }

    void callFunctions() async {
    final result =await context.read<NoteProvider>().getNotes();
      result.fold((l)=> showSnackBar(context, l, Colors.red), (r)=>showSnackBar(context, "data fetched successfully", Colors.green));
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Center(child: Text( context.watch<NoteProvider>().noteList.length.toString()),)
    );
  }
  

}
