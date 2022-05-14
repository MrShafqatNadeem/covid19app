import 'package:covid19app/common_widgets/country_tile.dart';
import 'package:covid19app/models/countries_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'country_details_screen.dart';

class SearchScreen extends StatefulWidget {
  List<CountryModel> countries = [];

  SearchScreen({required this.countries});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CountryModel> searchedCountriesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchedCountriesList = widget.countries;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          child: TextField(
            style: const TextStyle(color: Colors.black, fontSize: 18),
            cursorColor: Colors.black,
            decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search_sharp),
                fillColor: Color(0xfff0f0f0),
                filled: true),
            onChanged: (name) {
              _searchCountryByName(name: name);
            },
          ),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchedCountriesList.length,
              itemBuilder: (context, index) {
                return CountryTile(
                  countryName: searchedCountriesList[index].country!,
                  casesCount: searchedCountriesList[index].totalConfirmed!,
                  ontap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      return CountryDetailScreen(
                          country: searchedCountriesList[index]);
                    }));
                  },
                );
              }),
        ),
      )
    ]);
  }

  _searchCountryByName({required String name}) {
    try {
      searchedCountriesList = [];
      widget.countries.forEach((element) {
        // print('on element -> ${element.country}');
        if (element.country!.toLowerCase().contains(name.toLowerCase())) {
          print('name matche : $name : ${element.country}');
          searchedCountriesList.add(element);
        }
        setState(() {});
      });
    } catch (err) {
      print('err $err');
      searchedCountriesList = [];
      setState(() {});
    }
  }
}
