
import 'package:flutter/material.dart';
import 'package:note_app/data/note_model.dart';

class NoteInfo extends StatefulWidget {
    final NoteModel note;

  const NoteInfo({super.key, required this.note});

  @override
  State<NoteInfo> createState() => _NoteInfoState();
}

class _NoteInfoState extends State<NoteInfo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
         backgroundColor: Colors.grey.shade100,
          surfaceTintColor: Colors.black,
        title: const Text("Note Info"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Delete note logic goes here
            },
          ),
        ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(18.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.note.title, style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
           const SizedBox(height: 12.0,),
          const Text("2 January 5:09 PM", style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 16.0,),
          Text(widget.note.content, textAlign: TextAlign.justify,),
      ],),
    ),

    floatingActionButton: FloatingActionButton(onPressed: (){},child: const Icon(Icons.edit), backgroundColor: Colors.grey.shade700, foregroundColor: Colors.white,),
    );
  }
}