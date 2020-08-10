
class Expense {
  final String id;
  final String title;
  final int price;
  final String description;
  toJson() {
    return {
      "title": title,
      "price": price,
      "description": description,
    };
  }
  Expense(this.id, this.title, this.price, this.description);
}