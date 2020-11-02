import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pie_chart/pie_chart.dart';


class Data {
  double d1;
  double d2;
  double d3;
  double d4;

  Data({this.d1,this.d2,this.d3,this.d4});
}

class Datam {
  double m1;
  double m2;
  double m3;
  double m4;
  double m5;
  double m6;
  double m7;
  double m8;
  double m10;
  double m9;
  double m11;


  Datam({this.m1,this.m2,this.m3,this.m4,this.m5,this.m6,this.m7,this.m8,this.m9,this.m10,this.m11});
}

class Datan {
  double n1;
  double n2;
  double n3;
  double n4;
  double n5;
  double n6;
  double n7;
  double n8;
  double n10;
  double n9;
  double n11;


  Datan({this.n1,this.n2,this.n3,this.n4,this.n5,this.n6,this.n7,this.n8,this.n9,this.n10,this.n11});
}



class Datax {
  double x1;
  double x2;
  double x3;
  double x4;
  double x5;
  double x6;
  double x7;
  double x8;
  double x10;
  double x9;
  double x11;


  Datax({this.x1,this.x2,this.x3,this.x4,this.x5,this.x6,this.x7,this.x8,this.x9,this.x10,this.x11});
}






class budgetmain2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return budgetmain2state();
  }
}

///Crafting the UI
class budgetmain2state extends State<budgetmain2> {
  final _formKey = GlobalKey<FormState>();
  final _padding = EdgeInsets.all(18.0);

  var selectedItem = ' ';
  var netincome = TextEditingController();
  var rentincome = TextEditingController();
  var interestincome= TextEditingController();
  var othersearnings = TextEditingController();
  var low_food = TextEditingController();
  var low_housing = TextEditingController();
  var low_transportation = TextEditingController();
  var low_utilities = TextEditingController();
  var low_clothing = TextEditingController();
  var low_gifts = TextEditingController();
  var low_health = TextEditingController();
  var low_personal = TextEditingController();
  var low_debt = TextEditingController();
  var low_reecreation = TextEditingController();
  var low_misc = TextEditingController();
  var high_food = TextEditingController();
  var high_housing = TextEditingController();
  var high_transportation = TextEditingController();
  var high_utilities = TextEditingController();
  var high_clothing = TextEditingController();
  var high_gifts = TextEditingController();
  var high_health = TextEditingController();
  var high_personal = TextEditingController();
  var high_debt = TextEditingController();
  var high_reecreation = TextEditingController();
  var high_misc = TextEditingController();
  var displayResullt = '';
  final data1 = Data(
      d1: 0,
      d2: 0,
      d3: 0,
      d4: 0
  );

  final datam1 = Datam(
      m1: 0,
      m2: 0,
      m3: 0,
      m4: 0,
      m5: 0,
      m6: 0,
      m7: 0,
      m8: 0,
      m9: 0,
      m10: 0,
      m11: 0
  );

  final datax1 = Datax(
      x1: 0,
      x2: 0,
      x3: 0,
      x4: 0,
      x5: 0,
      x6: 0,
      x7: 0,
      x8: 0,
      x9: 0,
      x10: 0,
      x11: 0
  );



