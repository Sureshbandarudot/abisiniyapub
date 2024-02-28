import 'package:flutter/material.dart';

import 'ApartVC/Apartment.dart';
import 'Auth/Login.dart';
import 'Vehicles.dart';

void main() {
  runApp(ServiceDashboardScreen());
}

class ServiceDashboardScreen extends StatelessWidget {

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
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
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.0,

          children: [


            Ink(
              color: Colors.white,
              child: InkWell(
                  child: Container(
                    margin: EdgeInsets.only(top: 20,left: 20),
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(new Radius.circular(10)),
                      border: new Border.all(
                        color: Colors.green,
                        width: 4.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "images/house_icon2.png",
                          fit: BoxFit.cover,
                          height: 45,
                          width: 45,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                          child:Text(
                            'Apartment',
                            //textAlign: Alignment.bottomCenter,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),),
                      ],
                    ),
                  ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Apartmentscreen()),
                  );
                },
              ),
            ),

            Ink(
              color: Colors.white,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 20,right: 20),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "images/airplane_icon.png",
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                        child:Text(
                          'Flights',
                          //textAlign: Alignment.bottomCenter,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(10)),
                    border: new Border.all(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),

                onTap: () {},
              ),
            ),
            Ink(
              color: Colors.white,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 20,left: 20),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "images/car_icon2.png",
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                        child:Text(
                          'Vehicles',
                          //textAlign: Alignment.bottomCenter,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(10)),
                    border: new Border.all(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),

                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Vehiclescreen()),
                  );

                },
              ),
            ),
            Ink(
              color: Colors.white,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 20,right: 20),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "images/profile_icon.png",
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                        child:Text(
                          'Profile',
                          //textAlign: Alignment.bottomCenter,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(10)),
                    border: new Border.all(
                      color: Colors.green,
                      width: 4.0,
                    ),
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
                child: Container(
                  margin: EdgeInsets.only(top: 20,left: 20),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "images/support_icon.png",
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                        child:Text(
                          'Support',
                          //textAlign: Alignment.bottomCenter,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(10)),
                    border: new Border.all(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),

                onTap: () {},
              ),
            ),
            Ink(
              color: Colors.white,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 20,right: 20),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "images/setting_iconblue.png",
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                        child:Text(
                          'Settings',
                          //textAlign: Alignment.bottomCenter,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(10)),
                    border: new Border.all(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),

                onTap: () {},
              ),
            )



          ],
        ),

        // body: GridView.count(
        //   crossAxisCount: 2,
        //   crossAxisSpacing: 10.0,
        //   mainAxisSpacing: 10.0,
        //   shrinkWrap: true,
        //   children: List.generate(20, (index) {
        //     return Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: NetworkImage('img.png'),
        //             fit: BoxFit.cover,
        //           ),
        //           borderRadius:
        //           BorderRadius.all(Radius.circular(20.0),),
        //         ),
        //       ),
        //     );
        //   },),
        // ),
      ),
    );
  }
}