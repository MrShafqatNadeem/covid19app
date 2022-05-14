


import 'package:covid19app/providers/countries_provider.dart';
import 'package:covid19app/screens/all_countries_screen.dart';
import 'package:covid19app/screens/search_screen.dart';
import 'package:covid19app/services/all_countries_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isLoading = false;
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _getAllCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
    child:
    Consumer<CountriesProvider>(builder: (context, countries, _) {
            if (isLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else {
              return PageView(
                controller: controller,
                onPageChanged: (page) {
                  _selectedIndex = page;
                  setState(() {});
                },
                children: [
                  AllCountriesScreen(
                    global: countries.global,
                    countries: countries.countries,
                  ),
                  SearchScreen(countries: countries.countries)
                ],
              );
            }
          }),
        ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff009688),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              tooltip: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
              tooltip: 'search',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 30,
          onTap: (val) {
            controller.animateToPage(val,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1000));
            _selectedIndex = val;
            setState(() {});
            //print(val);
          },
          elevation: 5),
    );
  }

  _getAllCountries() async {
    // loader.shoow
    isLoading = true;
    setState(() {});
    await AllCountriesService().getAllCountries(context: context);
    isLoading = false;
    // loader.hide
    setState(() {});
  }
}
