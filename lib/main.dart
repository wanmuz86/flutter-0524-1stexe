import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _heightSliderValue = 170.0;
  var _weightSliderValue = 70.0;
  var _message = "";
  var _bmi = 0;

  @override
  Widget build(BuildContext context) {
    // To Do Scaffold with App title "BMI Calculator"

    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator"),backgroundColor: Colors.red,),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                 Text("BMI Calculator", style: TextStyle(color: Colors.red, fontSize: 32),),
                SizedBox(height: 10,),
                Text("We care about our health"),
                SizedBox(height: 10,),
                Image.asset("assets/bmi.png"),
                SizedBox(height: 10,),
                Text("Height ${_heightSliderValue.round().toString()} cm"),
                Slider(
                  value: _heightSliderValue,
                  max: 220,
                  min:100,
                  label: _heightSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _heightSliderValue = value;
                    });
                  },
                ),
                SizedBox(height: 10,),
                Text("Weight: ${_weightSliderValue.round().toString()} kg"),
                Slider(
                  value: _weightSliderValue,
                  max: 150,
                  min:40,
                  label: _weightSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _weightSliderValue = value;
                    });
                  },
                ),

                SizedBox(height: 10,),
                //  condition ? if yes : otherwise / if not ...
                _bmi != 0 ? Text("Your BMI is ${_bmi}. ${_message}") : SizedBox(),
                SizedBox(height: 10,),
                TextButton.icon(onPressed: (){

                  ///  bmi = weight / (height in metre) x (height in metre)
                  ///  import 'dart:math'; (Add on top of page)
                  var bmiTemp = _weightSliderValue.round() / pow((_heightSliderValue.round()/100),2);
                  var messageTemp = "";

                  if (bmiTemp < 18){
                    messageTemp = "You are underweight";
                  }else if (bmiTemp < 25){
                    messageTemp = "You are normal";

                  } else if (bmiTemp < 30){
                    messageTemp = "You are overweight";

                  } else {
                    messageTemp = "You are obese";
                  }
                  // print("The bmi is ${bmiTemp.round()}");
                  // print(messageTemp);
                  //_bmi = bmiTemp;  // normal programming
                  // Set state is equivalent to the above + it will also refresh the UI so the updated value comes out
                  setState(() {
                    _bmi = bmiTemp.round();
                    _message = messageTemp;
                  });

                }, icon: Icon(Icons.favorite),
                    label: Text("Calculate BMI"))
              ],
            ),
          ),
        ),
      )
    );


  }
}

