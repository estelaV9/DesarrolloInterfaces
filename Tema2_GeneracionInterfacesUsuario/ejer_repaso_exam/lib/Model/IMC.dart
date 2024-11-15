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

  double calcularImc(Imc imc) {
    return (imc.kilos / (imc.metros * imc.metros));
  } // CALCULAR EL IMC PASADO

  String informacionImc(double imc) {
    if (imc < 18.5) {
      return "Peso inferior al normal";
    } else if (imc >= 18.5 && imc <= 24.9) {
      return "Peso normal";
    } else if (imc >= 25 && imc <= 29.9) {
      return "peso superior al normal";
    } else {
      return "sobrepeso";
    }
  } // METODO PARA MOSTRAR UN MENSAJE DEPENDIENDO EL IMC CALCULADO
}