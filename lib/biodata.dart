import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class BioData extends StatefulWidget {
  const BioData({Key? key}) : super(key: key);

  @override
  _BioDataState createState() => _BioDataState();
}

class _BioDataState extends State<BioData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Complete KYC',
          style: TextStyle(
            color: HexColor('#Ffa62b'),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 15.0),
        child: Center(
          child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  width: 60,
                  height: 60,
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText(
                        'First Name', 15, FontWeight.bold, hexColor: '#0a2351'),
                    SizedBox(height: 10),
                    buildTextFormField(
                        'First Name', 15, FontWeight.w400, 'Input your first name'),
                    SizedBox(height: 15),
                    buildText(
                        'Last Name', 15, FontWeight.bold, hexColor: '#0a2351'),
                    SizedBox(height: 10),
                    buildTextFormField(
                        'Last Name', 15, FontWeight.w400, 'Input your last name'),
                    SizedBox(height: 15),
                    buildText(
                        'SSN', 15, FontWeight.bold, hexColor: '#0a2351'),
                    SizedBox(height: 10),
                    buildTextFormField('SSN', 15, FontWeight.w400,
                        'Input your social security number'),
                  ],
                ),
                SizedBox(height: 120),
                SizedBox(
                  width: 350,
                  height: 40,
                  child: RaisedButton(
                      onPressed: (){},
                    color: HexColor('#0E3386'),
                    child: buildText('Next', 14, FontWeight.bold, color: Colors.white),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(String inputText, double fontSize,
      FontWeight fontWeight, String hintText) {
    return TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[350],
          ),
          fillColor: Colors.grey[100],
          filled: true
      ),
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Text buildText(String text, double fontSize, FontWeight fontWeight,
      {Color? color, String? hexColor}) {
    dynamic newCol;
    if (color != null)
      newCol = color;
    else if (hexColor != null) newCol = HexColor(hexColor);
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Lato',
        color: newCol,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
