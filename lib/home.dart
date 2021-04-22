import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizstar/quizpage.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "images/c3.jpg",
    "images/p3.jpg",
    "images/f1.jpg",
    "images/p4.jpg",
    "images/p5.jpg",
  ];

  List<String> des = [
    "\"Farming looks mighty easy when your plow is a pencil, and you’re a thousand miles from the corn field.\" \nJust test yourself !!",
    "\"No race can prosper until it learns there is as much dignity in tilling a field as in writing a poem...\"\nJust Test Yourself !!",
    "\“The ultimate goal of farming is not the growing of crops, but the cultivation and perfection of human beings.\” \nJust Test  Yourself!",
    "\" Life on a farm is a school of patience; you can’t hurry the crops or make an ox in two days.\” \n Just Test Yourself !",
    "\“It feels good at the end of the day to know you made a product that other people are going to enjoy.\”\n Just Test Yourself !",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file 
            // for a particular language
            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Colors.lightGreen,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Alike"
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AgriQuiz",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Level 1", images[0], des[0]),
          customcard("Level 2", images[1], des[1]),
          customcard("Level 3", images[2], des[2]),
          customcard("Level 4", images[3], des[3]),
          customcard("Level 5", images[4], des[4]),
        ],
      ),
    );
  }
}