
import 'package:flutter/material.dart';




import 'lc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'lc_loanamount.dart';
import 'lc_tenure.dart';
import 'jk.dart';


class loanmain extends StatefulWidget {

  @override
  _loanmainState createState() => _loanmainState();
}
class _loanmainState extends State<loanmain>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Loan"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '   ~EMI calculator helps to show the monthly installment amount that is needed to be paid to repay the entire borrowed loan ',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),
            new Text(
              '\n   ~Loan Amount calculator helps people to borrow amount based on their convenince of remaying amount on monthly installments (Loan Affordibility)',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),
            new Text(
              '\n   ~Loan Tenure calculator helps to estimate the time period that is required to repay refinanced loan',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),
            new Text(
              '\n   ~Deffered paymrnt relates to repay the loan amount at a certain period of time (in maturity time or after specified period). In this case End balance added up with interest monthly.So more amount neeeded to be paid at the end ',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),

          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.list_view,
        children: [
          SpeedDialChild(
              child: Icon(Icons.attach_money),
              label: "Equated Monthly Installment",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => calcii()),
                );
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.attach_money),
              label: "Loan Amount",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => calciii()),
                )
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.attach_money),
              label: "Loan Tenure",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => calciiii()),
                )
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.attach_money),
              label: "Deffered Loan Payment",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => calciiui()),
                )
              }
          ),

        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}