import 'package:flutter/material.dart';

import 'budget.dart';


class budgetmain extends StatefulWidget {

  @override
  _budgetmainState createState() => _budgetmainState();
}
class _budgetmainState extends State<budgetmain>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Budgeting"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '   ~Budgeting is done based upon income sources and expense categories',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),
            new Text(
              '\n   ~Probabale Expense Range (in %) needed to be entered by the use as per the specified Categories',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),
            new Text(
              '\n   ~4 type of Pie Charts Included(Imcome, Expense(LOW), Expense(HIGH), Expense(DEVIATION)',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton
        (
        onPressed: () =>
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>budgetmain2 ()))
        },
        child: Icon(Icons.add_box),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
