import 'package:flutter/material.dart';

class Foods {
  final String title;
  final String href;
  final String ingredients;
  final String thumbnail;

  Foods({
    @required this.title,
    @required this.href,
    @required this.ingredients,
    @required this.thumbnail,
  });

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        title: json["title"],
        href: json["href"],
        ingredients: json["ingredients"],
        thumbnail: json["thumbnail"],
      );

  // Map<String, dynamic> toJson() => {
  //       "title": title,
  //       "href": href,
  //       "ingredients": ingredients,
  //       "thumbnail": thumbnail,
  //     };
}
