import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  int mIndex = 0;
  String selectedIndexUrl = 'https://picsum.photos/200/300?random=70';
  List<Model> imageList = [
    Model(
        imageUrl:
            'https://picsum.photos/200/300?random=110'),
    Model(
        imageUrl:
        'https://picsum.photos/200/300?random=120'),
    Model(
        imageUrl:
            'https://picsum.photos/200/300?random=140'),
    Model(
        imageUrl:
        'https://picsum.photos/200/300?random=101'),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
                    imageProvider: NetworkImage(widget.selectedIndexUrl)),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: widget.imageList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      widget.mIndex = index;
                      return GestureDetector(
                        onTap: () {
                          debugPrint(index.toString());
                          widget.selectedIndexUrl =
                              widget.imageList[index].imageUrl;
                          debugPrint(widget.imageList[index].imageUrl);
                          debugPrint(widget.selectedIndexUrl);
                          setState((){});

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.network(
                            widget.imageList[index].imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

class Model {
  final String imageUrl;

  Model({required this.imageUrl});
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
