import 'package:wallpaper_hub/models/category_model.dart';

String apiKey = '563492ad6f9170000100000135fc83f000da4c48b443b2a9765c7857';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  CategoryModel category = CategoryModel();
  //1
  category.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.category = "Street Art";
  categories.add(category);
  category = new CategoryModel();

  //2
  category.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.category = "Wild Life";
  categories.add(category);
  category = new CategoryModel();

  //3
  category.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.category = "Nature";
  categories.add(category);
  category = new CategoryModel();

  //4
  category.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.category = "City";
  categories.add(category);
  category = new CategoryModel();

  //5
  category.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  category.category = "Motivation";

  categories.add(category);
  category = new CategoryModel();

  //6
  category.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.category = "Bikes";
  categories.add(category);
  category = new CategoryModel();

  //7
  category.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.category = "Cars";
  categories.add(category);
  category = new CategoryModel();

  return categories;
}
