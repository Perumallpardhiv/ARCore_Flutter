import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class arScreenView extends StatefulWidget {
  const arScreenView({super.key});

  @override
  State<arScreenView> createState() => _arScreenViewState();
}

class _arScreenViewState extends State<arScreenView> {
  late ArCoreController arCorecontroller;

  _onArCoreViewCreated(ArCoreController controller) {
    arCorecontroller = controller;
    _addSphere(arCorecontroller);
  }

  _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(color: Colors.blue);
    final sphere = ArCoreSphere(materials: [material], radius: 0.24);
    final node = ArCoreNode(shape: sphere, position: vector.Vector3(0, 0, -1));
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCorecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter AR"),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }
}
