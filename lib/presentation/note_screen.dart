import 'package:flutter/material.dart';
import 'package:note_app/data/note_model.dart';
import 'package:note_app/presentation/note_provider.dart';
import 'package:note_app/presentation/utils/note_list.dart';
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
    // final result =await context.read<NoteProvider>().getNotes();
    //   result.fold((l)=> showSnackBar(context, l, Colors.red), (r)=>showSnackBar(context, "data fetched successfully", Colors.green));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notes"),
        ),
        body: Container(
             color: Colors.grey.shade300,
             padding: EdgeInsets.only(top: 4),
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return listItem(context, notes[index]);
            },
          ),
        ));
  }

  Widget listItem(BuildContext context, NoteModel note) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal:  8.0),
      child: Card(
        elevation: 3,
         color: Colors.grey.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              const SizedBox(height: 8),
              Text(note.content, style:const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(note.createdAt),const Row(children: [Icon(Icons.delete), SizedBox(width: 12), Icon(Icons.edit)],)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
