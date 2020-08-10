class Expense {
  final String id;
  final String title;
  final int price;
  final String description;
  final String date;
  final String whoUse;
  toJson() {
    return {
      "title": title,
      "price": price,
      "description": description,
      "date": date,
    };
  }

  Expense(this.id, this.title, this.price, this.description, this.date,
      this.whoUse);
}
