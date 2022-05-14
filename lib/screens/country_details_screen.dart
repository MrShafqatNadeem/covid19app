import 'package:covid19app/common_widgets/case_count_widget.dart';
import 'package:covid19app/models/countries_response_model.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  CountryModel country;

  CountryDetailScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0), child: Container(
        // height: 300,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff009688),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_sharp, color: Colors.white,size: 30,)),
            ),
            Text(
              country.country!,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                color: Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'CORONA STATS OVERVIEW',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: Color(0xffffffff),
                letterSpacing: 0.7000000000000001,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            )
          ],
        ),
      ),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Wrap(
            children: [
              CasesCountWidget(
                caseNumbers: country.totalConfirmed!,
                caseType: 'TOTAL CASES',
              ),
              CasesCountWidget(
                caseNumbers: country.totalDeaths!,
                caseType: 'TOTAL DEATH',
              ),
              CasesCountWidget(
                caseNumbers: country.newConfirmed!,
                caseType: 'NEW CASES',
              ),
              CasesCountWidget(
                caseNumbers: country.newDeaths!,
                caseType: 'NEW DEATH',
              ),
              CasesCountWidget(
                caseNumbers: country.newRecovered!,
                caseType: 'NEW RECOVERED',
              ),
              CasesCountWidget(
                caseNumbers: country.totalRecovered!,
                caseType: 'TOTAL RECOVERED',
              ),
            ],
          )
        ],
      ),
    );
  }
}
