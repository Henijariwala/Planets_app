class Planet {
  String? position;
  String? name;
  String? image;
  String? velocity;
  String? distance;
  String? description;

  Planet({
    this.position,
    this.name,
    this.image,
    this.velocity,
    this.distance,
    this.description,
  });

  factory Planet.mapToModel(Map m1){
    return Planet(
      image: m1['image'],
      name: m1['name'],
      description: m1['description'],
      distance: m1['distance'],
      position: m1['position'],
      velocity: m1['velocity']
    );
  }
}