class Product {
  int id;
  String title;
  String description;
  String image;
  double rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'rating': rating,
      };
}
