import 'package:flutter/material.dart';class DeleteNotesPresentation extends StatelessWidget {  const DeleteNotesPresentation({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return AlertDialog(      title: const Text('Attention'),      content: const Text('Êtes-vous sure de vouloir supprimer cette note'),      actions: <Widget>[        FloatingActionButton(          onPressed: () {           Navigator.of(context).pop(true);          },          child: const Text('OUI'),        ),        FloatingActionButton(          onPressed: () {            Navigator.of(context).pop(false);          },          child: const Text('NON'),        )      ],    );  }}