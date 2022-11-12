import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/movie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/ticket.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  const MoviePage({Key? key,required this.movie}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var _ticket;
  @override
  void initState() { //เชื่อมกับเกม
    super.initState();
    _ticket = Ticket() ;
  }

  final _iconStateList = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ];
  final _iconSuccess = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('จองตั๋ว'),),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black, //สีพื้นหลังของ Container
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'asset/image/${widget.movie.imageUrl}', width: 200,),
              ),
              Text(widget.movie.name,
                style:GoogleFonts.playfairDisplaySc(
                    fontSize: 32.0,color: Color(0xFFFFFFFF)),
              ),
              Expanded(
                  child: _buildSeats(),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(onPressed: (){
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('SUCCESS'),
                            content:
                            Text(_ticket.seatsTicket(_iconStateList)),
                            actions: <Widget>[
                              ElevatedButton(onPressed: (){
                                /*var num = _ticket.success(_iconStateList);
                                for(int i=1;i<113;i++){
                                  if(num!=-1){
                                    if(num!=0){
                                      setState(() {
                                        _iconSuccess[num]=1;
                                      });
                                    }
                                  }
                                } */
                                Navigator.pop(context, 'OK');
                              },
                                  child: Text('OK'))

                            ],
                          ));
                    }, child: Text('ยืนยัน')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  /*var iconic = Icon(color: Colors.red.shade600,
      size: 20,
      Icons.event_seat_rounded);

   */

  Widget _buildSeats() {
    return Column(
      children: [
        _seatsRow(1,16),
        _seatsRow(17,32),
        _seatsRow(33,48),
        _seatsRow(49,64),
        _seatsRow(65,80),
        _seatsRow(81,96),
        _seatsRow(97,112),
      ],
    );
  }

  Row _seatsRow(int start,int stop) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = start ; i <=  stop; i++)
             _buildIcon(i),
        ]
    );

  }

  Widget _buildIcon(int index) {
      return _iconStateList[index] == 0
          ? InkWell(
          onTap: () {
            setState(() {
              _iconStateList[index] = 1;
            });
          },
          child:  Icon(
              color: Colors.red,
              size: 20,
              Icons.event_seat_rounded
          )
      )
          : InkWell(
          onTap: () {
            setState(() {
              _iconStateList[index] = 0;
            });
          },
          child:  Icon(
              color: Colors.amberAccent,
              size: 20,
              Icons.check_circle
          )
      );
  }
}
