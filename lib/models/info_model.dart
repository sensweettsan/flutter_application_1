class InfoModel {
  int id;
  String nome;
  String imagem;
  String especie;
  String descricao;

  InfoModel(
    this.id,
    this.nome,
    this.imagem,
    this.especie,
    this.descricao,
  );

  factory InfoModel.fromJson(dynamic json) {
    return InfoModel(
        json['id'] as int,
        json['attributes']['nome'] as String,
        json['attributes']['img']['data']['attributes']['formats']['thumbnail']
            ['url'],
        json['attributes']['especie'] as String,
        json['attributes']['descricao'] as String);
  }
}
