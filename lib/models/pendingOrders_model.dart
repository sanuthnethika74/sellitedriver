class PendingOrders {
//firstName, lastName, email, mobileNo, address, city, country, deliveryAddress, productId, title, date

  String? orderId;
  String? clientId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNo;
  String? address;
  String? city;
  String? country;
  String? deliveryAddress;
  String? productId;
  String? title;
  String? date;

  PendingOrders(
      {this.orderId,
      this.clientId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNo,
      this.address,
      this.city,
      this.country,
      this.deliveryAddress,
      this.productId,
      this.title,
      this.date});
}
