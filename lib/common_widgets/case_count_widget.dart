import 'package:flutter/material.dart';

class CasesCountWidget extends StatelessWidget {

 final String caseType;
 final int caseNumbers;


  const CasesCountWidget({Key? key, required this.caseType,required this.caseNumbers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width* .40,
      height: 60,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caseType,
            style:const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 10,
              color:  Color(0xff424242),
              letterSpacing: 0.7000000000000001,
              fontWeight: FontWeight.w500,
            ),
            softWrap: false,
          ),
          const SizedBox(height: 5,),
          Text(
            caseNumbers.toString(),
            style:const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color:  Color(0xff424242),
            ),
            softWrap: false,
          )

    ],),);
  }
}
