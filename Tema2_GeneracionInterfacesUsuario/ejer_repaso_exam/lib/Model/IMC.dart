class Imc {
  int _kilos;
  double _metros;

  Imc(this._kilos, this._metros);

  double get metros => _metros;

  set metros(double value) {
    _metros = value;
  }

  int get kilos => _kilos;

  set kilos(int value) {
    _kilos = value;
  }
}