class Arbre {
  String id;
  String nom;
  String varietat;
  String tipus;
  bool autocton;
  String foto;
  String detall;

  Arbre({required this.id, required this.nom, required this.varietat, required this.tipus, required this.autocton, required this.foto, required this.detall});

  factory Arbre.fromMap(Map<String, dynamic> data, String id) {
    return Arbre(
      id: id,
      nom: data['nom'] ?? '',
      varietat: data['varietat'] ?? '',
      tipus: data['tipus'] ?? '',
      autocton: data['autocton'] ?? false,
      foto: data['foto'] ?? '',
      detall: data['detall'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'varietat': varietat,
      'tipus': tipus,
      'autocton': autocton,
      'foto': foto,
      'detall': detall,
    };
  }
}
