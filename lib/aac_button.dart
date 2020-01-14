//import 'symbol_paths.dart';

List<Category> _categories = [];
List<AacButton> _buttons = [];

List defaultButtonData = [
  {'categoryIndex': 0, 'symbolName': 'house'},
  {'categoryIndex': 0, 'symbolName': 'butter'},
  {'categoryIndex': 0, 'symbolName': 'flatscreen_tv'},
  {'categoryIndex': 1, 'symbolName': 'chips'},
  {'categoryIndex': 1, 'symbolName': 'bread'},
  {'categoryIndex': 1, 'symbolName': 'soup'},
  {'categoryIndex': 1, 'symbolName': 'orange_juice'},
  {'categoryIndex': 1, 'symbolName': 'milk'},
  {'categoryIndex': 1, 'symbolName': 'lemonade'},
  {'categoryIndex': 2, 'symbolName': 'acorn'},
  {'categoryIndex': 2, 'symbolName': 'budgie'},
  {'categoryIndex': 2, 'symbolName': 'cat'},
];

List defaultCategoryData = [
  {'index': 0, 'name': 'General'},
  {'index': 1, 'name': 'Food'},
  {'index': 2, 'name': 'Animals'},
];

class Category {
  int index;
  String name;

  Category(this.index, this.name) {}
}

class AacButton {
  String speechText;
  String displayName;
  String symbolName;
  int categoryIndex;
  String symbolPath;

  AacButton(
      this.categoryIndex, this.symbolName, this.displayName, this.speechText) {
    this.symbolPath = 'assets/symbols/$symbolName.svg'; //get symbol path
  }

  String get categoryName {
    return _categories[this.categoryIndex].name;
  }
}

class Aac {
  Aac() {
    _buttons = [];
    _categories = [];
    defaultButtonData.forEach((element) {
      _buttons.add(AacButton(
        element['categoryIndex'],
        element['symbolName'],
        element['symbolName'],
        element['symbolName'],
      ));
    });

    defaultCategoryData.forEach((element) {
      _categories.add(Category(
        element['index'],
        element['name'],
      ));
    });
  }

  List<Category> get categories {
    return _categories;
  }

  List<AacButton> buttonsInCategory(categoryIndex) {
    return _buttons.where((i) => i.categoryIndex == categoryIndex).toList();
  }

  void addButton({categoryIndex, symbolName, displayName, speechText}) {
    _buttons.add(AacButton(categoryIndex, symbolName, displayName, speechText));
  }
}
