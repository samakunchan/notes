import 'package:notes/core/models/api_response_model.dart';import 'package:http/http.dart' as http;import 'dart:convert';import 'dart:developer' as developer;class NoteService {  final url = Uri.parse('http://10.0.2.2:3000/notes');  Future<ApiResponseModel> getNotesList() async {    final response = await http.get(url);    if (response.statusCode == 200) {      // developer.log(response.body, name: 'CONSOLE.LOG SERVICE BODY');      Map<String, dynamic> fieldsMap = {};      fieldsMap['error'] = false;      fieldsMap['message'] = 'No error';      fieldsMap['datas'] = jsonDecode(response.body);      return ApiResponseModel.fromJson(fieldsMap);    } else {      Map<String, dynamic> fieldsMap = {};      fieldsMap['datas'] = [];      fieldsMap['error'] = true;      fieldsMap['message'] = 'Un problème est survenue.';      return ApiResponseModel.fromJson(fieldsMap);    }  }}