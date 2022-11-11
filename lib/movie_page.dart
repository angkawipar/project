import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/movie.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  const MoviePage({Key? key,required this.movie}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ซื้อตั๋ว'),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'asset/image/${widget.movie.imageUrl}', width: 200,),
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
  /*var iconic = Icon(color: Colors.red.shade600,
      size: 20,
      Icons.event_seat_rounded);

   */

  Widget _buildBottonPanel() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(var i = 1; i <= 6; i++)_buildButton(i),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(var i = 1; i <= 6; i++)_buildButton(i),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(var i = 1; i <= 6; i++)_buildButton(i),
          ],
        ),
      ],
    );
  }
  Widget child=Icon(color: Colors.deepPurpleAccent,
      size: 20,
      Icons.add);
  Widget _buildButton(int num) {
    return InkWell(
      onTap: () {
      setState(() {
          child = Icon(color: Colors.deepPurpleAccent,
              size: 20,
              Icons.ac_unit);
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
        child: child
      ),
    );
  }
}
