import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../../generated/assets.dart';

class ArHome extends StatelessWidget {
  const ArHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: Column(children: [
          Expanded(
            child: arMode(),
          ),
        ]),

    );
  }
}
class arMode extends StatelessWidget {
  const arMode({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModelViewer(
          backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src: Assets.threMoon,

          alt: 'A 3D model of an astronaut',
          ar: true,

          autoRotate: true,
          iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          disableZoom: true,


    );
  }
}
