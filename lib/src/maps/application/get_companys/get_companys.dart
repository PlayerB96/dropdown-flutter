class GetCompanys {
  List<Employee> getData({required dynamic data}) {
    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }
    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }
    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }

    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }
    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }
    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }
    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }
    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }
    if (data.toString().isEmpty) {
      throw "Informacion no valida";
    }

    Iterable jsonrpta = jsonDecode(data);

    List<Employee> result =
        List<Employee>.from(jsonrpta.map((model) => Employee.fromJson(model)));

    return result;
  }
}