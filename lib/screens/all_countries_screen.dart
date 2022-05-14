import 'package:covid19app/common_widgets/country_tile.dart';
import 'package:covid19app/models/countries_response_model.dart';
import 'package:covid19app/services/all_countries_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'country_details_screen.dart';

class AllCountriesScreen extends StatefulWidget {
  List<CountryModel> countries = [];
  Global? global;

  AllCountriesScreen({Key? key, required this.countries, required this.global}) : super(key: key);

  @override
  _AllCountriesScreenState createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (widget.global != null)
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) {
                    return CountryDetailScreen(
                        country: CountryModel(
                      country: 'WORLD',
                      totalConfirmed: widget.global!.totalConfirmed!,
                      totalDeaths: widget.global!.totalDeaths!,
                      totalRecovered: widget.global!.totalRecovered!,
                      newConfirmed: widget.global!.newConfirmed!,
                      newDeaths: widget.global!.newDeaths!,
                      newRecovered: widget.global!.newRecovered!
                    ));
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        'WORLD',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          color: Color(0xff424242),
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: false,
                      )),
                      Text(
                        '${widget.global!.totalConfirmed}',
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          color: Color(0xff424242),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
              ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.countries.length,
                itemBuilder: (context, index) {
                  return CountryTile(
                      ontap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return CountryDetailScreen(
                              country: widget.countries[index]);
                        }));
                      },
                      countryName: widget.countries[index].country!,
                      casesCount: widget.countries[index].totalConfirmed!);
                })
          ],
        ),
      ),
    );
  }

  void _onRefresh() async{

    await AllCountriesService().getAllCountries(context: context);

    _refreshController.refreshCompleted();
  }
}
