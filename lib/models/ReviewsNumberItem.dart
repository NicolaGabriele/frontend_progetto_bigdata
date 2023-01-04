class ReviewsNumberItem{

  String _numReviews;
  String _indirizzo;
  String _punteggio;
  String _nomeHotel;
  String _latitudine;
  String _longitudine;

  ReviewsNumberItem(this._numReviews, this._indirizzo, this._punteggio, this._latitudine, this._longitudine, this._nomeHotel);

  factory ReviewsNumberItem.fromJson(Map<String,dynamic> json)=>
      ReviewsNumberItem(json['numReviews'], json['indirizzo'],
                        json['punteggio'], json['latitudine'],
                        json['longitudine'], json['nomeHotel']);

  String getNumReviews(){
    return this._numReviews;
  }
  String getIndirizzo(){
    return _indirizzo;
  }
  String getPunteggio(){
    return _punteggio;
  }
  String getNomeHotel(){
    return _nomeHotel;
  }
  String getLatitudine(){
    return _latitudine;
  }
  String getLongitudine(){
    return _longitudine;
  }
}