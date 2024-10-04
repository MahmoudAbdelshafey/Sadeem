import 'package:flutter/material.dart';
import 'package:sadeem_application/features/ai/sections/chat.dart';
import 'package:sadeem_application/features/ai/sections/stream.dart';
import 'package:sadeem_application/features/ai/sections/text_and_image.dart';

class SectionItem {
  final int index;
  final String title;
  final Widget widget;

  SectionItem(this.index, this.title, this.widget);
}

class MemoScree extends StatefulWidget {
  const MemoScree({super.key});

  @override
  State<MemoScree> createState() => _MemoScreeState();
}

class _MemoScreeState extends State<MemoScree> {
  int _selectedItem = 0;

  final _sections = <SectionItem>[
    SectionItem(0, 'Mawdo3 Sare3', const SectionTextStreamInput()),
    SectionItem(1, 'Es2l Memo', const SectionTextAndImageInput()),
    SectionItem(2, 'chat M3 Memo', const SectionChat()),
    // SectionItem(3, 'Stream chat', const SectionStreamChat()),
    // SectionItem(4, 'text', const SectionTextInput()),
    // SectionItem(5, 'embedContent', const SectionEmbedContent()),
    // SectionItem(6, 'batchEmbedContents', const SectionBatchEmbedContents()),
    // SectionItem(
    //     7, 'response without setState()', const ResponseWidgetSection()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Memo Assistant'),
        actions: [
          PopupMenuButton<int>(
            initialValue: _selectedItem,
            onSelected: (value) => setState(() => _selectedItem = value),
            itemBuilder: (context) => _sections.map((e) {
              return PopupMenuItem<int>(value: e.index, child: Text(e.title));
            }).toList(),
            child: const Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedItem,

        children: _sections.map((e) => e.widget).toList(),
      ),
    );
  }
}
