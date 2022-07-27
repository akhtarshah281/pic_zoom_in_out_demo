import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image zoom in out Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

/// PhotoView
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image image;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pic Zoom In Out Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PhotoView(
                    backgroundDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    imageProvider: NetworkImage(
                        'https://i.insider.com/5c1c90f8e04d6243c7019cf6?width=2000&format=jpeg&auto=webp')),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.network(
                      'https://picsum.photos/200',
                      fit: BoxFit.fill,
                    ),
                  );
                }),
              )
            ],
          ),
        )
    );
  }
}

/// PinchZoomImage
/// /// Issue with PinchZoomImage : 'come to defaults after leaving the screen touch'
// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   // final _transformationController = TransformationController();
//   // late TapDownDetails _doubleTapDetails;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: Text('Pic Zoom In Out Demo'),
//       ),
//       body: PinchZoomImage(
//         image: Image.network('https://i.imgur.com/tKg0XEb.jpg'),
//         zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
//         hideStatusBarWhileZooming: true,
//         onZoomStart: () {
//           print('Zoom started');
//         },
//       ),
//     );
//   }
// }

/// interactive viewer
// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   final _transformationController = TransformationController();
//   late TapDownDetails _doubleTapDetails;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: Text('Pic Zoom In Out Demo'),
//       ),
//       body: GestureDetector(
//         onDoubleTapDown: _handleDoubleTapDown,
//         onDoubleTap: _handleDoubleTap,
//         child: Center(
//           child: InteractiveViewer(
//             clipBehavior: Clip.none,
//             boundaryMargin: EdgeInsets.all(0),
//             minScale: 1.0,
//             maxScale: 4.2,
//             transformationController: _transformationController,
//             child: Image.network('https://picsum.photos/300'),
//             /* ... */
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _handleDoubleTapDown(TapDownDetails details) {
//     _doubleTapDetails = details;
//   }
//
//   void _handleDoubleTap() {
//     if (_transformationController.value != Matrix4.identity()) {
//       _transformationController.value = Matrix4.identity();
//     } else {
//       final position = _doubleTapDetails.localPosition;
//       // For a 3x zoom
//       _transformationController.value = Matrix4.identity()
//         ..translate(-position.dx * 2, -position.dy * 2)
//         ..scale(3.0);
//       // Fox a 2x zoom
//       // ..translate(-position.dx, -position.dy)
//       // ..scale(2.0);
//     }
//   }
// }
