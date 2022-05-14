import 'package:covid19app/models/countries_response_model.dart';
import 'package:flutter/cupertino.dart';

class CountriesProvider extends ChangeNotifier{

  Global ? global ;
  List<CountryModel> countries = [];

  updateCountriesList({required List<CountryModel> newCountries, required Global ? newGlobal}){
    countries = newCountries;
    global = newGlobal!;
    notifyListeners();
  }
}