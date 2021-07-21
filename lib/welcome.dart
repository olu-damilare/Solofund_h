import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void setUpHome(){
       Future.delayed(const Duration(seconds: 2), () => "2");
       Navigator.pushReplacementNamed(context, '/bio');
  }

  @override
  Widget build(BuildContext context) {
    return homePage();
  }

  @override
  void initState(){
    super.initState();
    setUpHome();

  }

  Scaffold homePage() {
    return Scaffold(
    body: Center(
      child: SizedBox(
      width: 180,
      height: 180,
          child: Image.asset(
              'assets/big logo.png',
          )
      ),
    )
  );
  }
}
