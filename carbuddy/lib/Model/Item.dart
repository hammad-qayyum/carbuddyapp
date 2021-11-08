class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Brian1",
        desc: "From: Gulberg To: Lums ",
        price: 999,
        color: "#33505a",
        image: ''
      ),
    Item(
        id: 2,
        name: "West Singer",
        desc: "From: Johar Twon To: DHA ",
        price: 599,
        color: "#33505a",
        image: ''
    ),
    Item(
        id: 3,
        name: "Brian1",
        desc: "From: Packages To: Walton ",
        price: 699,
        color: "#33505a",
        image: ''
    ),
    Item(
        id: 4,
        name: "Brian1",
        desc: "From: Gulberg To: Lums ",
        price: 799,
        color: "#33505a",
        image: ''
    ),
    Item(
        id: 5,
        name: "Adam",
        desc: "From: Gulberg To: Lums ",
        price: 899,
        color: "#33505a",
        image: ''
    ),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}