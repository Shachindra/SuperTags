import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:supertags/screens/dashboard.dart';
import 'package:supertags/screens/splashscreen.dart';

class SetupWalletScreen extends StatefulWidget {
  @override
  _SetupWalletScreenState createState() => _SetupWalletScreenState();
}


bool isExistingSeedPhrase=false;

class _SetupWalletScreenState extends State<SetupWalletScreen> {


  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()..onTap=(){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DashboardScreen()));
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('SuperTags | Wallet Setup',
          style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:70.0, bottom: 20),
                child: Image.asset("images/supertags.png", height: 50,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:200.0),
                child: Column(
                  children: [
                    Text('Setup Your Wallet',
                      style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black) ,),
                    SizedBox(height: 20,),
                    Container(
                      width: 200,
                      child: Text('Import an existing wallet or create a new one',
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey) ,),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                        setState(() {
                          isExistingSeedPhrase=true;
                        });
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('IMPORT USING SEED PHRASE',
                            style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blueAccent) ,),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isExistingSeedPhrase=false;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DashboardScreen()));

                      },
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF3366FF),Color(0xFF00CCFF),],
                              begin: Alignment.bottomLeft
                          ),
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
                          child: Center(
                            child: Text('CREATE NEW WALLET',
                              style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white) ,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8),
                      child: RichText(
                        text:
                        TextSpan(
                            text: 'By proceeding, you agree to these ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),
                            children: [
                              TextSpan(
                                  text:'Terms and Conditions',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 13),
                                  recognizer: _gestureRecognizer
                              )
                            ]
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}