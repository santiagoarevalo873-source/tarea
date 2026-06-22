void main() {
  List<Vehiculo> vehiculos = [];

  Carro carro1 = new Carro('Mazda', '323', 2012, 4);
  carro1.setEstado('activo');

  Carro carro2 = new Carro('Toyota', 'corolla', 2019, 4);
  carro2.setEstado('inactivo');

  Motocicleta moto1 = new Motocicleta('Suzuki', 'A4', 2000, 250);
  moto1.setEstado('activo');

  Motocicleta moto2 = new Motocicleta('Yamaha', 'F2', 2023, 200);
  moto2.setEstado('inactivo');

  vehiculos.add(carro1);
  vehiculos.add(carro2);
  vehiculos.add(moto1);
  vehiculos.add(moto2);

  for (Vehiculo vehiculo in vehiculos) {
    vehiculo.mostrarInfo();
    print('Costo: ${vehiculo.calcularCosto()}');
  }
}

class Vehiculo {
  String? marca;
  String? modelo;
  int? anio;
  String? _estado;

  Vehiculo(String marca, String modelo, {this.anio}) {
    this.marca = marca;
    this.modelo = modelo;
  }

  void setEstado(String estado) {
    this._estado = estado;
  }

  String? getEstado() {
    return this._estado;
  }

  void mostrarInfo() {
    print(
      'Marca: ${this.marca}, Modelo: ${this.modelo}, Año: ${this.anio}, Estado: ${this._estado}',
    );
  }

  double calcularCosto() {
    return 0;
  }
}

class Carro extends Vehiculo {
  int? numeroPuertas;

  Carro(String marca, String modelo, int anio, int numeroPuertas)
    : super(marca, modelo, anio: anio) {
    this.numeroPuertas = numeroPuertas;
  }

  @override
  double calcularCosto() {
    if (getEstado()! == 'inactivo') {
      print('Vehículo no disponible para servicio');
      return 0;
    }
    if (getEstado()! == 'activo') {
      double costoBase = 50.000;
      if (this.numeroPuertas! > 4) {
        costoBase += 20.000;
      } else {
        costoBase += 10.000;
      }
      if ((2026 - anio!) > 10) {
        costoBase += 15.000;
      }
      return costoBase;
    } else {
      return 0;
    }
  }

  bool esFamiliar() {
    if (this.numeroPuertas! > 4) {
      return true;
    } else {
      return false;
    }
  }
}

class Motocicleta extends Vehiculo {
  int? cilindraje;

  Motocicleta(String marca, String modelo, int anio, int cilindraje)
    : super(marca, modelo, anio: anio) {
    this.cilindraje = cilindraje;
  }

  @override
  double calcularCosto() {
    if (getEstado()! == 'inactivo') {
      print('Motocicleta no disponible para servicio');
      return 0;
    }
    if (getEstado()! == 'activo') {
      double costoBase = 30.000;
      if (this.cilindraje! > 200) {
        costoBase += 25.000;
      } else {
        costoBase += 10.000;
      }
      if ((2026 - anio!) > 5) {
        costoBase += 10.000;
      }
      return costoBase;
    } else {
      return 0;
    }
  }

  bool altoCilindraje() {
    if (this.cilindraje! > 200) {
      return true;
    } else {
      return false;
    }
  }
}
