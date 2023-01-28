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
    List<double> lista = json['probabilità'];
    return NaiveBayesianResult(classe, lista);
  }
}