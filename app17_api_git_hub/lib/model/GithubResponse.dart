class GithubResponse {
  int id = 0;
  String name = "";
  int publicRepos = 0;
  String createdAt = "";
  int followers = 0;
  int following = 0;
  GithubResponse(Map<String, dynamic> response){
    id = response["id"];
    name = response["name"];
    publicRepos = response["public_repos"];
    createdAt = response["created_at"];
    followers = response["followers"];
    following = response["following"];
  }

  showData(){
    return "Id: $id\nNome: $name\nRepositorios: $publicRepos\nCriado em: $createdAt\nSeguidores: $followers\nSeguindo: $following";
  }
}