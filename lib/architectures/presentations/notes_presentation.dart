import 'package:flutter/material.dart';import 'package:get_it/get_it.dart';import 'package:notes/architectures/presentations/delete_notes_presentation.dart';import 'package:notes/architectures/presentations/save_notes_presentation.dart';import 'package:notes/core/models/api_response_model.dart';import 'package:notes/core/models/note_model.dart';import 'package:notes/core/services/notes_service.dart';import 'dart:developer';import 'package:flutter/foundation.dart';class NotesPresentation extends StatefulWidget {  NotesPresentation({Key? key}) : super(key: key);  @override  State<NotesPresentation> createState() => _NotesPresentationState();}class _NotesPresentationState extends State<NotesPresentation> {  NoteService get service => GetIt.instance<NoteService>();  List<NoteModel> notes = [];  ApiResponseModel<NoteModel>? _apiResponseModel;  bool _isLoading = false;  _fetchNotes() async {    setState(() {      _isLoading = true;    });    _apiResponseModel = await service.getNotesList();    log('data $_apiResponseModel');    debugPrint('data $_apiResponseModel');    setState(() {      _isLoading = false;    });  }  @override  void initState() {    notes = service.getNotesList() as List<NoteModel>;    _fetchNotes();    debugPrint('data $_apiResponseModel');    super.initState();  }  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(title: const Text('Listes des notes'),),      floatingActionButton: FloatingActionButton(        onPressed: () {          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SaveNotesPresentation()));        },        child: const Icon(Icons.add)      ),      body: Builder(        builder: (context) {          return ListView.separated(            itemBuilder: (_, index) {              return Dismissible(                key: ValueKey(_apiResponseModel?.data![index].id),                onDismissed: (direction) {                },                confirmDismiss: (direction) async {                  return await showDialog(context: context, builder: (_) => const DeleteNotesPresentation());                },                background: Container(                  color: Colors.red,                  padding: const EdgeInsets.only(left: 20),                  child: const Align(                    child: Icon(Icons.delete, color: Colors.white,),                    alignment: Alignment.centerLeft,                  ),                ),                secondaryBackground: Container(                  color: Colors.green,                  padding: const EdgeInsets.only(right: 20),                  child: const Align(                    child: Icon(Icons.archive, color: Colors.white,),                    alignment: Alignment.centerRight,                  ),                ),                child: ListTile(                  title: Text(                    '${_apiResponseModel?.data![index].title} ${index + 1}',                    style: TextStyle(color: Theme.of(context).primaryColor),                  ),                  subtitle: Text('${_apiResponseModel?.data![index].updatedAt.day.toString().padLeft(2,'0')}/${_apiResponseModel?.data![index].updatedAt.month.toString().padLeft(2,'0')}/${_apiResponseModel?.data![index].updatedAt.year}'),                  onTap: () {                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SaveNotesPresentation(id: _apiResponseModel?.data![index].id)));                },              ));            },            separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.green,),            itemCount: 3          );        }      ),    );  }}