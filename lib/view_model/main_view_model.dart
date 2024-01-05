import 'dart:convert';

import 'package:dunya_ulkeleri/model/country.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainViewModel with ChangeNotifier {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";
  final List<Country> _countries = [];

  List<Country> get countries => _countries;

  MainViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCountries();
    });
  }

  void _getCountries() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    Map<String, dynamic> allCountries = jsonDecode(response.body);
    List<dynamic> result = allCountries["results"];
    for (Map<String, dynamic> countryMap in result) {
      Country country = Country.fromMap(countryMap);
      _countries.add(country);
    }
    notifyListeners();
  }
}
