class ViaCep {
  String logradouro = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  String cep = "";
  ViaCep(String? cep, Map<String, dynamic> endereco){
    this.cep = cep ?? "";
    logradouro = endereco["logradouro"] ?? "";
    bairro = endereco["bairro"] ?? "";
    localidade = endereco["localidade"] ?? "";
    uf = endereco["uf"] ?? "";
  }

  mostrarEndereco(){
    if(logradouro == "") return "";
    return 'Cep: $cep \n Logradouro: $logradouro \n Bairro: $bairro \n Cidade: $localidade \n Estado: $uf';
  }
}