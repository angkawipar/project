class Ticket {
  var buy=[];

  Ticket(){
  }

  String seatsTicket(List<int> buy){
    var num='';
    var check=false;
    for(int i=1;i<113;i++){
      if(buy[i]==1){
        print('checkkk');
        if(i>=1&&i<=16) {
          num += ('A' + i.toString() +' ');
        }else if(i>=17&&i<=32){
          num += ('B' + (i-16).toString()+' ');
        }else if(i>=33&&i<=48){
          num += ('C' + (i-32).toString()+' ');
        }else if(i>=49&&i<=64){
          num += ('D' + (i-48).toString()+' ');
        }else if(i>=65&&i<=80){
          num += ('E' + (i-64).toString()+' ');
        }else if(i>=81&&i<=96){
          num += ('F' + (i-80).toString()+' ');
        }else if(i>=97&&i<=112){
          num += ('G' + (i-96).toString()+' ');
        }

        check=true;
      }
    }
    if(check){
      return 'Your Ticket is '+num;
    }else{
      num='Please choose';
      return num;
    }
  }
}