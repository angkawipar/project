import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ซื้อตั๋ว'),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('asset/image/${widget.movie.imageUrl}',width: 200,),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, //สีพื้นหลังของ Container
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: _buildBottonPanel(),

            )
          ],
        ),
      ),
    );
  }
}

Widget _buildBottonPanel() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('O'),
          for(var i=1;i<=6;i++)_buildButton(i), //ลากคลุม reflagter สร้างเมธอด
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(var i=1;i<=6;i++)_buildButton(i),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(var i=7;i<=9;i++)_buildButton(i),
        ],
      ),
    ],
  );
}

Widget _buildButton(int num) { //วางเคอเซ่อที่ชื่อเมธอดกดหลอดไฟ convert block body
  var iconic=Icon(color: Colors.red.shade600,
      size: 20,
      Icons.event_seat_rounded);
  var _showTestBotton = false;

  return InkWell(
    onTap: (){
      setState(() {
        _showTestBotton = false;
      });

    },
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      /*child: ElevatedButton(
          onPressed: (){},
          child: Icon(color: Colors.red.shade600,size: 20,Icons.favorite,),
          style: OutlinedButton.styleFrom(
            //ปุ่ม
              backgroundColor: Colors.white),
        )
         */
      child: Icon(color: Colors.pink,
          _showTestBotton ? Icons.event_seat_rounded :Icons.icecream_sharp ),
    ),
  );

}
