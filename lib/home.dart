
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'annuitymain.dart';
import 'budget_main.dart';
import 'cic_main.dart';

import 'lease_main.dart';
import 'loan_main.dart';
import 'sic_main.dart';


class FinalHomePage2 extends StatelessWidget {

  static final descTextStyle = TextStyle(
    color: Colors.brown,
    fontFamily: 'Roboto',
    letterSpacing: 0.7,
    fontSize: 16,
    height: 2,
  );

  final iconSet3 = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container()
  );

  final iconSet4 = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container()
  );

  void push1()
  {

  }

  /* void _resetCounter() {
    setState((){
      _counter=0;
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apni Bachat'),
        centerTitle: true,

      ),

      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultTextStyle.merge(
                style: descTextStyle,
                child:  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.calculate,
                              color: Colors.lightBlue,
                              semanticLabel: "Leasing",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => leasemain()))
                            },
                          ),
                          Text('Leasing'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.calculate,
                              color: Colors.lightBlue,
                              semanticLabel: "Annuity",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => annuitymain()))
                            },
                          ),
                          Text('Annuity')
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DefaultTextStyle.merge(
                style: descTextStyle,
                child:  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.calculate,
                              color: Colors.lightBlue,
                              semanticLabel: "Compund Interest",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => cicmmain()))
                            },
                          ),
                          Text('Compound Interest')
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.calculate,
                              color: Colors.lightBlue,
                              semanticLabel: "Simple Interest",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => sicmain()))
                            },
                          ),
                          Text('Simple Interest')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DefaultTextStyle.merge(
                style: descTextStyle,
                child:  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.calculate,
                              color: Colors.lightBlue,
                              semanticLabel: "Loan",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => loanmain()))
                            },
                          ),
                          Text('Loan')
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.calculate,
                              color: Colors.lightBlue,
                              semanticLabel: "Budgeting",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => budgetmain()))
                            },
                          ),
                          Text('Budgeting')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /*drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  )
              ),
              ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> SettingsWidget()),
                    );
                  }
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: ()=> {
                   SystemChannels.platform.invokeMethod('SystemNavigator.pop')
                },
              )
            ],
          ),
        ),*/// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}