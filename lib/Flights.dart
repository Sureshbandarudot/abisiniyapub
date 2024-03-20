
import 'package:flutter/material.dart';
//import 'package:tourstravels/ApartVC/Add_Apartment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:tourstravels/Auth/Login.dart';
import 'dart:convert';
import 'package:tourstravels/ApartVC/Addaprtment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourstravels/UserDashboard_Screens/Apartbooking_Model.dart';
import 'package:tourstravels/UserDashboard_Screens/PivoteVC.dart';
import 'package:tourstravels/tabbar.dart';
import 'package:tourstravels/My_Apartments/My_AprtmetsVC.dart';
import 'package:tourstravels/Singleton/SingletonAbisiniya.dart';
import '../MyBookings/MybookingVC.dart';
import '../My_Apartments/MyVehicles/MyvehicleVC.dart';
import '../ServiceDasboardVC.dart';
//import 'Vehicle_PivoteVC.dart';
import 'ServiceDasboardVC.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  //String From = 'From';

  final baseDioSingleton = BaseSingleton();

  String fromDatestr = '';
  String toDatestr = '';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password_confirmation_Controller = TextEditingController();
  TextEditingController additionainfo_Controller = TextEditingController();
  TextEditingController FromdateInputController = TextEditingController();
  TextEditingController TodateInputController = TextEditingController();
  String? fromdropdownvalue;
  String? todropdownvalue;
  String? airlinedropdownvalue;
  String traveldropdownvalue = 'Economy';
  String tripdropdownvalue = 'One Way';


