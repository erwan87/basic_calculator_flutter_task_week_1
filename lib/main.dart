import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
// Task Done Erwan Widayat
// - Input & Result Text.
// - Numeric Buttons.
// - Basic Mathematical Operation Button (+, -, =), including (*, /).
// - Clear Input & Result Text.
// - Backspace (Delete Last Character)
// - Zero Handling

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator Flutter Task Week 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Basic Calculator Flutter Task Week 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int valueA = 0;
  int valueB = 0;
  var sbValue = new StringBuffer();
  String operator = "";

  @override
  void initState() {
    super.initState();
    sbValue.write("0");
  }

  void appendValue(String str) => setState(() {
    bool isDoCalculate    = false;
    String strValue       = sbValue.toString();
    String lastCharacter  = strValue.substring(strValue.length - 1);

    if (str == "0" &&
            (lastCharacter == "/" ||
                lastCharacter == "x" ||
                lastCharacter == "-" ||
                lastCharacter == "+")) {
          return;
        } else if (str == "0" && sbValue.toString() == "0") {
          return;
        } else if (str == "=") {
          isDoCalculate = true;
        } else if (str == "/" || str == "x" || str == "-" || str == "+") {
          if (operator.isEmpty) {
            operator = str;
          } else {
            isDoCalculate = true;
          }
        }

        if (!isDoCalculate) {
          if (sbValue.toString() == "0" && str != "0") {
            sbValue.clear();
          }
          sbValue.write(str);
        } else {
          List<String> values = sbValue.toString().split(operator);
          if (values.length == 2 &&
              values[0].isNotEmpty &&
              values[1].isNotEmpty) {
            valueA = int.parse(values[0]);
            valueB = int.parse(values[1]);
            sbValue.clear();
            int total = 0;
            switch (operator) {
              case "/":
                total = valueA ~/ valueB;
                break;
              case "x":
                total = valueA * valueB;
                break;
              case "-":
                total = valueA - valueB;
                break;
              case "+":
                total = valueA + valueB;
            }
            sbValue.write(total);
            if (str == "/" || str == "x" || str == "-" || str == "+") {
              operator = str;
              sbValue.write(str);
            } else {
              operator = "";
            }
          } else {
            String strValue = sbValue.toString();
            String lastCharacter = strValue.substring(strValue.length - 1);
            if (str == "/" || str == "x" || str == "-" || str == "+") {
              operator = "";
              sbValue.clear();
              sbValue
                  .write(strValue.substring(0, strValue.length - 1) + "" + str);
              operator = str;
            } else if (str == "=" &&
                (lastCharacter == "/" ||
                    lastCharacter == "x" ||
                    lastCharacter == "-" ||
                    lastCharacter == "+")) {
              operator = "";
              sbValue.clear();
              sbValue.write(strValue.substring(0, strValue.length - 1));
            }
          }
        }
  });

  void clearValue() => setState(() {
    operator = "";
    sbValue.clear();
    sbValue.write("0");
  });

  void deleteValue() => setState(() {
    String strValue = sbValue.toString();
    if (strValue.length > 0) {
      String lastCharacter = strValue.substring(strValue.length - 1);
      if (lastCharacter == "/" ||
          lastCharacter == "x" ||
          lastCharacter == "-" ||
          lastCharacter == "+") {
        operator = "";
      }
      strValue = strValue.substring(0, strValue.length - 1);
      sbValue.clear();
      sbValue.write(strValue.length == 0 ? "0" : strValue);
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            "Basic Calculator",
          ),
          backgroundColor: Colors.black,
        ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Text(
                    sbValue.toString(),
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                      ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('/'),
                          onPressed: (){
                            appendValue("/");
                          },
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('C'),
                          onPressed: (){
                            clearValue();
                          },
                        ),
                      ),
                      
                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Icon(Icons.backspace_outlined ,size: 20,),
                          onPressed: (){
                            deleteValue();
                          },
                        ),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('7'),
                          onPressed: (){
                            appendValue("7");
                          },
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('8'),
                          onPressed: (){
                            appendValue("8");
                          },
                        ),
                      ),
                      
                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('9'),
                          onPressed: (){
                            appendValue("9");
                          },
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('*'),
                          onPressed: (){
                            appendValue("x");
                          },
                        ),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('4'),
                          onPressed: (){
                            appendValue("4");
                          },
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('5'),
                          onPressed: (){
                            appendValue("5");
                          },
                        ),
                      ),
                      
                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('6'),
                          onPressed: (){
                            appendValue("6");
                          },
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('-'),
                          onPressed: (){
                            appendValue("-");
                          },
                        ),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('1'),
                          onPressed: (){
                            appendValue("1");
                          },
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('2'),
                          onPressed: (){
                            appendValue("2");
                          },
                        ),
                      ),
                      
                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('3'),
                          onPressed: (){
                            appendValue("3");
                          },
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('+'),
                          onPressed: (){
                            appendValue("+");
                          },
                        ),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('0'),
                          onPressed: (){
                            appendValue("0");
                          },
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(primary: Colors.blueGrey,),
                          child: Text('='),
                          onPressed: (){
                            appendValue("=");
                          },
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
