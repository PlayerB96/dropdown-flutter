class CompanyResponse {
  List<Company> getCompanys({required dynamic data}) {
    List<Company> employees = getCompanys().getData(data: data);
    return employees;
  }
}