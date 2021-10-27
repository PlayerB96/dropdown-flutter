class CompanyMYSQL {
  Future<dynamic> getCompany() async {
    //codigo para conectar con la base de datos MYSQL
    dynamic result = '''[
      {
        "nombre":"Abraham",
        "apellido":"Zuniga"
      },
      {
        "nombre":"Gerson",
        "apellido":"Guillermo"
      },
      {
        "nombre":"Bryan",
        "apellido":"Rafael"
      }
    ]''';

    return result;
  }
}