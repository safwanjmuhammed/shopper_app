import 'package:flutter/material.dart';

class HomeColors {
  static const Color primary = Color(0xFF6C5CE7);
  static const Color background = Color(0xFFFAF8F8);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color priceColor = Color(0xFF2D3436);
  static const Color iconColor = Color(0xFF636E72);
  static const Color heartIcon = Color(0xFFDFE6E9);
  static const Color saleTag = Color(0xFFFFB8D1);
  static const Color linkColor = Color(0xFF6C5CE7);
  static const Color purpleLight = Color(0xFFE2DFF5);
  static const Color purpleDark = Color(0xFF3F0E60);
  static const Color bluePrice = Color(0xFF3B71E8);
  static const Color pinkTag = Color(0xFFF79CB2);
  static const Color tabSelected = Color(0xFFF0F1FF);
  static const Color productDetailBackground = Color(0xFFF8F8F8);
}

class HomeProduct {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final bool isSale;

  HomeProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.isSale = false,
  });
}

List<HomeProduct> getHomeProducts() {
  return [
    HomeProduct(
      id: '1',
      name: 'Sony WH-1000XM4',
      description: 'Wireless Industry Leading Noise Cancelling Headphones',
      price: 299.99,
      image: '🎧',
      isSale: false,
    ),
    HomeProduct(
      id: '2',
      name: 'Beats Studio3',
      description: 'Wireless Noise Cancelling Over-Ear Headphones',
      price: 241.69,
      image: '🎧',
      isSale: false,
    ),
    HomeProduct(
      id: '3',
      name: 'Galaxy S21 Ultra',
      description: 'Wireless Industry Leading Noise Cancelling Headphones',
      price: 599.99,
      image: '📱',
      isSale: false,
    ),
    HomeProduct(
      id: '4',
      name: 'Super Fast USB C',
      description: 'Charge 45 Compatible. Samsung 15W Fast / 25 USB Cable',
      price: 39.99,
      image: '🔌',
      isSale: false,
    ),
    HomeProduct(
      id: '5',
      name: 'AirPods Pro',
      description: 'Active Noise Cancellation for immersive sound',
      price: 249.99,
      image: '🎧',
      isSale: true,
    ),
    HomeProduct(
      id: '6',
      name: 'iPhone 13 Pro',
      description: 'Pro camera system, Super Retina XDR display',
      price: 999.99,
      image: '📱',
      isSale: false,
    ),
  ];
}
