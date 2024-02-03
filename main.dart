import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result ="";
  var bgcolor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: bgcolor,

        child: Center(
          child: Container(
            // color: Colors.yellow,
            width: 300,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight:  FontWeight.w700
                ),),

                SizedBox(height: 21,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kgs'),
                    prefixIcon : Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in ft'),
                    prefixIcon : Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),


                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inch'),
                    prefixIcon: Icon(Icons.height_rounded)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();

                  if(wt!= "" && ft!="" && inch!=""){
                    //BMI calculation
                    var iwt = int.parse((wt));
                    var ift = int.parse((ft));
                    var iicnh = int.parse((inch));
                    var tInch = (ift*12)+iicnh;
                    var tc = tInch*2.54;
                    var tm = tc/100;
                    var bmi = iwt/(tm*tm);
                    var msg="";

                    if(bmi>25){
                      bgcolor = Colors.orange.shade200;
                      msg = " OVERWEIGHT";
                    }else if(bmi<18){
                      bgcolor = Colors.red.shade200;
                      msg = "UNDERWEIGHT";
                    }else{
                      bgcolor = Colors.green.shade200;
                      msg = "HEALTHY";
                  }

                    setState(() {
                      result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}";
                    });
                  }

                  else{
                    setState(() {
                      result = "PLease fill all the required fields";
                      bgcolor = Colors.indigo.shade200;
                    });

                  }

                }, child: Text('Calculate')),

                SizedBox(height: 21,),

                Text(result, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700 ),)
              ],
            ),
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
