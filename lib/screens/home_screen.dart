// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// enum Fonts {
//   ShadowsIntoLight,
//   Satisfy,
//   NovaSquare,
//   HedvigLettersSerif,
//   Caveat,
//   BlackOpsOne,
// }
class Colorr {
  final int id;
  Color color;

  Colorr({
    required this.id,
    required this.color,
  });
}

class Visibless {
  final int id;
  bool isVisibless;

  Visibless({required this.id, required this.isVisibless});
}

class Textss {
  final int id;
  String text;

  Textss({required this.id, required this.text});
}

class Fontss {
  final int id;
  double fontsizess;

  Fontss({
    required this.id,
    required this.fontsizess,
  });
}

class Familyss {
  final int id;
  String fontFamilyss;

  Familyss({
    required this.id,
    required this.fontFamilyss,
  });
}

class Offsets {
  final int id;
  Offset offset;

  Offsets({
    required this.id,
    required this.offset,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> fonts = [
    'ShadowsIntoLight',
    'Satisfy',
    'NovaSquare',
    'HedvigLettersSerif',
    'Caveat',
    'BlackOpsOne',
  ];
  List<Colorr> colors = [];
  List<Visibless> isVisibles = [];
  List<Textss> texts = [];
  List<Fontss> fontsizess = [];
  List<Familyss> fontFamilysss = [];
  List<Offsets> offsetss = [];
  List<int> ids = [];
  List<int> fontSizes = List.generate(40, (index) => index + 1);
  int fontSize = 20;
  Color blackColor = Colors.black;
  Color whiteColor = Colors.white;
  void chooseColor(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              ColorPicker(
                pickerColor: colors[id].color,
                onColorChanged: (c) {
                  setState(
                    () {
                      colors[id].color = c;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              buildDoneButton(),
            ],
          ),
        );
      },
    );
  }

  void chooseFontsize(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: fontSizes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          fontsizess[id].fontsizess =
                              fontSizes[index].toDouble();
                          Navigator.of(context).pop();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            fontSizes[index].toString(),
                            style: TextStyle(
                              fontSize: fontSize.toDouble(),
                              fontFamily: fontFamily,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            texts[id].text,
                            style: TextStyle(
                              fontSize: fontSizes[index].toDouble(),
                              color: Colors.black,
                              fontFamily: fontFamily,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }

  void chooseFontfamily(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: fonts.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      //controller.changeFamily(fonts[index].toString());
                      setState(() {
                        fontFamilysss[id].fontFamilyss = fonts[index];
                        Navigator.of(context).pop();
                      });
                    },
                    child: Center(
                      child: buildText(
                        text: texts[id].text,
                        fontfamily: fonts[index],
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildDoneButton({VoidCallback? onTap}) => TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          fixedSize: const Size(double.maxFinite, 50),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: onTap ??
            () {
              Navigator.of(context).pop();
            },
        child: const Text(
          'Done',
        ),
      );
  Widget buildText({String? fontfamily, double? size, required String text}) =>
      Text(
        text,
        style: TextStyle(
          fontSize: size ?? fontSize.toDouble(),
          fontFamily: fontfamily ?? fontFamily,
        ),
      );

  String? fontFamily;
  // @override
  // void initState() {
  //   super.initState();
  //   // editController.text = controller.text;
  // }

  // @override
  // void dispose() {
  //   // editController.dispose();
  //   controller.dispose();
  //   super.dispose();
  // }

  // Offset offset = const Offset(100, 150);

  Widget buildDraggableText({
    required int id,
    required String text,
    required double fontS,
    required String fontF,
    required BoxConstraints constraints,
    required TextStyle editorStyle,
    required Offset offset,
    required Color pickC,
    required TextEditingController editController,
    required bool isVisible,
  }) {
    ids.add(id);
    colors.add(Colorr(id: id, color: pickC));
    isVisibles.add(Visibless(id: id, isVisibless: isVisible));
    texts.add(Textss(id: id, text: text));
    fontsizess.add(Fontss(id: id, fontsizess: fontS));
    fontFamilysss.add(Familyss(id: id, fontFamilyss: fontF));
    offsetss.add(Offsets(id: id, offset: offset));
    return Positioned(
      left: offsetss[id].offset.dx,
      top: offsetss[id].offset.dy,
      child: LongPressDraggable(
        feedback: Text(
          texts[id].text,
          style: TextStyle(
            fontSize: fontsizess[id].fontsizess,
            color: pickC,
            fontFamily: fontFamilysss[id].fontFamilyss,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
              width: 220,
              child: Visibility(
                visible: isVisibles[id].isVisibless,
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black38,
                    ),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TextButton(
                        onPressed: () => chooseColor(id),
                        child: Text(
                          'color',
                          style: editorStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () => chooseFontsize(id),
                        child: Text(
                          'fontsize',
                          style: editorStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () => chooseFontfamily(id),
                        child: Text(
                          'fontFamily',
                          style: editorStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // buildDraggableText(
                          //   id: id++,
                          //   text: 'Edit',
                          //   fontS: 20,
                          //   isVisible: false,
                          //   pickC: Colors.black,
                          //   fontF: fonts[2],
                          //   constraints: constraints,
                          //   editorStyle: editorStyle,
                          //   offset: const Offset(100, 100),
                          //   editController: TextEditingController(),
                          // );
                          // setState(() {
                          //   // isVisibles[id].isVisibless =
                          //   //     !isVisibles[id].isVisibless;
                          // });
                        },
                        child: Text(
                          ' + ',
                          style: editorStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isVisibles[id].isVisibless = !isVisibles[id].isVisibless;
                });
              },
              onDoubleTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: editController,
                          decoration: InputDecoration(
                            hintText: texts[id].text,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        buildDoneButton(
                          onTap: () {
                            if (editController.text.isEmpty &&
                                texts[id].text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Enter Something'),
                                ),
                              );
                            } else {
                              setState(
                                () {
                                  texts[id].text = editController.text;
                                },
                              );
                              Navigator.of(context).pop();
                              // controller.changeText(editController.text);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                texts[id].text,
                style: TextStyle(
                  fontSize: fontsizess[id].fontsizess,
                  color: colors[id].color,
                  fontFamily: fontFamilysss[id].fontFamilyss,
                ),
              ),
            ),
          ],
        ),
        onDragEnd: (details) {
          setState(() {
            double adjustment =
                MediaQuery.of(context).size.height - constraints.maxHeight;
            offsetss[id].offset =
                Offset(details.offset.dx, details.offset.dy - adjustment);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    fontFamily = fonts[2];
    TextStyle editorStyle = TextStyle(
      fontSize: 12,
      color: whiteColor,
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              buildDraggableText(
                id: 0,
                text: 'Edit',
                fontS: 20,
                isVisible: false,
                pickC: Colors.black,
                fontF: fonts[2],
                constraints: constraints,
                editorStyle: editorStyle,
                offset: const Offset(100, 150),
                editController: TextEditingController(),
              ),
              buildDraggableText(
                id: 1,
                text: 'Edit',
                fontS: 20,
                isVisible: false,
                pickC: Colors.black,
                fontF: fonts[2],
                constraints: constraints,
                editorStyle: editorStyle,
                offset: const Offset(200, 250),
                editController: TextEditingController(),
              ),
            ],
          );
        },
      ),
    );
  }
}
