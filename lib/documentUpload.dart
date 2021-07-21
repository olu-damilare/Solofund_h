import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';


class Document extends StatefulWidget {
  const Document({Key? key}) : super(key: key);

  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  String dropdownValue = 'International Passport';
  XFile imageFile = XFile('assets/placeholder.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 70.0, 30, 20),
          child: Center(
            child: Column(
                children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                        height: 30,
                        color: HexColor('#Ffa62b'),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(14,5,0,0),
                          child: buildText(
                              'Choose an ID type', 15, FontWeight.bold,
                              color: Colors.white),
                        )
                    ),
                    SizedBox(width: 10.0),
                    DropdownButton<String>(
              value: dropdownValue,
              elevation: 16,
              style: TextStyle(
              color: HexColor('#0a2351'),
              ),
              underline: Container(
              height: 2,
              color: HexColor('#0a2351'),
              ),
              onChanged: (String? newValue) {
              setState(() {
              dropdownValue = newValue!;
              });
              },
              items: <String>['International Passport', 'Driver\'s licence', 'National ID']
                      .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
              );
              }).toList(),
              ),
                  ],
                ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 250,
                    height: 250,
                     decoration: BoxDecoration(
                  image: DecorationImage(
                  image: imageFile as ImageProvider,
              fit: BoxFit.cover
          )
        ),

                  ),
                  SizedBox(height: 10.0),
                  FlatButton(
                    onPressed: (){
                      chooseImage();
                    },
                    color: Colors.grey[200],
                      child:buildText('Add an ID', 15, FontWeight.bold, hexColor: '#0a2351'),
                  ),
                  SizedBox(height: 100),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: FlatButton.icon(
                      icon: Icon(
                          Icons.upload_file,
                      color: Colors.white,),
                      onPressed: (){},
                      color: HexColor('#Ffa62b'),
                      label: buildText('Upload Document', 15, FontWeight.bold, color: Colors.white),
                    ),
                  )


                ]
            ),
          ),
        )

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

  void chooseImage() async {
    ImagePicker picker = ImagePicker();
    setState(()  {
      imageFile =  picker.pickImage(source: ImageSource.gallery) as XFile;
    });
  }

}