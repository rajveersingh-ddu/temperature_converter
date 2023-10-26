

import 'package:flutter/material.dart';

void main(){
  runApp(Temp());
}

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Converter(),
    );
  }
}
class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  double _calcius = 0;
  double _forenhit = 0;
  void _convertTemperature() {
    setState(() {
      _forenhit = (_calcius * 9 / 5) + 32;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/weather.jpg",fit: BoxFit.cover,)
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Celsius to Fahrenheit",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..strokeWidth = 4
                  ..color = Colors.yellowAccent[700]!,),),
              Center(
                child: Container(
                  height: 200,
                  width: 380,

                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      new BoxShadow(color: Colors.greenAccent, offset: new Offset(10.0, 10.0),),
                    ],

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        onChanged:(text){
                          setState(() {
                            _calcius = double.tryParse(text) ?? 0;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:  Colors.white,
                          hintText: "Celcius"
                        ),
                      ),
                      ElevatedButton(onPressed:_convertTemperature, child: Text("Convert"),style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.greenAccent)),),

                    Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                          boxShadow: [ BoxShadow(color: Colors.white,offset: Offset(-2.0,2.0))]
                        ),
                        child: Center(child: Text("Fahrenheit: $_forenhit",style: TextStyle(color: Colors.white,fontSize: 35),))),
                    ],
                  ),

                ),
              ),
            ],
          )
        ],
      )
    );
  }
}

