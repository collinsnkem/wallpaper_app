import 'package:wallpaper_app/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001ad59e4cdef6d4024b20492d1244b959f";

List<CategoriesModel> getCategories(){

  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/38630/bodybuilder-weight-training-stress-38630.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Super Heroes";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/2931943/pexels-photo-2931943.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/867462/pexels-photo-867462.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Love";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/673862/pexels-photo-673862.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Violence";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/4261260/pexels-photo-4261260.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Stay Safe";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;

  
}