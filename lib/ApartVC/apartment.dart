import 'package:flutter/material.dart';
//import 'package:tourstravels/ApartVC/Add_Apartment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tourstravels/Auth/Login.dart';
import 'dart:convert';
import 'package:tourstravels/ApartVC/Addaprtment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourstravels/Singleton/SingletonAbisiniya.dart';

import '../ServiceDasboardVC.dart';
import 'NewUserbooking.dart';
//void main() => runApp(Apartmentscreen());
class Apartmentscreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final baseDioSingleton = BaseSingleton();
  final borderRadius = BorderRadius.circular(20); // Image border
  int _counter = 0;
  int selectedIndex = 0;
  int imageID = 0;
  String citystr = '';
  String RetrivedPwd = '';
  String RetrivedEmail = '';
  String Logoutstr = '';
  _retrieveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      RetrivedEmail = prefs.getString('emailkey') ?? "";
      RetrivedPwd = prefs.getString('passwordkey') ?? "";
      Logoutstr = prefs.getString('logoutkey') ?? "";
      var propertytype = prefs.getString('Property_type') ?? "";
print(propertytype);
      print('logout....');
      print(Logoutstr);
    });
  }
  //Login Authentication for Fresh or Existing user:
  void login(String email , password) async {
    try{
      Response response = await post(
          //Uri.parse('https://staging.abisiniya.com/api/v1/login'),
          Uri.parse(baseDioSingleton.AbisiniyaBaseurl + 'login'),
          body: {
            'email' : RetrivedEmail,
            'password' : RetrivedPwd
          }
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('User Login Authentication  successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddApartment()
          ),
        );

      }else {
        print('failed');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserBooking()
          ),
        );
        print('User Login not Authentication  successfully');

      }
    }catch(e){
      print(e.toString());
    }
  }
