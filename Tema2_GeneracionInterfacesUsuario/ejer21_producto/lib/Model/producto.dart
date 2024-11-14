class Product {
  // ATRIBUTOS
  String _productName;
  String _description;

  // CONSTRUCTOR
  Product(this._productName, this._description);

  // GETTERS Y SETTERS
  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }
} // CLASE PRODUCTO