class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final String desorption;
  final double price;
  final bool isFavorite;
  final String category;
  final double averageRate;
  final int qantity;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.desorption =
        'Lorem ipsum is simply dummy text in the printing typestates',
    required this.price,
    this.isFavorite = false,
    required this.category,
    this.averageRate = 4.5,
    this.qantity = 1,
  });

  // Implementing the copyWith method
  ProductItemModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    String? desorption,
    double? price,
    bool? isFavorite,
    String? category,
    double? averageRate,
    int? qantity,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      desorption: desorption ?? this.desorption,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      averageRate: averageRate ?? this.averageRate,
      qantity: qantity ?? this.qantity,
    );
  }
}

List<ProductItemModel> dummyPrudactIs = [
  ProductItemModel(
    id: 'K434118okA3XH70vmCgI',
    name: 'Black Shoes',
    imgUrl: 'https://pngimg.com/d/men_shoes_PNG7475.png',
    price: 20,
    category: 'Shoes',
  ),
  ProductItemModel(
    id: '3p6nOiAbCwlKNZkme7t2',
    name: 'Trousers',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2016/09/Trouser-Free-Download-PNG.png',
    price: 30,
    category: 'Clothes',
  ),
  // Add the other products as necessary...
];
