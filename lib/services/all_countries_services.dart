import 'package:covid19app/config/api_configs.dart';
import 'package:covid19app/models/countries_response_model.dart';
import 'package:covid19app/models/messenger_model.dart';
import 'package:covid19app/providers/countries_provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'custom_snackbar.dart';
import 'get_request_service.dart';
import 'package:flutter/material.dart';

class AllCountriesService{

  Future <bool> getAllCountries({required BuildContext context})async{



    try{
      if(await InternetConnectionChecker().hasConnection){
        MessengerModel response = await ApiCallService.getRequest(url: getCountriesUrl);
        if(response.success!){
          CountriesResponseModel _countriesResponseModel = CountriesResponseModel.fromJson(response.data!);
          Provider.of<CountriesProvider>(context,listen: false).updateCountriesList(newCountries: _countriesResponseModel.countries!, newGlobal: _countriesResponseModel.global);
          return true;
        }else{
          CustomSnackBar.failedSnackBar(context: context, message: 'Couldn\'t get the record from server');
          // un-comment if you want to make data empty if its not available after request
          // Provider.of<CountriesProvider>(context,listen: false).updateCountriesList(newCountries: [], newGlobal: null);
          return false;
        }
      }
      else{
        CustomSnackBar.failedSnackBar(context: context, message: 'Check you internet connection');
        return false;
      }

    }catch(err){
      // message parsing error
      CustomSnackBar.failedSnackBar(context: context, message: 'Data parsing error');
      return false;
    }

  }

}