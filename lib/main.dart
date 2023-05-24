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

  // Implicit declaration using var - We do not specify the data type . Dart assume/imply based on the initial value
  // var a = 170 -> a will be implied as integer
  // var a = 170.0 -> a will be implied as double

  // Explicit declaration using the datatype - String, double, int, List, Map, boolen
  var _heightSliderValue = 170.0;
  double _weightSliderValue = 70; // Using Explicit declaration, I declare this value as double..

  var _message = "";
  // I can also declare String _message="";
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
                const Text("BMI Calculator", style: TextStyle(color: Colors.red, fontSize: 32),),
                const SizedBox(height: 10,),
                const Text("We care about our health"),
                const SizedBox(height: 10,),
                Image.asset("assets/bmi.png"),
                const SizedBox(height: 10,),
                Text("Height ${_heightSliderValue.round().toString()} cm"),
                Slider(
                  value: _heightSliderValue,
                  max: 220,
                  min:100,
                  label: _heightSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _heightSliderValue = value;
                      _bmi = 0;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                Text("Weight: ${_weightSliderValue.round().toString()} kg"),
                Slider(
                  value: _weightSliderValue,
                  max: 150,
                  min:40,
                  label: _weightSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _weightSliderValue = value;
                      _bmi = 0;
                    });
                  },
                ),

                const SizedBox(height: 10,),
                //  condition ? if yes : otherwise / if not ... (Conditional Rendering) -> If else to show UI

                // Interpolation " ${} " -> Bring out value from a variable
                // If you call a method after the variable, you use ${} , eg: ${_bmi.round()} // 3.145 -> 3 (round)
                // If you do not call a method, after the variable you use $ only .. eg: $_bmi

                _bmi != 0 ? Text("Your BMI is $_bmi. $_message") : const SizedBox(),
                const SizedBox(height: 10,),
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

                }, icon: const Icon(Icons.favorite),
                    label: const Text("Calculate BMI"))
              ],
            ),
          ),
        ),
      )
    );


  }
}

