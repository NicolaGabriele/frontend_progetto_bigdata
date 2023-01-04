class CoppiaHotelNumRecensioni{
  String _hotel;
  int _numRecensioni;

  CoppiaHotelNumRecensioni(this._hotel, this._numRecensioni);

  String getHotel(){
    return _hotel;
  }

  int getNumRecensioni(){
    return _numRecensioni;
  }

  factory CoppiaHotelNumRecensioni.fromJson(Map<String,dynamic> json)=>
      CoppiaHotelNumRecensioni(json['hotel'], int.parse(json['numRecensioni']));
}