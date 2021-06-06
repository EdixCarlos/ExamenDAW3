import 'package:apirest/models/foods.dart';
import 'package:apirest/models/photos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apirest/provider/photos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({key, @required this.title}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({key, @required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}

class FoodsList extends StatelessWidget {
  final List<Foods> foods;
  const FoodsList({Key key, this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Image.network(foods[index].thumbnail);
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   final String title;

//   MyHomePage({key, @required this.title}) : super(key: key);

//   @override
//   Widget build(context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: FutureBuilder<List<Photo>>(
//         future: fetchPhotos(http.Client()),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//               ? PhotosList(photos: snapshot.data)
//               : Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
