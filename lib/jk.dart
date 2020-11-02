import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class Data {
  double d1;
  double d2;
  double d3;

  Data({this.d1,this.d2,this.d3});
}

class Datau {
  double f1;
  double f2;


  Datau({this.f1,this.f2});
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
  double e11;
  double e12;

  Datac({this.e1,this.e2,this.e3,this.e4,this.e5,this.e6,this.e7,this.e8,this.e9,this.e10,this.e11,this.e12});
}

class calciiui extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return calciiuistate();
  }
}

///Crafting the UI
class calciiuistate extends State<calciiui> {
  final _formKey = GlobalKey<FormState>();
  final _padding = EdgeInsets.all(18.0);

  var selectedItem = ' ';
  var principalController = TextEditingController();
  var interestController = TextEditingController();



  var displayResullt = '';
  List<String> displ=[];
  final data1 = Data(
      d1: 0,
      d2: 0,
      d3: 0
  );

  final datau1 = Datau(
      f1:0,
      f2:0

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
      e11:0,
      e12:0
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
          'Deffered Payment Calculator',
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
                  getCalcButton('Reset Values', Colors.lightGreen, reset),
                  Container(
                    width: 10.0,
                  ),
                  getCalcButton('Amortized Loan(1 yr)', Colors.orangeAccent, calculate),
                  Container(
                    width: 10.0,
                  ),
                  getCalcButton('Deferred Loan(1 yr)', Colors.orangeAccent, calculate2),
                  Container(
                    width: 10.0,
                  ),
                  getCalcButton('Excess payment in Deffered', Colors.orangeAccent, calculate3),
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
              label: "Pie chart(Amortized)",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(data1:data1)),
                );
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.insert_chart),
              label: "Bar Chart",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePag(datac1:datac1)),
                )
              }
          ),

          SpeedDialChild(
              child: Icon(Icons.insert_chart),
              label: "Pie Chart(Deffered)",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePageo(datau1:datau1)),
                )
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



    var month =12;

    var interest_modified= (interest/12)/100;
    var hi=pow((1+interest_modified),month);
    var hi2 = (hi-1);
    var hi3=(hi/hi2);
    var totalAmmount= (principal*interest_modified)*hi3;
    var amount = double.parse((totalAmmount).toStringAsFixed(2));
    var tpwfc= (amount*month);
    var tp= (tpwfc);
    var tip=(tpwfc-principal);
    var tip2 = double.parse((tip).toStringAsFixed(2));
    var tpwfc2 = double.parse((tp).toStringAsFixed(2));
    var result = '  Loan EMI: $amount \n Total Interest Payable: $tip2 \n Total Payment at the end of 1 yr: $tpwfc2 ';





    data1.d1 = principal;
    data1.d2 = tip2;



    return result;


  }
  String calculate2() {
    var principal = double.parse(principalController.text);
    var interest = double.parse(interestController.text);


    var interest_modified= (interest/12)/100;
    var beg=principal;

    var i =double.parse((beg*interest_modified).toStringAsFixed(2));
    var end=double.parse((beg + i).toStringAsFixed(2));

    var i2 =double.parse((end*interest_modified).toStringAsFixed(2));
    var end2 =double.parse((end+i2).toStringAsFixed(2));

    var i3 =double.parse((end2*interest_modified).toStringAsFixed(2));
    var end3=double.parse((end2 + i3).toStringAsFixed(2));

    var i4 =double.parse((end3*interest_modified).toStringAsFixed(2));
    var end4 =double.parse((end3+i4).toStringAsFixed(2));

    var i5 =double.parse((end4*interest_modified).toStringAsFixed(2));
    var end5 =double.parse((end4+i5).toStringAsFixed(2));

    var i6 =double.parse((end5*interest_modified).toStringAsFixed(2));
    var end6=double.parse((end5 + i6).toStringAsFixed(2));

    var i7 =double.parse((end6*interest_modified).toStringAsFixed(2));
    var end7 =double.parse((end6+i7).toStringAsFixed(2));


    var i8 =double.parse((end7*interest_modified).toStringAsFixed(2));
    var end8 =double.parse((end7+i8).toStringAsFixed(2));

    var i9 =double.parse((end8*interest_modified).toStringAsFixed(2));
    var end9=double.parse((end8+i9).toStringAsFixed(2));

    var i10 =double.parse((end9*interest_modified).toStringAsFixed(2));
    var end10 =double.parse((end9+i10).toStringAsFixed(2));

    var i11 =double.parse((end10*interest_modified).toStringAsFixed(2));
    var end11 =double.parse((end10+i11).toStringAsFixed(2));

    var i12 =double.parse((end11*interest_modified).toStringAsFixed(2));
    var end12=double.parse((end11 +i12).toStringAsFixed(2));

    datau1.f1 = principal;
    datau1.f2 = (end12-principal);

    List<String> ab=['           Interest        End Balance\nM1 -     $i              $end','M2 -     $i2            $end2','M3 -     $i3            $end3','M4 -     $i4            $end4','M5 -     $i5            $end5','M6 -     $i6            $end6','M7 -     $i7            $end7','M8 -     $i8            $end8','M9 -     $i9            $end9','M10 -     $i10            $end10','M11 -     $i11            $end11','M12 -     $i12            $end12'];
    var strprincipal = ab.join("\n");
    datac1.e1 = end;
    datac1.e2 = end2;
    datac1.e3 = end3;
    datac1.e4 = end4;
    datac1.e5 = end5;
    datac1.e6 = end6;
    datac1.e7 = end7;
    datac1.e8 = end8;
    datac1.e9 = end9;
    datac1.e10 = end10;
    datac1.e11 = end11;
    datac1.e12 = end12;
    return strprincipal;

  }
  String calculate3()
  {
    var principal = double.parse(principalController.text);
    var interest = double.parse(interestController.text);



    var month =12;

    var interest_modified= (interest/12)/100;
    var hi=pow((1+interest_modified),month);
    var hi2 = (hi-1);
    var hi3=(hi/hi2);
    var totalAmmount= (principal*interest_modified)*hi3;
    var amount = double.parse((totalAmmount).toStringAsFixed(2));
    var tpwfc= (amount*month);
    var tp= (tpwfc);
    var tip=(tpwfc-principal);
    var tip2 = double.parse((tip).toStringAsFixed(2));
    var tpwfc2 = double.parse((tp).toStringAsFixed(2));

    var beg=principal;

    var i =double.parse((beg*interest_modified).toStringAsFixed(2));
    var end=double.parse((beg + i).toStringAsFixed(2));

    var i2 =double.parse((end*interest_modified).toStringAsFixed(2));
    var end2 =double.parse((end+i2).toStringAsFixed(2));

    var i3 =double.parse((end2*interest_modified).toStringAsFixed(2));
    var end3=double.parse((end2 + i3).toStringAsFixed(2));

    var i4 =double.parse((end3*interest_modified).toStringAsFixed(2));
    var end4 =double.parse((end3+i4).toStringAsFixed(2));

    var i5 =double.parse((end4*interest_modified).toStringAsFixed(2));
    var end5 =double.parse((end4+i5).toStringAsFixed(2));

    var i6 =double.parse((end5*interest_modified).toStringAsFixed(2));
    var end6=double.parse((end5 + i6).toStringAsFixed(2));

    var i7 =double.parse((end6*interest_modified).toStringAsFixed(2));
    var end7 =double.parse((end6+i7).toStringAsFixed(2));


    var i8 =double.parse((end7*interest_modified).toStringAsFixed(2));
    var end8 =double.parse((end7+i8).toStringAsFixed(2));

    var i9 =double.parse((end8*interest_modified).toStringAsFixed(2));
    var end9=double.parse((end8+i9).toStringAsFixed(2));

    var i10 =double.parse((end9*interest_modified).toStringAsFixed(2));
    var end10 =double.parse((end9+i10).toStringAsFixed(2));

    var i11 =double.parse((end10*interest_modified).toStringAsFixed(2));
    var end11 =double.parse((end10+i11).toStringAsFixed(2));

    var i12 =double.parse((end11*interest_modified).toStringAsFixed(2));
    var end12=double.parse((end11 +i12).toStringAsFixed(2));

    var finalr = double.parse((end12-tpwfc2).toStringAsFixed(2));

    var gfty = ' Deffered Exceeds Amortized by : $finalr';

    return gfty;

  }


  ///Button Reset Method
  String reset() {
    principalController.text = '';
    interestController.text = '';

    displayResullt = '';


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
      'Principal ': data1.d1,
      'Extra Amount To Be Paid over Principal': data1.d2,

    });
    super.initState();
  }


  List<Color> _colors = [
    Colors.lightGreen,
    Colors.orange,
    Colors.red

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Scheme'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Break Up of Total Payment',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,color:Colors.brown, fontWeight: FontWeight.w900),
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


