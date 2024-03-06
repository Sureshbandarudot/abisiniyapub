import 'package:flutter/material.dart';

import 'ApartVC/Apartment.dart';
import 'ApartVC/Authenticated_Userbookingscreen.dart';
import 'Auth/Login.dart';
import 'Authenticated_Vehiclescreen.dart';
import 'Flights.dart';
import 'Vehicles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourstravels/Singleton/SingletonAbisiniya.dart';


void main() {
  runApp(ServiceDashboardScreen());
}

class ServiceDashboardScreen extends StatelessWidget {
  final borderRadius = BorderRadius.circular(20); // Image border
  String Logoutstr = '';


  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white, Colors.green]),
            ),
          ),
          title: Center(
            child: Text(
              'Abisiniya',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.white, Colors.green]),
            ),
          child: GridView.count(
            // physics: BouncingScrollPhysics(),
            // shrinkWrap: true,
            // crossAxisCount: 3,

            //GridView.count(

              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1.0,
              children: [
                Ink(
                  color: Colors.white,
                  child: InkWell(
                      child:Container(
                        margin: EdgeInsets.only(left: 20),
                      child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: 140,
                              //margin: EdgeInsets.only(top: 20,left: 20),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                              child: ClipRRect(
                                borderRadius: borderRadius,
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48), // Image radius
                                  //child: Image.network('imageUrl', fit: BoxFit.cover),
                                  child: Image.asset('images/apts.jpg', fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Text('Apartments',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),)
                          ],
                        ),
                      ),
                    onTap: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      Logoutstr = prefs.getString('logoutkey') ?? "";
                      print('dashboard sts...');
                      print(Logoutstr);
                      if(Logoutstr == 'LogoutDashboard'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthenticatedUserScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Apartmentscreen()),
                        );                      }

                    },
                  ),
                ),

                Ink(
                  color: Colors.white,
                  child: InkWell(
                    child:Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            //margin: EdgeInsets.only(top: 20,left: 20),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                            child: ClipRRect(
                              borderRadius: borderRadius,
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                //child: Image.network('imageUrl', fit: BoxFit.cover),
                                child: Image.asset('images/Flightimg.jpg', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Text('Flights',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlightScreen()),
                      );
                    },
                  ),
                ),
                Ink(
                  color: Colors.white,
                  child: InkWell(
                    child:Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            //margin: EdgeInsets.only(top: 20,left: 20),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                            child: ClipRRect(
                              borderRadius: borderRadius,
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                //child: Image.network('imageUrl', fit: BoxFit.cover),
                                child: Image.asset('images/carimgs.jpg', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Text('Vehicles',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),)
                        ],
                      ),
                    ),
                    onTap: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      Logoutstr = prefs.getString('logoutkey') ?? "";
                      print('dashboard sts...');
                      print(Logoutstr);
                      if(Logoutstr == 'LogoutDashboard'){
                        print('loged in user....');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthenticatedVehiclescreen()),
                        );
                      } else {
                        print('fresh vehicle use...');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Vehiclescreen()),
                        );                      }
                    },
                  ),
                ),
                Ink(
                  color: Colors.white,
                  child: InkWell(
                    child:Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            //margin: EdgeInsets.only(top: 20,left: 20),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                            child: ClipRRect(
                              borderRadius: borderRadius,
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                //child: Image.network('imageUrl', fit: BoxFit.cover),
                                child: Image.asset('images/profileimg.jpg', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Text('Profile',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login()),
                      );
                    },
                  ),
                ),


                Ink(
                  color: Colors.white,
                  child: InkWell(
                    child:Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            //margin: EdgeInsets.only(top: 20,left: 20),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                            child: ClipRRect(
                              borderRadius: borderRadius,
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                //child: Image.network('imageUrl', fit: BoxFit.cover),
                                child: Image.asset('images/Settingsimg.jpg', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Text('Settings',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlightScreen()),
                      );
                    },
                  ),
                ),
                Ink(
                  color: Colors.white,
                  child: InkWell(
                    child:Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            //margin: EdgeInsets.only(top: 20,left: 20),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                            child: ClipRRect(
                              borderRadius: borderRadius,
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                //child: Image.network('imageUrl', fit: BoxFit.cover),
                                child: Image.asset('images/support.jpg', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Text('Support',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlightScreen()),
                      );
                    },
                  ),
                ),

                // Ink(
                //   color: Colors.white,
                //   child: InkWell(
                //     child:Container(
                //       margin: EdgeInsets.only(left: 20),
                //       child: Column(
                //         children: [
                //           Container(
                //             height: 140,
                //             width: 140,
                //             //margin: EdgeInsets.only(top: 20,left: 20),
                //             decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                //             child: ClipRRect(
                //               borderRadius: borderRadius,
                //               child: SizedBox.fromSize(
                //                 size: Size.fromRadius(48), // Image radius
                //                 //child: Image.network('imageUrl', fit: BoxFit.cover),
                //                 child: Image.asset('images/Settingsimg.jpg', fit: BoxFit.cover),
                //               ),
                //             ),
                //           ),
                //           Text('Settings',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),)
                //         ],
                //       ),
                //     ),
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => Vehiclescreen()),
                //       );
                //     },
                //   ),
                // ),
                // Ink(
                //   color: Colors.white,
                //   child: InkWell(
                //     child:Container(
                //       margin: EdgeInsets.only(right: 20),
                //       child: Column(
                //         children: [
                //           Container(
                //             height: 140,
                //             width: 140,
                //             //margin: EdgeInsets.only(top: 20,left: 20),
                //             decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                //             child: ClipRRect(
                //               borderRadius: borderRadius,
                //               child: SizedBox.fromSize(
                //                 size: Size.fromRadius(48), // Image radius
                //                 //child: Image.network('imageUrl', fit: BoxFit.cover),
                //                 child: Image.asset('images/support.jpg', fit: BoxFit.cover),
                //               ),
                //             ),
                //           ),
                //           Text('Support',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),)
                //         ],
                //       ),
                //     ),
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => Login()),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        )
        );
  }
}