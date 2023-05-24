class Game {
  final int estrellas;
  final String descripcion;
  final String imagen;
  final String titulo;
  final String id;

  Game({
    required this.estrellas,
    required this.descripcion,
    required this.imagen,
    required this.titulo,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'estrellas': estrellas,
      'descripcion': descripcion,
      'imagen': imagen,
      'titulo': titulo,
      'id': id,
    };
  }

  static Game fromMap(Map<String, dynamic> map) {
    return Game(
        estrellas: map['estrellas'],
        descripcion: map['descripcion'],
        imagen: map['imagen'],
        titulo: map['titulo'],
        id: map['id']);
  }
}
