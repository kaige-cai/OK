class Category {
  final String name;
  final List<Item> items;

  Category(this.name, this.items);
}

class Item {
  final String name;
  final String iconPath;

  Item(this.name, this.iconPath);
}