// List of items in our dropdown menu
  var travelitems = [
    'Select Travel Class',
    'Economy',
    'Business',
    'First Class',
  ];
  var tripitems = [
    'Select Trip',
    'One Way',
    'Return',
    'Multi City',
  ];

  void login(String name , String surname, String email, String phone, String password,String password_confirmation,
      String from, String to, String airline, String departure_date, String return_date, String trip_option, String message) async {
    print('email.');
    print(emailController.text);
    try{
      Response response = await post(
          Uri.parse(baseDioSingleton.AbisiniyaBaseurl + 'flight/userflight'),
          body: {
            'name': firstNameController.text,
            'surname': lastNameController.text,
            'email': emailController.text,
            'phone': phoneController.text,
            'password': passwordController.text,
            'password_confirmation': password_confirmation_Controller.text,
            'from': fromdropdownvalue,
            'to': todropdownvalue,
            'airline': airlinedropdownvalue,
            'departure_date': FromdateInputController.text,
            'return_date': TodateInputController.text,
            'travel_class': traveldropdownvalue,
            'trip_option': tripdropdownvalue,
            'message': additionainfo_Controller.text
            // 'name': 'Shanvith',
            // 'surname': 'Bandaru',
            // 'email': 'shanvithtwo@gmail.com',
            // 'phone': phoneController.toString(),
            // 'password': 'shanvith1234',
            // 'password_confirmation': 'shanvith1234',
            // 'from': 'Bengaluru',
            // 'to': 'Chennai',
            // 'airline': 'AirAsia',
            // 'departure_date': '2024-03-20',
            // 'return_date': '2024-03-22',
            // 'travel_class': 'First class',
            // 'trip_option': 'One Way',
            // 'message': 'Good journey'

          }

      );
      print('calling....');
      print(response.statusCode);
      print('status code...');
      print(response.statusCode);
      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        print('Flight fresh user data successfully posted');
        print(responseData);
        var data = jsonDecode(response.body.toString());
        if (data['message'] == 'Flight request successfully submitted.')
        {
          print('call...');
          final snackBar = SnackBar(
            content: Text(data['message']),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (data['message'] == 'Start date should be greater or equal to booking day'){
          print('call...1');

          print('Start date should be greater or equal to booking day.......');
          final snackBar = SnackBar(
            content: Text('Start date should be greater or equal to booking day'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else {
          print('call...3');

          final snackBar = SnackBar(
            content: Text('Start date should be greater or equal to booking day'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
      if (response.statusCode == 400) {
        print('already entered existing data1...');
        print('email...');
        var data = jsonDecode(response.body);
        print(data['message']['email']);
        print(data['message']['phone']);
        if ((data['message']['phone']) != null && (data['message']['email']) != null) {
          final snackBar = SnackBar(
            content: Text('The email and phone has already been taken.'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);        }
        else if ((data['message']['phone']) != null) {
          final snackBar = SnackBar(
            content: Text('The phone has already been taken.'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        } else if ((data['message']['email']) != null) {
          final snackBar = SnackBar(
            content: Text('The  email has already been taken.'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if ((data['message']['return_date']) != null) {
          print('date....');
          final snackBar = SnackBar(
            content: Text('The end date must be a date after start date.'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          print('nullll.....');
        }
      }
      else {
        print('failed');
        // final snackBar = SnackBar(
        //   content: Text('Hi, Invalid login credentials'),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }catch(e){
      print(e.toString());
    }
  }




  void initState() {
    // TODO: implement initState

    // login('', '', '', '', '', '', '', '', '', '', '', '', '');

  }




  Future<List<String>> AirporttList() async {
   // var baseUrl = "https://staging.abisiniya.com/api/v1/flight/airlinelist";
    String baseUrl = baseDioSingleton.AbisiniyaBaseurl+ 'flight/airportlist';
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<String> items = [];
      var jsonData = json.decode(response.body);
     // print(jsonData.toString());
      var namestr = jsonData['data'];
      for (var nameArray in namestr) {
        String namestrvalue = nameArray['name'];
        //print(namestrvalue);
        items.add(namestrvalue);
      }
      return items;
    } else {
      throw response.statusCode;
    }
  }

  //Airline List API Integration
  Future<List<String>> AirlineList() async {
    // var baseUrl = "https://staging.abisiniya.com/api/v1/flight/airlinelist";
    String baseUrl = baseDioSingleton.AbisiniyaBaseurl+ 'flight/airlinelist';
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<String> items = [];
      var jsonData = json.decode(response.body);
     // print(jsonData.toString());
      var namestr = jsonData['data'];
      for (var nameArray in namestr) {
        String namestrvalue = nameArray['name'];
       // print(namestrvalue);
        items.add(namestrvalue);
      }
      return items;
    } else {
      throw response.statusCode;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white, Colors.green]),
            ),
          ),
          actions: <Widget>[
          ],
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          title: Text('FLIGHTS',textAlign: TextAlign.center,
              style: TextStyle(color:Colors.white,fontFamily: 'Baloo', fontWeight: FontWeight.w900,fontSize: 20)),

        ),
        body: Column(
          children: <Widget>[
            Container(color: Colors.white, height: 50),
            Expanded(
              child: Container(

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.white, Colors.green]),
                ),
                //color: Colors.white,
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Container(
                                  height: 1250.0,
                                  width: 325.0,
                                  decoration: const BoxDecoration(
                                    //color: Color(0xFFffffff),
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white24,
                                        blurRadius: 15.0, // soften the shadow
                                        spreadRadius: 5.0, //extend the shadow
                                        offset: Offset(
                                          5.0, // Move to right 5  horizontally
                                          5.0, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 125,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 60.0,
                                            child: Image.asset(
                                                "images/logo2.png",
                                                height: 100.0,
                                                width: 125.0,
                                                fit: BoxFit.fill
                                            ),
                                          )
                                      ),
                                      Text(
                                        "Fill The Details Below & We Will Do The Rest!!",
                                        textAlign: TextAlign.center ,
                                        style: TextStyle(
                                            color: Colors.green,fontWeight: FontWeight.bold,fontSize: 26),),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 05.0,
                                            left: 15.0,
                                            right: 05.0),
                                        //color: Colors.white30,
                                        color: Colors.white,
                                        width: 300.0,
                                        height: 40.0,
                                        child: TextField(
                                            controller: firstNameController,
                                            textAlign: TextAlign.left,
                                            autocorrect: false,
                                            decoration:
                                            //disable single line border below the text field
                                            new InputDecoration.collapsed(
                                                hintText: 'First Name')),
                                      ),

                                      SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 05.0,
                                            left: 15.0,
                                            right: 05.0),
                                        //color: Colors.white30,
                                        color: Colors.white,
                                        width: 300.0,
                                        height: 40.0,
                                        child: TextField(
                                           controller: lastNameController,
                                            textAlign: TextAlign.left,
                                            autocorrect: false,
                                            decoration:
                                            //disable single line border below the text field
                                            new InputDecoration.collapsed(
                                                hintText: 'Last Name')),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 05.0,
                                            left: 15.0,
                                            right: 05.0),
                                        //color: Colors.white30,
                                        color: Colors.white,
                                        width: 300.0,
                                        height: 40.0,
                                        child: TextField(
                                            controller: emailController,
                                            textAlign: TextAlign.left,
                                            autocorrect: false,
                                            decoration:
                                            //disable single line border below the text field
                                            new InputDecoration.collapsed(
                                                hintText: 'Email')),
                                      ),

                                      SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 05.0,
                                            left: 15.0,
                                            right: 05.0),
                                        //color: Colors.white30,
                                        color: Colors.white,
                                        width: 300.0,
                                        height: 40.0,
                                        child: TextField(
                                            keyboardType: TextInputType.number,
                                             controller: phoneController,
                                            textAlign: TextAlign.left,
                                            autocorrect: false,
                                            decoration:
                                            //disable single line border below the text field
                                            new InputDecoration.collapsed(
                                                hintText: 'Phone')),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 05.0,
                                            left: 15.0,
                                            right: 05.0),
                                        //color: Colors.white30,
                                        color: Colors.white,
                                        width: 300.0,
                                        height: 40.0,
                                        child: TextField(
                                          obscureText: true,
                                          controller: passwordController,
                                            textAlign: TextAlign.left,
                                            autocorrect: false,
                                            decoration:
                                            //disable single line border below the text field
                                            new InputDecoration.collapsed(
                                                hintText: 'Password')
                                        ),
                                      ),        SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 05.0,
                                            left: 15.0,
                                            right: 05.0),
                                        //color: Colors.white30,
                                        color: Colors.white,
                                        width: 300.0,
                                        height: 40.0,
                                        child: TextField(
                                          obscureText: true,
                                           controller: password_confirmation_Controller,
                                            textAlign: TextAlign.left,
                                            autocorrect: false,
                                            decoration:
                                            //disable single line border below the text field
                                            new InputDecoration.collapsed(
                                                hintText: 'Password Confirmation')),
                                      ),
                                      SizedBox(height: 10,),

                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        height: 50,
                                        width: 300,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FutureBuilder<List<String>>(
                                              future: AirporttList(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  var data = snapshot.data!;
                                                  return DropdownButton(
                                                       isExpanded: true,
                                                    hint: Text('From'),
                                                    value: fromdropdownvalue,
                                                    icon: const Icon(Icons.keyboard_arrow_down),
                                                    items: data.map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items,style: TextStyle(fontSize: 13),),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      setState(() {
                                                        fromdropdownvalue = newValue!;
                                                      });
                                                    },
                                                  );
                                                } else {
                                                  return const CircularProgressIndicator();
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        height: 50,
                                        width: 300,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FutureBuilder<List<String>>(
                                              future: AirporttList(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  var data = snapshot.data!;
                                                  return DropdownButton(
                                                    isExpanded: true,
                                                    hint: Text('To'),
                                                    value: todropdownvalue,
                                                    icon: const Icon(Icons.keyboard_arrow_down),
                                                    items: data.map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items,style: TextStyle(fontSize: 13),),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      setState(() {
                                                        todropdownvalue = newValue!;
                                                      });
                                                    },
                                                  );
                                                }
                                                else {
                                                  return const CircularProgressIndicator();
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),


                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10),
                                        height: 50,
                                        width: 300,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FutureBuilder<List<String>>(
                                              future: AirlineList(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  var data = snapshot.data!;
                                                  return DropdownButton(
                                                    isExpanded: true,
                                                    hint: Text('Airlines'),
                                                    value: airlinedropdownvalue,
                                                    icon: const Icon(Icons.keyboard_arrow_down),
                                                    items: data.map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items,style: TextStyle(fontSize: 13),),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      setState(() {
                                                        airlinedropdownvalue = newValue!;
                                                      });
                                                    },
                                                  );
                                                }
                                                else {
                                                  return const CircularProgressIndicator();
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 05.0,
                                            left: 15.0,
                                            right: 05.0),
                                        height: 45,
                                        width: 300,
                                        color: Colors.white,
                                        child: TextField(
                                          textAlign: TextAlign.left,
                                          autocorrect: false,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.calendar_month),
                                              hintText: 'From Date',
                                              border: InputBorder.none,
                                            ),
                                            controller: FromdateInputController,
                                            readOnly: true,
                                            onTap: () async {
                                              DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime(2050));
                                              if (pickedDate != null) {
                                                // FromdateInputController.text =pickedDate.toString();
                                                fromDatestr = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                                FromdateInputController.text = fromDatestr;
                                              }
                                            }
                                        ),),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 45,
                                        width: 300,
                                        color: Colors.white,
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 10.0,
                                            left: 15.0,
                                            right: 05.0),
                                        child: TextField(
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.calendar_month),
                                              hintText: 'To Date',
                                              border: InputBorder.none,
                                            ),
                                            controller: TodateInputController,
                                            readOnly: true,
                                            onTap: () async {
                                              DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime(2050));
                                              if (pickedDate != null) {
                                                //TodateInputController.text =pickedDate.toString();
                                                toDatestr = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                                TodateInputController.text = toDatestr;
                                              }
                                            }
                                        ),),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 300,
                                        color: Colors.white,
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(left: 10.0,),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            DropdownButton(
                                              isExpanded: true,
                                              // Initial Value
                                              value: traveldropdownvalue,
                                              // Down Arrow Icon
                                              icon: const Icon(Icons.keyboard_arrow_down),
                                              // Array list of items
                                              items: travelitems.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  traveldropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ],

                                        ),

                                      ),




                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 300,
                                        color: Colors.white,
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(left: 10.0,),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            DropdownButton(
                                              isExpanded: true,
                                              // Initial Value
                                              value: tripdropdownvalue,
                                              // Down Arrow Icon
                                              icon: const Icon(Icons.keyboard_arrow_down),
                                              // Array list of items
                                              items: tripitems.map((String tripitems) {
                                                return DropdownMenuItem(
                                                  value: tripitems,
                                                  child: Text(tripitems),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  tripdropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ],

                                        ),

                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Container(
                                        margin: const EdgeInsets.all(00.0),
                                        padding: EdgeInsets.only(top: 05.0,
                                            left: 15.0,
                                            right: 05.0),
                                        //color: Colors.white30,
                                        color: Colors.white,
                                        width: 300.0,
                                        height: 200.0,
                                        child: TextField(
                                           controller: additionainfo_Controller,
                                            textAlign: TextAlign.left,
                                            autocorrect: false,
                                            decoration:
                                            //disable single line border below the text field
                                            new InputDecoration.collapsed(
                                                hintText: 'Additional Information')),
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 300,
                                        color: Colors.black54,
                                        child: Column(
                                          children: [
                                            InkWell(
                                              child: Container(
                                                height: 50,
                                                width: 300,
                                                color: Colors.black54,
                                                child: const Align(
                                                  alignment: Alignment.center,
                                                  child: Text('Request',
                                                      style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800
                                                      ),
                                                      textAlign: TextAlign.center),
                                                ),

                                              ),
                                              onTap: () async {
                                                print("Tapped on container");
                                                login('', '', '', '', '', '', '', '', '', '', '', '', '');



                                              },
                                            )],
                                        ),
                                      ),

                                  ],
                                  )
                              ),
                              // middle widget goes here
                              Expanded(
                                child: Container(),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //Icon(Icons.star),
                                    // Text("Bottom Text")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        )
    );
  }
}