@override
void initState() {
  // TODO: implement initState
  super.initState();
  _retrieveValues();

}
  Future<dynamic> getData() async {
    //String url = 'https://staging.abisiniya.com/api/v1/apartment/list';
    String url = baseDioSingleton.AbisiniyaBaseurl + 'apartment/list';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('success.....');
      final data1 = jsonDecode(response.body);
      print(data1);
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackButton(
            onPressed: () async{
              print("back Pressed");
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('logoutkey', ('LogoutDashboard'));
              prefs.setString('Property_type', ('Apartment'));
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDashboardScreen()),
              );
            },
          ),
          title: Text('APARTMENT',textAlign: TextAlign.center,
              style: TextStyle(color:Colors.green,fontFamily: 'Baloo', fontWeight: FontWeight.w900,fontSize: 20)),
        ),
        body: FutureBuilder<dynamic>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Input a URL to start');
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return Text('');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.white),
                    );
                  } else {

                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: LayoutBuilder(
                              builder: (context, constraint) {
                                return SingleChildScrollView(
                                  physics: ScrollPhysics(),
                                  child: Column(
                                      children: [

                                                        ListView.separated(
                                                          scrollDirection: Axis.horizontal,
                                                          itemCount: snapshot.data['data'].length ,
                                                          separatorBuilder: (BuildContext context, int index) => const Divider(),
                                                          itemBuilder: (BuildContext context, int index) {
                                                                var picstrr = snapshot.data['data'];
                                                                for (var record in picstrr) {
                                                                  var pictures = record['pictures'];
                                                                  print(pictures);
                                                                 for(var pics in pictures) {
                                          //var picname = pics['imageUrl'];
                                                                imageID = (snapshot.data['data'][index]['id']);
                                                                print('iD value...');
                                                                print(imageID);
                                                                if (30 == 30) {
                                                                  var picname = pics['imageUrl'];
                                                                  var picimg = pics['imageName'];
                                                                  print('pic names');
                                                                  print(picname);
                                                                  print(picimg);
                                                                }
                                        }
                                        }
                                        return Container(
                                          height: 525,
                                          width: 300,
                                          margin: EdgeInsets.all(20),// add margin
                                          //padding: EdgeInsets.all(20),
                                          color: Colors.white,
                                          child: InkWell(
                                            child: Column(
                                                children: [
                                                    SizedBox(
                                                    height: 25,
                                                ),
                                                   Container(
                                                    height: 475,
                                                    width: 300,
                                                     decoration: const BoxDecoration(
                                                       color: Color(0xFFffffff),
                                                       boxShadow: [
                                                         BoxShadow(
                                                           color: Colors.white,
                                                           blurRadius: 15.0, // soften the shadow
                                                           spreadRadius: 5.0, //extend the shadow
                                                           offset: Offset(
                                                             5.0, // Move to right 5  horizontally
                                                             5.0, // Move to bottom 5 Vertically
                                                           ),
                                                         )
                                                       ],
                                                         borderRadius: BorderRadius.all(Radius.circular(10))
                                                     ),
                                                     child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),

                                                        Container(
                                                          height: 140,
                                                          width: 140,
                                                          //margin: EdgeInsets.only(top: 20,left: 20),
                                                          decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                                                          child: ClipRRect(
                                                            borderRadius: borderRadius,
                                                            child: SizedBox.fromSize(
                                                              size: Size.fromRadius(48), // Image radius
                                                              child: Image.network((snapshot.data["data"][index]['pictures'][0
                                                                       ]['imageUrl']), fit: BoxFit.cover),
                                                             // child: Image.asset('images/Settingsimg.jpg', fit: BoxFit.cover),
                                                            ),
                                                          ),
                                                        ),
                                                       //  Container(
                                                       //    height: 200,
                                                       //    //color: Colors.green,
                                                       // decoration: BoxDecoration(
                                                       //           image: DecorationImage(image: NetworkImage(snapshot.data["data"][index]['pictures'][0
                                                       //           ]['imageUrl']),
                                                       //               fit: BoxFit.cover)
                                                       //       ),
                                                       //  ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          height: 170,
                                                          width: 300,
                                                          color: Colors.white,
                                                          child: Column(
                                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            //crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                width: 280,
                                                                height: 40,
                                                                color: Colors.white,
                                                                child:Text(snapshot.data['data'][index]['city'],textAlign: TextAlign.left,style: (TextStyle(fontWeight: FontWeight.w900,fontSize: 22,color: Colors.green)),),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                width: 280,
                                                                height: 70,
                                                                color: Colors.white,
                                                                //child: (Text(snapshot.data['data']['price'] as int)),
                                                                child:Row(
                                                                  children: [
                                                                    Container(
                                                                      height: 60,
                                                                      width: 140,
                                                                      color: Colors.white,
                                                                      child: Column(
                                                                        children: [
                                                                          Container(
                                                                            height: 30,
                                                                            width: 140,
                                                                            child:Text('Start From',textAlign: TextAlign.start,style: (TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.black)),),
                                                                          ),
                                                                          Container(
                                                                            height: 30,
                                                                            width: 140,
                                                                            child:Text('${(snapshot.data['data'][index]['price'].toString())}.00/Night.',textAlign: TextAlign.left,
                                                                              style: (TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.green)),),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height: 60,
                                                                      width: 140,
                                                                      color: Colors.white,

                                                                      child: TextButton(
                                                                        style: TextButton.styleFrom(backgroundColor:Colors.green),
                                                                        onPressed: () async {

                                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                          prefs.setString('citykey', snapshot.data['data'][index]['city']);
                                                                          prefs.setInt('imgkeyId', snapshot.data['data'][index]['id']);
                                                                          prefs.setString('addresskey', snapshot.data['data'][index]['address']);
                                                                          prefs.setString('bathroomkey', (snapshot.data['data'][index]['bathroom'].toString()));
                                                                          prefs.setString('bedroomkey', (snapshot.data['data'][index]['bedroom'].toString()));
                                                                          prefs.setString('pricekey', (snapshot.data['data'][index]['price'].toString()));
                                                                          prefs.setString('Property_type', ('Apartment'));
                                                                          prefs.setString('emailkey', (RetrivedEmail));
                                                                          prefs.setString('passwordkey', (RetrivedPwd));
                                                                          print('email....');
                                                                          print(RetrivedEmail);
                                                                          print('pwd...');
                                                                          print(RetrivedPwd);
                                                                          print('logout......');
                                                                          print(Logoutstr);

                                                                          if(Logoutstr == 'LogoutDashboard') {
                                                                            print('fail dash...');
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => AddApartment()
                                                                              ),
                                                                            );
                                                                          } else{
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => UserBooking()
                                                                              ),
                                                                            );
                                                                            // login(RetrivedEmail, RetrivedPwd);
                                                                          }
                                                                        },
                                                                        child: const Text('BookNow'),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),

                                                              Container(
                                                                height: 50,
                                                                width: 280,
                                                                color: Colors.white,
                                                                child:Text(snapshot.data['data'][index]['address'],textAlign: TextAlign.left,style: (TextStyle(fontWeight: FontWeight.w900,fontSize: 22,color: Colors.green)),),

                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 24,
                                                        ),
                                                        Container(
                                                          height: 60,
                                                          width: 280,
                                                          color: Colors.green,
                                                          child: Row(
                                                            children: [

                                                              Container(
                                                                height: 40,
                                                                width: 140,
                                                                color: Colors.green,
                                                              child:Text('${(snapshot.data['data'][index]['bedroom'].toString())} Bedroom(s)',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),textAlign: TextAlign.center,
                                                   ),
                                              ),
                                                              Container(
                                                                height: 40,
                                                                width: 140,
                                                                color: Colors.green,
                                                                child:Text('${(snapshot.data['data'][index]['bathroom'].toString())} Bathroom(s)',textAlign: TextAlign.center,
                                                               style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18), ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                     ),
                                                    ),
                                                  ],
                                            ),
                                          //onTap: ()
                                        onTap: ()async{
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setString('citykey', snapshot.data['data'][index]['city']);
                                          prefs.setInt('imgkeyId', snapshot.data['data'][index]['id']);
                                          prefs.setString('addresskey', snapshot.data['data'][index]['address']);
                                          prefs.setString('bathroomkey', (snapshot.data['data'][index]['bathroom'].toString()));
                                          prefs.setString('bedroomkey', (snapshot.data['data'][index]['bedroom'].toString()));
                                          prefs.setString('pricekey', (snapshot.data['data'][index]['price'].toString()));
                                          prefs.setString('Property_type', ('Apartment'));
                                          prefs.setString('emailkey', (RetrivedEmail));
                                          prefs.setString('passwordkey', (RetrivedPwd));
                                          print('email....');
                                          print(RetrivedEmail);
                                          print('pwd...');
                                          print(RetrivedPwd);
                                          print('logout......');
                                          print(Logoutstr);
                                          if(Logoutstr == 'LogoutDashboard') {
                                          print('fail dash...');
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                          builder: (context) => AddApartment()
                                          ),
                                          );
                                          } else{
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => UserBooking()
                                              ),
                                            );
                                            // login(RetrivedEmail, RetrivedPwd);
                                          }
                                          print([index]);
                                          },
                                        ),
                                        );},
                                                        ),
                                        Column(
                                          children: [
                                            Text('Popular Offers:-',style: (TextStyle(fontWeight:FontWeight.w800,fontSize: 20)),)
                                          ],
                                        ),
                                      ]
                                  ),

                                );
                              },
                            ),
                          ),
                        )
                      ],
                    );





                  }
              }
            }
            )
    );
  }
}
