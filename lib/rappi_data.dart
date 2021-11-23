import 'package:flutter/material.dart';

class RappiCategory {
  final String name;
  final List<RappiProduct> products;

  const RappiCategory({
    @required this.name,
    @required this.products,
  });
}

class RappiProduct {
  const RappiProduct({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.image,
  });
  final String name;
  final String description;
  final double price;
  final String image;
}

const rappiCategorties = [
  RappiCategory(
    name: 'cat1',
    products: [
      RappiProduct(
        name: 'prod1',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
      RappiProduct(
        name: 'prod2',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
      RappiProduct(
        name: 'prod3',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat2',
    products: [
      RappiProduct(
        name: 'prod2',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat3',
    products: [
      RappiProduct(
        name: 'prod3',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat4',
    products: [
      RappiProduct(
        name: 'prod4',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat5',
    products: [
      RappiProduct(
        name: 'prod5',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat6',
    products: [
      RappiProduct(
        name: 'prod6',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat7',
    products: [
      RappiProduct(
        name: 'prod7',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat8',
    products: [
      RappiProduct(
        name: 'prod8',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat9',
    products: [
      RappiProduct(
        name: 'prod9',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
  RappiCategory(
    name: 'cat10',
    products: [
      RappiProduct(
        name: 'prod10',
        description: 'this is prod',
        price: 55.55,
        image: 'assets/placeholder.png',
      ),
    ],
  ),
];
