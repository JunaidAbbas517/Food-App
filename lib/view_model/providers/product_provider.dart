import 'package:flutter/material.dart';

import '../../model/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> fastFood = [
    ProductModel(
      id: 'f1',
      name: 'Burger',
      price: 20,
      description:
          'jfhasdjkfhasfjkhsdjfhsdafjsdhfjasdhfjksfhsdjkfhasdjkfhasdjkfhasdjkfhsdfjksdhfjksdhfjksdfhsdjkfhsdjkfhsdjkfhsdjkfsdhfThe combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Meal',
      imageUrl:
          'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    ProductModel(
      id: 'f2',
      name: 'Pizza',
      price: 30,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Meal',
      imageUrl:
          'https://images.pexels.com/photos/3682837/pexels-photo-3682837.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    ProductModel(
      id: 'f3',
      name: 'Burger',
      price: 20,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Meal',
      imageUrl:
          'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    ProductModel(
      id: 'f4',
      name: 'Burger',
      price: 20,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Meal',
      imageUrl:
          'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
  ];
  final List<ProductModel> traditionalFood = [
    ProductModel(
      id: '1',
      name: 'Dumplings',
      price: 2.4,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Food',
      imageUrl:
          'https://images.unsplash.com/photo-1543738066-49621e5b1f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHRyYWRpdGlvbmFsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    ProductModel(
      id: '1',
      name: 'Dumplings',
      price: 2.2,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Food',
      imageUrl:
          'https://images.unsplash.com/photo-1543738066-49621e5b1f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHRyYWRpdGlvbmFsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    ProductModel(
      id: '1',
      name: 'Dumplings',
      price: 4.3,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Food',
      imageUrl:
          'https://images.unsplash.com/photo-1543738066-49621e5b1f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHRyYWRpdGlvbmFsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
  ];
  final List<ProductModel> localFood = [
    ProductModel(
      id: '1',
      name: 'Dumplings',
      price: 2.3,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Food',
      imageUrl:
          'https://images.unsplash.com/photo-1543738066-49621e5b1f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHRyYWRpdGlvbmFsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    ProductModel(
      id: '1',
      name: 'Dumplings',
      price: 2.3,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Food',
      imageUrl:
          'https://images.unsplash.com/photo-1543738066-49621e5b1f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHRyYWRpdGlvbmFsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    ProductModel(
      id: '1',
      name: 'Dumplings',
      price: 2.3,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Food',
      imageUrl:
          'https://images.unsplash.com/photo-1543738066-49621e5b1f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHRyYWRpdGlvbmFsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    ProductModel(
      id: '1',
      name: 'Dumplings',
      price: 2.3,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Food',
      imageUrl:
          'https://images.unsplash.com/photo-1543738066-49621e5b1f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHRyYWRpdGlvbmFsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
  ];
  final List<ProductModel> specialOrder = [
    ProductModel(
      id: 'f1',
      name: 'Burger',
      price: 20,
      description:
          'jfhasdjkfhasfjkhsdjfhsdafjsdhfjasdhfjksfhsdjkfhasdjkfhasdjkfhasdjkfhsdfjksdhfjksdhfjksdfhsdjkfhsdjkfhsdjkfhsdjkfsdhfThe combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Meal',
      imageUrl:
          'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    ProductModel(
      id: 'f2',
      name: 'Pizza',
      price: 30,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Meal',
      imageUrl:
          'https://images.pexels.com/photos/3682837/pexels-photo-3682837.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    ProductModel(
      id: 'f3',
      name: 'Burger',
      price: 20,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Meal',
      imageUrl:
          'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    ProductModel(
      id: 'f4',
      name: 'Burger',
      price: 20,
      description:
          'The combination of burger patties with 2 layers of savory meat and 2 layers of cheese served with tomato sauce, pickles, chopped onions and mustar of burger patties with',
      mealReview: 'Nice Meal',
      imageUrl:
          'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
  ];
}
