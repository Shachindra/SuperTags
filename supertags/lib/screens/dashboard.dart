// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: const Text('SuperTags | Dashboard',
            style: TextStyle(color: Colors.black),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: Column(
                    children: [
                      const Text('Wallet Address:',
                        style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black) ,),
                      const SizedBox(height: 10,),
                      Container(
                        width: 200,
                        child: const Text('0xFd5C29df337762340283701728Ff541E22a61850',
                          textAlign: TextAlign.center,
                          style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey) ,),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:(){

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => DashboardScreen()));

                              },
                              child: Container(
                                width: 300,
                                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 10,
                                      color: Colors.grey.withOpacity(.2),
                                    ),
                                    BoxShadow(
                                      offset: Offset(-3, 0),
                                      blurRadius: 15,
                                      color: Colors.grey.withOpacity(.2),
                                    )
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Reveal Seed Phrase',
                                    textAlign: TextAlign.center,
                                    style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blueAccent) ,),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0, bottom: 20),
                  child: Image.asset("images/supertags.png", height: 100,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: Column(
                    children: [
                      const Text('Launch Your Experience',
                        style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black) ,),
                      const SizedBox(height: 10,),
                      Container(
                        width: 200,
                        child: const Text('Choose your experience from below:',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey) ,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5,),
                      ElevatedButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, "/experience");},
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(
                              5,
                              5,
                              5,
                              5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Launch Your Brand',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5,),
                      ElevatedButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, "/experience");},
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(
                              5,
                              5,
                              5,
                              5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Create Engaging Events',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5,),
                      ElevatedButton(
                        onPressed: () {Navigator.pushReplacementNamed(context, "/experience");},
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(
                              5,
                              5,
                              5,
                              5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Transform Your Business',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}
