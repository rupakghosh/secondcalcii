import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class Data {
  double d1;
  double d2;

  Data({this.d1,this.d2});
}
class Datac {
  double e1;
  double e2;
  double e3;
  double e4;
  double e5;
  double e6;
  double e7;
  double e8;
  double e9;
  double e10;

  Datac({this.e1,this.e2,this.e3,this.e4,this.e5,this.e6,this.e7,this.e8,this.e9,this.e10});
}

class calcii2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return calcii2state();
  }
}

///Crafting the UI
class calcii2state extends State<calcii2> {
  final _formKey = GlobalKey<FormState>();
  final _padding = EdgeInsets.all(18.0);

  var selectedItem = ' ';
  var principalController = TextEditingController();
  var interestController = TextEditingController();
  var periodController_s = TextEditingController();
  var periodController_e = TextEditingController();
  var periodController_sm = TextEditingController();
  var periodController_em = TextEditingController();

  var compoundtimeController = TextEditingController();
  var displayResullt = '';
  List<String> displ=[];
  final data1 = Data(
    d1: 0,
    d2: 0,
  );
  final datac1 = Datac(
    e1: 0,
    e2: 0,
    e3: 0,
    e4: 0,
    e5: 0,
    e6: 0,
    e7: 0,
    e8: 0,
    e9: 0,
    e10:0,
  );



  @override
  void initState()
  {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple Interest Calculator',
        ),

      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: 35.0,
            ),
            Text('Enter Required Details: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black.withOpacity(0.7), height: 2, fontSize: 18)
            ),

            getAmountField(
              'Enter Principal Amount',
              'Principals (P)',
              Icons.attach_money,
              principalController,
              _padding,
            ),
            getAmountField(
              'Enter in Percentage (%)',
              'Interest Rate (R)',
              Icons.payment,
              interestController,
              _padding,
            ),

            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: getAmountField(
                      'Enter yrs',
                      'Year_Initial',
                      Icons.access_time,
                      periodController_s,
                      EdgeInsets.all(0),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child:  getAmountField(
                        'Enter month',
                        'Month_Initial',
                        Icons.access_time,
                        periodController_sm,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),

                ],
              ),

            )
            ,


            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: getAmountField(
                      'Enter yrs',
                      'Final_Year',
                      Icons.access_time,
                      periodController_e,
                      EdgeInsets.all(0),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child:  getAmountField(
                        'Enter month',
                        'Final_Month',
                        Icons.access_time,
                        periodController_em,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[
                  getCalcButton('Reset Values', Colors.lightGreen, reset),
                  Container(
                    width: 10.0,
                  ),
                  getCalcButton('Calculate SI', Colors.orangeAccent, calculate),
                  Container(
                    width: 10.0,
                  ),

                ],
              ),
            ),
            Padding(
              padding: _padding,
              child: Center(
                child: Text(
                  displayResullt,
                  style: TextStyle(fontWeight: FontWeight.w800, fontStyle: FontStyle.italic, color: Colors.brown.withOpacity(0.9), height: 2, fontSize: 18),
                ),
              ),
            ),
          ],
        ),

      ),


      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.list_view,
        children: [
          SpeedDialChild(
              child: Icon(Icons.pie_chart),
              label: "Pie chart",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(data1:data1)),
                );
              }
          ),

        ],
      ),
    );
  }

  /// Crafting the TextFormField
  Widget getAmountField(String hintText, String labelText, IconData iconOfField,
      TextEditingController textController, EdgeInsets wrapp)
  {
    return Container(
      child: Padding(
        padding: wrapp,
        child: TextFormField
          (
          validator: (String input) {
            if (input.isEmpty) return 'Invalid Entry!!!';

          },
          controller: textController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorStyle: TextStyle
              (
              color: Colors.red,
              fontSize: 12.0,
            ),
            prefixIcon: Icon(iconOfField),
            hintText: hintText,
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }

  ///Crafting the Button
  Widget getCalcButton(
      String buttonName, Color buttonColor, Function buttonFunc) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          buttonName,
        ),
        color: buttonColor,
        onPressed: () => setState
          (
              () {
            if (_formKey.currentState.validate())
              this.displayResullt = buttonFunc();
          },
        ),
      ),
    );
  }


  /// User Selection Method
  void selectMethod(String selectedItem) {
    setState(() => this.selectedItem = selectedItem);
  }

  /// Button Calculate Method
  String calculate() {
    var principal = double.parse(principalController.text);
    var interest = double.parse(interestController.text);
    var period_s = double.parse(periodController_s.text);
    var period_e = double.parse(periodController_e.text);
    var period_sm = double.parse(periodController_sm.text);
    var period_em = double.parse(periodController_em.text);

    var interest_modified= interest/100;
    var periody = (period_e-period_s);
    var periodm = (period_em-period_sm);
    var periody2= (periody*12);
    var netperiodm = periody2+(periodm);
    var netperiody = netperiodm/12;
    var finalperiod = double.parse((netperiody).toStringAsFixed(2));
    var totalAmmount = principal+(principal*interest_modified*finalperiod);
    var amount = double.parse((totalAmmount).toStringAsFixed(2));

    var result = 'Total Amount (with interest) for $principal $selectedItem after $finalperiod years at $interest% interest rate is :\t  $amount  ';

    data1.d1 = principal;
    data1.d2 = amount- principal;
    return result;


  }




  ///Button Reset Method
  String reset() {
    principalController.text = '';
    interestController.text = '';
    periodController_s.text = '';
    periodController_e.text = '';
    displayResullt = '';
    periodController_sm.text = '';
    periodController_em.text ='';

    return '';
  }
}

class MyHomePage extends StatefulWidget {
  final Data data1;

  MyHomePage({this.data1});

  @override
  _MyHomePageState createState() => _MyHomePageState(this.data1);
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, double> data = new Map();
  bool _loadChart = false;
  Data data1;
  @override
  _MyHomePageState(this.data1);
  void initState() {
    data.addAll({
      'Principal Amount(Initial Investement)': data1.d1,
      'Compound Interest on Investement': data1.d2,
    });
    super.initState();
  }


  List<Color> _colors = [
    Colors.redAccent,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interest v/s Principal'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Extra Amount over the Principal Amount',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,color:Colors.green, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 60,
            ),
            _loadChart ? PieChart(
              dataMap: data,
              colorList:_colors, // if not declared, random colors will be chosen
              animationDuration: Duration(milliseconds: 4000),
              chartLegendSpacing: 25.0,
              chartRadius: MediaQuery.of(context).size.width /0.7, //determines the size of the chart
              showChartValuesInPercentage: true,
              showChartValues: true,
              showLegends: true,
              legendPosition:LegendPosition.right, //can be changed to top, left, bottom
              decimalPlaces: 1,
              initialAngle: 90,
              chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.white, fontSize: 16
              ),
              chartType: ChartType.disc, //can be changed to ChartType.ring
            ) : SizedBox( height: 270,
            ),
            SizedBox(
              height: 115,
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text('Click Here for Pie Chart Representation', style: TextStyle(color: Colors.white, fontSize: 18,
              ),),
              onPressed: () {
                setState(() {
                  _loadChart = true;
                });
              },

            ),
          ],
        ),
      ),


    );
  }
}

