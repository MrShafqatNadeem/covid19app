import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final String countryName;
 final int casesCount;
 final Function ontap;

  const CountryTile(
      {Key? key, required this.countryName,
      required this.casesCount,
      required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ontap();
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    countryName,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color:   Color(0xff424242),
                    ),
                    softWrap: false,
                  )),

                  Text(
                    '$casesCount',
                    style:const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Color(0xff424242),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                    softWrap: false,
                  )
                ],
              ),
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.black,
        )
      ],
    );
  }
}
