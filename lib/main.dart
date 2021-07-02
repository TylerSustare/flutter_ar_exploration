import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:arkit_plugin/arkit_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ARKitController _arKitController;

  @override
  void dispose() {
    super.dispose();

    _arKitController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: ARKitSceneView(
            onARKitViewCreated: createARView,
          ),
        ),
      );

  void createARView(ARKitController arKitController) {
    this._arKitController = arKitController;

    this._arKitController.add(createARText());
  }

  createARText() {
    final txt = ARKitText(
      text: "Honey Bunny <3",
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty(color: Colors.blue),
        ),
      ],
    );

    return ARKitNode(
      geometry: txt,
      position: vector.Vector3(-0.3, 0.3, -1.4),
      scale: vector.Vector3(0.02, 0.02, 0.02),
    );
  }
}
