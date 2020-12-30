class SeatingBlock{
  int column;
  int row;
  List<String> bookedSeats;
  List<String> seats;

  SeatingBlock.empty();

  SeatingBlock(int row, int column, List<String> booked){
    //assumptions: 
    // * The Maximum row is less than 26 ( Z ) 

    final _alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    List<String> _seats = [];

    this.column = column + 1; // we add one row for column label
    this.row = row + 1; // we add one row for label
    this.bookedSeats = booked;

    // Create the seathing arrengment
    for (var i = 0; i < this.row; i++) {
       for (var j = 0; j < this.column; j++) {
         if(i == this.row - 1 && j == 0){
           _seats.add("e");
         }
         else if(j == 0){
           _seats.add("i_${_alpha[this.row - i - 2 ]}");
         }
         else if(i == this.row - 1){
           _seats.add("j_$j");
         }
         else{
          _seats.add("${_alpha[this.row - i - 2 ]}$j");
         }
       }
    }
    
    this.seats = _seats;

  }


}