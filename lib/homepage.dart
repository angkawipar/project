import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/movie.dart';

import 'movie_page.dart';

var movieList = [
  Movie(name: 'Black Panther', imageUrl: 'black.jpg'),
  Movie(name: 'OMG รักจังวะ..ผิดจังหวะ', imageUrl: 'love.jpg'),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset('asset/image/logo2.png',width: 50,),
                Text('Movie',
                  style: GoogleFonts.playfairDisplaySc(fontSize: 32.0,color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ),

          Expanded(
            child: Stack(
              children:[ ListView.builder(
                  itemBuilder: (BuildContext context,int i){
                    var movie = movieList[i];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset('asset/image/${movie.imageUrl}',width: 100,),
                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(movie.name),
                                  Text('${movie.seats} ที่นั่ง'),
                                ],
                              ),
                            ),//ถ้าใส่ Expanded 2 อันจะยืดแบบแบ่งคนละครึ่ง
                            ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MoviePage(movie: movie)),
                              );
                            }, child: Text('ซื้อตั๋ว'),
                              style: OutlinedButton.styleFrom(
                                //ปุ่ม
                                  backgroundColor: Colors.red.shade600),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: movieList.length),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
