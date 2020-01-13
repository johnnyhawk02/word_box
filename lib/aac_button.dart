List defaultButtonData = [
  {
    'category': 'general',
    'symbolName': 'want',
    'displayName': 'want',
    'speechText': 'I want'
  },
];

class AacButton {
  String speechText;
  String displayName;
  String symbolName;
  String category;
  String symbolPath;

  AacButton(this.category, this.symbolName, this.displayName, this.speechText){
    this.symbolPath = ''; //get symbol path
  }
}

class Aac {
  List<AacButton> buttons = [];
  Aac() {
    defaultButtonData.forEach((element) {
      buttons.add(AacButton(
        element['category'],
        element['symbolName'],
        element['displayName'],
        element['speechName'],
      ));
    });
  }

  void addButton({
    category,
    symbolName,
    displayName,
    speechText
  }) {
    buttons.add(AacButton(
        category,
        symbolName,
        displayName,
        speechText
    ));
  }
}
