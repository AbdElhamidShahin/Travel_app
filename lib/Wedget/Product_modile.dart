class DataModel {
  final String? name;
  final String? img;
  final double price;
  final String? people;
  final String? starts;
  final String? discription;
  final String? location;
  bool isFavorite; // حقل جديد لتمثيل حالة الإعجاب

  DataModel( {
    required  this.price,
    this.name,
    this.img,
    this.people,
    this.starts,
    this.discription,
    this.location,
    required this.isFavorite,
  });

  @override
  String toString() {
    return 'DataModel(name: $name, img: $img, price: $price, people: $people, starts: $starts, discription: $discription, location: $location)';
  }
}