class MyHomePageo extends StatefulWidget {
  final Datau datau1;

  MyHomePageo({this.datau1});

  @override
  _MyHomePageoState createState() => _MyHomePageoState(this.datau1);
}

class _MyHomePageoState extends State<MyHomePageo> {
  Map<String, double> data = new Map();
  bool _loadChart = false;
  Datau datau1;
  @override
  _MyHomePageoState(this.datau1);
  void initState() {
    data.addAll({
      'Principal ': datau1.f1,
      'Extra Amount To Be Paid over Principal': datau1.f2,

    });
    super.initState();
  }


  List<Color> _colors = [
    Colors.lightGreen,
    Colors.orange,

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Scheme'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Break Up of Total Payment',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,color:Colors.brown, fontWeight: FontWeight.w900),
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


class MyHomePag extends StatefulWidget {

  final Datac datac1;


  MyHomePag({this.datac1});

  @override
  _MyHomePagState createState() => _MyHomePagState(this.datac1);
}

class _MyHomePagState extends State<MyHomePag> {

  Datac datac1;


  _MyHomePagState(this.datac1);
  @override
  Widget build(BuildContext context) {

    var data=[
      bar("M1",datac1.e1.toInt()),
      bar("M2",datac1.e2.toInt()),
      bar("M3",datac1.e3.toInt()),
      bar("M4",datac1.e4.toInt()),
      bar("M5",datac1.e5.toInt()),
      bar("M6",datac1.e6.toInt()),
      bar("M7",datac1.e7.toInt()),
      bar("M8",datac1.e8.toInt()),
      bar("M9",datac1.e9.toInt()),
      bar("M10",datac1.e10.toInt()),





    ];

    var series=[
      charts.Series(
          domainFn: (bar sales,_)=>sales.hi1,
          measureFn: (bar sales,_)=>sales.hi2,

          id:'HII',
          data: data

      )


    ];
    var chart=charts.BarChart(
      series, animate: true,animationDuration:  Duration(milliseconds: 4000),


    );
    return Scaffold(

      appBar: AppBar(
        title: Text("Bar Representation"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea
        (child: Padding(
        padding: const EdgeInsets.all(12.0),

        child: Column(
          children: <Widget>[Text("Rate at which Ending Balance Moves throughout the Year",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800, color: Colors.brown)),
            SizedBox(height:600,child: chart),
          ],
        ),

      )


      ),

    );
  }
}

class bar {
  final String hi1;
  final int hi2;
  bar(this.hi1, this.hi2);
}
