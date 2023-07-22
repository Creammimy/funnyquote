import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'ขอบคุณไขมัน ที่ทำให้เธอมีชั้นตลอดเวลา',
    'ถึงหน้าจะไม่หวาน แต่น้ำตาลในเลือดสูงนะ',
    'กรรม ที่เกิดจากการกิน เรียกว่า กิโลกรรม',
    'ที่เราตัวหนัก เพราะเราน่ารักไม่เบาไง',
    'กลางแดดมีแต่เงา กลางใจเรามีแต่ของกิน',
    'จีบเธอก็เป็นทุกข์ จิบชาไข่มุกก็เป็นเบาหวาน',

  ];
  var quote = quoteList[0]; // state variable
  var indexquote = 0;
  static const List<Color> colorlist = [
    Colors.black,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.purple,
  ];
  var colors = colorlist[0];
  var indexcolor = 0;

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      var randomcolor = rand.nextInt(colorlist.length);
      if(randomIndex == indexquote && randomIndex<quoteList.length){
        randomIndex == randomIndex+1;
      }
      if(randomcolor == indexcolor && randomcolor<colorlist.length){
        randomcolor == randomcolor+1;
      }
      quote = quoteList[randomIndex];
      colors =colorlist[randomcolor];
      indexquote = randomIndex;
      indexcolor = randomcolor;
    });
  }
             
             

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote, 
            style: TextStyle(
              color: colors,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
