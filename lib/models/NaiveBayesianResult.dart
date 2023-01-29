class NaiveBayesianResult{
  double _classe;
  List<double> _prob;

  NaiveBayesianResult(this._classe,this._prob);

  double getClasse(){
    return _classe;
  }

  List<double> getProb(){
    return _prob;
  }

  factory NaiveBayesianResult.fromJson(Map<String, dynamic> json){
    double classe = json['classe'];
    List<dynamic> aux = json['probabilita'];
    List<double> lista = [];
    for(int i = 0; i<aux.length; i++)
      lista.add(aux[i]);
    return NaiveBayesianResult(classe, lista);
  }
}