  final datan1 = Datan(
      n1: 0,
      n2: 0,
      n3: 0,
      n4: 0,
      n5: 0,
      n6: 0,
      n7: 0,
      n8: 0,
      n9: 0,
      n10: 0,
      n11: 0
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
          'Budget Calculator',

        ),

      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: 35.0,
            ),
            Text('Enter Earning Details ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black.withOpacity(0.9), height: 5, fontSize: 22)
            ),

            getAmountField(
              'Enter in Amount',
              'Net Income',
              Icons.attach_money,
              netincome,
              _padding,
            ),
            getAmountField(
              'Enter in Amount',
              'Rent Income',
              Icons.attach_money,
              rentincome,
              _padding,
            ),
            getAmountField(
              'Enter in Amount',
              'Interest Income',
              Icons.attach_money,
              interestincome,
              _padding,
            ),
            getAmountField(
              'Enter in Amount',
              'Other Earnings',
              Icons.attach_money,
              othersearnings,
              _padding,
            ),
            Text('Enter Expenditure Details ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black.withOpacity(0.9), height: 5, fontSize: 22)
            ),

            Text('FOOD: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),


            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_food,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_food,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            Text('HOUSING: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),
            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_housing,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_housing,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            Text('TRANSPORT: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),

            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_transportation,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_transportation,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Text('UTILITIES: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),
            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_utilities,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_utilities,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),


            Text('CLOTHINGS: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),


            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_clothing,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_clothing,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            Text('GIFTS: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),


            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_gifts,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_gifts,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            Text('MEDICAL: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),
            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_health,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_health,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            Text('PERSONAL: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),
            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_personal,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_personal,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            Text('DEBT: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),
            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_debt,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_debt,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            Text('RECREATION: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),
            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_reecreation,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_reecreation,
                        EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Text('MISCELLENEOUS: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.brown.withOpacity(0.9), height:3 , fontSize: 18)
            ),
            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(L)',
                        Icons.attach_money,
                        low_misc,
                        EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child:  getAmountField(
                        'Enter in %',
                        'Range(H)',
                        Icons.attach_money,
                        high_misc,
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
                  getCalcButton('Calculate Total Income', Colors.orangeAccent, calculate),
                  Container(
                    width: 10.0,
                  ),
                  getCalcButton('Categorywise Expenditure', Colors.orangeAccent, calculate2),

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
              label: "Income Category Pie",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(data1:data1)),
                );
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.pie_chart),
              label: "LOW END Expenses Ranges",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage3(datan1:datan1)),
                )
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.pie_chart),
              label: "HIGH END Expenses Ranges",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage2(datam1:datam1)),
                )
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.pie_chart),
              label: "Variation in Expenses",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage4(datax1:datax1)),
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


  /// Button Calculate Method
  String calculate() {
    var nincome = double.parse(netincome.text);
    var rincome = double.parse(rentincome.text);
    var iincome = double.parse(interestincome.text);
    var otherearnings = double.parse(othersearnings.text);
    var totalincome = (nincome+rincome+iincome+otherearnings);
    var res ='Tortal Earning : $totalincome';
    data1.d1 = nincome;
    data1.d2 = rincome;
    data1.d3 = iincome;
    data1.d4 = otherearnings;
    return res;



  }
  String calculate2() {
    var nincome = double.parse(netincome.text);
    var rincome = double.parse(rentincome.text);
    var iincome = double.parse(interestincome.text);
    var otherearnings = double.parse(othersearnings.text);
    var totalincome = (nincome+rincome+iincome+otherearnings);


    var foodhigh = double.parse(high_food.text);
    var housinghigh = double.parse(high_housing.text);
    var transportationhigh = double.parse(high_transportation.text);
    var utilitieshigh = double.parse(high_utilities.text);
    var clothingshigh = double.parse(high_clothing.text);
    var giftshigh = double.parse(high_gifts.text);
    var healthhigh = double.parse(high_health.text);
    var personalhigh = double.parse(high_personal.text);
    var debthigh = double.parse(high_debt.text);
    var recreationhigh = double.parse(high_reecreation.text);
    var mischigh = double.parse(high_misc.text);


    var foodlow = double.parse(low_food.text);
    var housinglow = double.parse(low_housing.text);
    var transportationlow = double.parse(low_transportation.text);
    var utilitieslow = double.parse(low_utilities.text);
    var clothingslow = double.parse(low_clothing.text);
    var giftslow = double.parse(low_gifts.text);
    var healthlow = double.parse(low_health.text);
    var personallow = double.parse(low_personal.text);
    var debtlow = double.parse(low_debt.text);
    var recreationlow = double.parse(low_reecreation.text);
    var misclow = double.parse(low_misc.text);


    var foodle = (totalincome*foodlow)/100;
    var housingle = (totalincome*housinglow)/100;
    var transportationle = (totalincome*transportationlow)/100;
    var utilitiesle = (totalincome*utilitieslow)/100;
    var clothingle = (totalincome*clothingslow)/100;
    var giftsle = (totalincome*giftslow)/100;
    var personalle = (totalincome*personallow)/100;
    var debtle = (totalincome*debtlow)/100;
    var recreationle = (totalincome*recreationlow)/100;
    var miscle = (totalincome*misclow)/100;
    var healthle = (totalincome*healthlow)/100;


    var foodhe = (totalincome*foodhigh)/100;
    var housinghe = (totalincome*housinghigh)/100;
    var transportationhe = (totalincome*transportationhigh)/100;
    var utilitieshe = (totalincome*utilitieshigh)/100;
    var clothinghe = (totalincome*clothingshigh)/100;
    var giftshe = (totalincome*giftshigh)/100;
    var personalhe = (totalincome*personalhigh)/100;
    var debthe = (totalincome*debthigh)/100;
    var recreationhe = (totalincome*recreationhigh)/100;
    var mische = (totalincome*mischigh)/100;
    var healthhe = (totalincome*healthhigh)/100;

    datam1.m1 =  foodhe;
    datam1.m2 = housinghe;
    datam1.m3 = transportationhe;
    datam1.m4 = utilitieshe;

    datam1.m5 = clothinghe;
    datam1.m6 = giftshe ;
    datam1.m7 = personalhe;
    datam1.m8 = debthe;

    datam1.m9 = recreationhe;
    datam1.m10 = mische;
    datam1.m11 = healthhe;


    datan1.n1 =  foodle;
    datan1.n2 = housingle;
    datan1.n3 = transportationle;
    datan1.n4 = utilitiesle;

    datan1.n5 = clothingle;
    datan1.n6 = giftsle ;
    datan1.n7 = personalle;
    datan1.n8 = debtle;

    datan1.n9 = recreationle;
    datan1.n10 = miscle;
    datan1.n11 = healthle;




    datax1.x1 =  (foodhe - foodle);
    datax1.x2 = (housinghe - housingle);
    datax1.x3 = (transportationhe - transportationle);
    datax1.x4 = (utilitieshe -utilitiesle);

    datax1.x5 = (clothinghe - clothingle);
    datax1.x6 = (giftshe - giftsle) ;
    datax1.x7 = (personalhe - personalle);
    datax1.x8 = (debthe - debtle);

    datax1.x9 = (recreationhe - recreationle);
    datax1.x10 = (mische - miscle);
    datax1.x11 = (healthhe -healthle);

    var res2 = "Category     Low End     High End \n Food              $foodle            $foodhe \n Housing        $housingle            $housinghe \n Transport     $transportationle          $transportationhe  \n Utilities      $utilitiesle            $utilitieshe \n Clothings    $clothingle            $clothinghe  \n Gifts            $giftsle            $giftshe \nHealth      $healthle    $healthhe Personal    $personalle            $personalhe  \n Debt           $debtle            $debthe  \n Recr          $recreationle             $recreationhe  \n Misc        $miscle             $mische";
    return res2;






  }


  ///Button Reset Method
  String reset() {
    netincome.text = '';
    rentincome.text = '';
    interestincome.text = '';
    othersearnings.text = '';
    low_food.text = '';
    low_housing.text = '';
    low_transportation.text = '';
    low_utilities.text = '';
    low_clothing.text = '';
    low_gifts.text = '';
    low_health.text = '';
    low_personal.text = '';
    low_debt.text = '';
    low_reecreation.text = '';
    low_misc.text = '';
    high_food.text = '';
    high_housing.text = '';
    high_transportation.text = '';
    high_utilities.text = '';
    high_clothing.text = '';
    high_gifts.text = '';
    high_health.text = '';
    high_personal.text = '';
    high_debt.text = '';
    high_reecreation.text = '';
    high_misc.text = '';
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
      'Net Income': data1.d1,
      'Rent Income': data1.d2,
      'Interest Income': data1.d3,
      'Other Earnings': data1.d4
    });
    super.initState();
  }

  List<Color> _colors = [

    Colors.orange,
    Colors.blueAccent,
    Colors.lightGreen,
    Colors.brown,

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income Pie'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Total Income Breakdown',
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
              child: Text('Click Here for Pie Chart Representation', style: TextStyle(color: Colors.white, fontSize: 15,
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





class MyHomePage2 extends StatefulWidget {
  final Datam datam1;

  MyHomePage2({this.datam1});

  @override
  _MyHomePage2State createState() => _MyHomePage2State(this.datam1);
}

class _MyHomePage2State extends State<MyHomePage2> {
  Map<String, double> data = new Map();
  bool _loadChart = false;
  Datam datam1;
  @override
  _MyHomePage2State(this.datam1);
  void initState() {
    data.addAll({
      'Food': datam1.m1,
      'Housing': datam1.m2,
      'Transportation': datam1.m3,
      'Utilities': datam1.m4,
      'Clothings': datam1.m5,
      'Gifts': datam1.m6,
      'Medical': datam1.m11,
      'Personal': datam1.m7,
      'Debt': datam1.m8,
      'Recreation': datam1.m9,
      'Miscelleneous': datam1.m10,
    });
    super.initState();
  }

  List<Color> _colors = [

    Colors.orange,
    Colors.blueAccent,
    Colors.lightGreen,
    Colors.brown,
    Colors.red,
    Colors.pinkAccent,
    Colors.grey,
    Colors.black54,
    Colors.deepPurple,
    Colors.blueGrey



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income Pie'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Expense Categories at HIGH END',
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
              child: Text('Click Here for Pie Chart Representation', style: TextStyle(color: Colors.white, fontSize: 15,
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







class MyHomePage3 extends StatefulWidget {
  final Datan datan1;

  MyHomePage3({this.datan1});

  @override
  _MyHomePage3State createState() => _MyHomePage3State(this.datan1);
}

class _MyHomePage3State extends State<MyHomePage3> {
  Map<String, double> data = new Map();
  bool _loadChart = false;
  Datan datan1;
  @override
  _MyHomePage3State(this.datan1);
  void initState() {
    data.addAll({
      'Food': datan1.n1,
      'Housing': datan1.n2,
      'Transportation': datan1.n3,
      'Utilities': datan1.n4,
      'Clothings': datan1.n5,
      'Gifts': datan1.n6,
      'Medical': datan1.n11,
      'Personal': datan1.n7,
      'Debt': datan1.n8,
      'Recreation': datan1.n9,
      'Miscelleneous': datan1.n10,
    });
    super.initState();
  }

  List<Color> _colors = [

    Colors.orange,
    Colors.blueAccent,
    Colors.lightGreen,
    Colors.brown,
    Colors.red,
    Colors.pinkAccent,
    Colors.grey,
    Colors.black54,
    Colors.deepPurple,
    Colors.blueGrey



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Pie'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Expense Categories at LOW END',
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
              child: Text('Click Here for Pie Chart Representation', style: TextStyle(color: Colors.white, fontSize: 15,
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





class MyHomePage4 extends StatefulWidget {
  final Datax datax1;

  MyHomePage4({this.datax1});

  @override
  _MyHomePage4State createState() => _MyHomePage4State(this.datax1);
}

class _MyHomePage4State extends State<MyHomePage4> {
  Map<String, double> data = new Map();
  bool _loadChart = false;
  Datax datax1;
  @override
  _MyHomePage4State(this.datax1);
  void initState() {
    data.addAll({
      'Food': datax1.x1,
      'Housing': datax1.x2,
      'Transportation': datax1.x3,
      'Utilities': datax1.x4,
      'Clothings': datax1.x5,
      'Gifts': datax1.x6,
      'Medical': datax1.x11,
      'Personal': datax1.x7,
      'Debt': datax1.x8,
      'Recreation': datax1.x9,
      'Miscelleneous': datax1.x10,
    });
    super.initState();
  }

  List<Color> _colors = [

    Colors.orange,
    Colors.blueAccent,
    Colors.lightGreen,
    Colors.brown,
    Colors.red,
    Colors.pinkAccent,
    Colors.grey,
    Colors.black54,
    Colors.deepPurple,
    Colors.blueGrey



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Pie'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Variation of Ranges according to Expense Categories',
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
              child: Text('Click Here for Pie Chart Representation', style: TextStyle(color: Colors.white, fontSize: 15,
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
