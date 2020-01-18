import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AacGridView extends StatefulWidget {
  AacGridView({this.aac, this.speak, this.categoryIndex});
  final aac;
  final speak;
  final categoryIndex;
  @override
  _AacGridViewState createState() => _AacGridViewState();
}

class _AacGridViewState extends State<AacGridView> {
  @override
  Widget build(BuildContext context) {
    List myList = widget.aac.buttonsInCategory(widget.categoryIndex);

    return Container(
      height: MediaQuery.of(context).size.height - 100,
      //color: Colors.blue,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 8 / 10,
        children: List.generate(myList.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),

              //padding: const EdgeInsets.all(8.0),
              child: Stack(
//            onTap: () => widget.speak(myList[index].displayName),
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: SvgPicture.asset(myList[index].symbolPath,

                          //color: Colors.red,

                          //height: MediaQuery.of(context).size.height / 5,
                          semanticsLabel: 'A red up arrow'),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AutoSizeText(
                          myList[index].displayName,
                          style: GoogleFonts.didactGothic(
                            textStyle: Theme.of(context).textTheme.body1,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => widget.speak(myList[index].displayName),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
