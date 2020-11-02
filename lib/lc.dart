
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

class calcii extends StatefulWidget {
@override
State<StatefulWidget> createState() {
return calciistate();
}
}

///Crafting the UI
class calciistate extends State<calcii> {
final _formKey = GlobalKey<FormState>();
final _padding = EdgeInsets.all(18.0);

var selectedItem = ' ';
var principalController = TextEditingController();
var interestController = TextEditingController();
var periodController_s = TextEditingController();
var periodController_e = TextEditingController();
var periodController_sm = TextEditingController();
var periodController_em = TextEditingController();

var fcController = TextEditingController();
var displayResullt = '';
List<String> displ=[];
final data1 = Data(
d1: 0,
d2: 0,
d3: 0
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
'EMI Calculator',
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
getAmountField(
'Enter in Amount ',
'Fees & Charges',
Icons.payment,
fcController,
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
getCalcButton('Calculate EMI', Colors.orangeAccent, calculate),
Container(
width: 10.0,
),
getCalcButton('Ending Bal(1 yr Report)', Colors.orangeAccent, calculate2),
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
var fc = double.parse(fcController.text);

var interest_modified= (interest/12)/100;
var periody = (period_e-period_s);
var periodm = (period_em-period_sm);
var periody2= (periody*12);
var netperiodm = (periody2+(periodm)).toInt();
var netperiody = netperiodm/12;
var finalperiod = double.parse((netperiody).toStringAsFixed(2));
var hi=pow((1+interest_modified), netperiodm);
var hi2 = (hi-1);
var hi3=(hi/hi2);
var totalAmmount= (principal*interest_modified)*hi3;
var amount = double.parse((totalAmmount).toStringAsFixed(2));
var tpwfc= (amount*netperiodm);
var tp= (tpwfc+fc);
var tip=(tpwfc-principal);
var tip2 = double.parse((tip).toStringAsFixed(2));
var tpwfc2 = double.parse((tp).toStringAsFixed(2));
var result = '  Loan EMI: $amount \n Total Interest Payable: $tip2 \n Total Payment: $tpwfc2 ';
var gy = '$totalAmmount';
data1.d1 = principal;
data1.d3= fc;
data1.d2 = tip;
return result;


}
String calculate2() {
var principal = double.parse(principalController.text);
var interest = double.parse(interestController.text);
var period_s = double.parse(periodController_s.text);
var period_e = double.parse(periodController_e.text);
var period_sm = double.parse(periodController_sm.text);
var period_em = double.parse(periodController_em.text);
var fc = double.parse(fcController.text);

var interest_modified= (interest/12)/100;
var periody = (period_e-period_s);
var periodm = (period_em-period_sm);
var periody2= (periody*12);
var netperiodm = (periody2+(periodm)).toInt();
var netperiody = netperiodm/12;
var finalperiod = double.parse((netperiody).toStringAsFixed(2));
var hi=pow((1+interest_modified), netperiodm);
var hi2 = (hi-1);
var hi3=(hi/hi2);
var totalAmmount= (principal*interest_modified)*hi3;
var amount = double.parse((totalAmmount).toStringAsFixed(2));
var tpwfc= (amount*netperiodm);
var tp= (tpwfc+fc);
var tip=(tp-principal);
var tip2 = double.parse((tip).toStringAsFixed(2));
var tpwfc2 = double.parse((tpwfc).toStringAsFixed(2));
var beg=principal;

var i =double.parse((beg*interest_modified).toStringAsFixed(2));
var p=(amount-i);
var end=double.parse((beg - p).toStringAsFixed(2));

var i2 =double.parse((end*interest_modified).toStringAsFixed(2));
var p2=(amount-i2);
var end2 =double.parse((end-p2).toStringAsFixed(2));

var i3 =double.parse((end2*interest_modified).toStringAsFixed(2));
var p3=(amount-i2);
var end3=double.parse((end2 - p2).toStringAsFixed(2));

var i4 =double.parse((end3*interest_modified).toStringAsFixed(2));
var p4=(amount-i3);
var end4 =double.parse((end3-p3).toStringAsFixed(2));

var i5 =double.parse((end4*interest_modified).toStringAsFixed(2));
var p5=(amount-i4);
var end5 =double.parse((end4-p4).toStringAsFixed(2));

var i6 =double.parse((end5*interest_modified).toStringAsFixed(2));
var p6=(amount-i5);
var end6=double.parse((end5 - p5).toStringAsFixed(2));

var i7 =double.parse((end6*interest_modified).toStringAsFixed(2));
var p7=(amount-i6);
var end7 =double.parse((end6-p6).toStringAsFixed(2));


var i8 =double.parse((end7*interest_modified).toStringAsFixed(2));
var p8=(amount-i7);
var end8 =double.parse((end7-p7).toStringAsFixed(2));

var i9 =double.parse((end8*interest_modified).toStringAsFixed(2));
var p9=(amount-i8);
var end9=double.parse((end8 - p8).toStringAsFixed(2));

var i10 =double.parse((end9*interest_modified).toStringAsFixed(2));
var p10=(amount-i9);
var end10 =double.parse((end9-p9).toStringAsFixed(2));

var i11 =double.parse((end10*interest_modified).toStringAsFixed(2));
var p11=(amount-i10);
var end11 =double.parse((end10-p10).toStringAsFixed(2));

var i12 =double.parse((end11*interest_modified).toStringAsFixed(2));
var p12=(amount-i11);
var end12=double.parse((end11 - p11).toStringAsFixed(2));

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
'Principal ': data1.d1,
'Interest Payable': data1.d2,
'Fees & Charges': data1.d3
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