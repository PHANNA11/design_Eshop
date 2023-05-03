class ProductModel {
  late int code;
  late String name;
  late int qty;
  late double price;
  late String stockStatus;
  late String desription;
  late double rate;
  late double discount;
  late String image;
  ProductModel(
      {required this.code,
      required this.name,
      required this.price,
      required this.qty,
      required this.rate,
      required this.discount,
      required this.desription,
      required this.image,
      required this.stockStatus});
}

List<ProductModel> products = [
  ProductModel(
      code: 123,
      name: 'EYKI Mens Sport',
      price: 125,
      qty: 1,
      rate: 4.5,
      discount: 0,
      desription:
          'EYKI Mens Sport Watch 2018 Luxury Brand Male Clock Brown Leather ...',
      image:
          'https://ae01.alicdn.com/kf/HTB12foVbf1TBuNjy0Fjq6yjyXXav/EYKI-Mens-Sport-Watch-2018-Luxury-Brand-Male-Clock-Brown-Leather-Watchband-Man-Dress-Wrist-Watches.jpg',
      stockStatus: 'INSTOCK'),
  ProductModel(
      code: 113,
      name: 'Black Military Mechanical',
      price: 98,
      qty: 1,
      rate: 3.5,
      discount: 10,
      desription:
          'Black Military Mechanical Watches Men Function Watch Automatic Full ...',
      image:
          'https://ae01.alicdn.com/kf/HTB1a04Tgj3z9KJjy0Fmq6xiwXXaj/Black-Military-Mechanical-Watches-Men-Function-Watch-Automatic-Full-Steel-Mens-Watches-Waterproof-Self-winding-Male.jpg',
      stockStatus: 'INSTOCK'),
  ProductModel(
      code: 183,
      name: ' Mechanical Automatic',
      price: 99,
      qty: 1,
      rate: 4.0,
      discount: 5,
      desription:
          'Classy Men\'s Mechanical Automatic Wristwatch for Men Mens Watch ...',
      image:
          'https://th.bing.com/th/id/OIP.KKaPCt-dpoZCCfYpSUe-EwHaHa?pid=ImgDet&rs=1',
      stockStatus: 'INSTOCK'),
  ProductModel(
      code: 233,
      name: 'Apple Watch Series 4',
      price: 150,
      qty: 1,
      rate: 4.5,
      discount: 0,
      desription:
          'Apple Watch Series 4 Apple Watch Series 4 GPS + Cellular, 40mm Gold ...',
      image:
          'https://th.bing.com/th/id/OIP.02fM7D8hzap85BQa498ARgHaJC?pid=ImgDet&w=700&h=855&rs=1',
      stockStatus: 'OUTSTOCK'),
  ProductModel(
      code: 153,
      name: 'Apple-Watch',
      price: 215,
      qty: 1,
      rate: 4.7,
      discount: 5,
      desription: 'Apple-Watch-Apple-Watch-Iwatch-PNG-Image – FAST EXPO 2020',
      image:
          'https://th.bing.com/th/id/R.c8eb44b5a439606d4615ef2a8d6dfa6d?rik=DfSeBbR%2fJMET6w&pid=ImgRaw&r=0',
      stockStatus: 'INSTOCK'),
  ProductModel(
      code: 193,
      name: 'Apple Iwatch Series 6',
      price: 279,
      qty: 1,
      rate: 4.9,
      discount: 0,
      desription:
          'Apple Iwatch Series 6 44MM GPS Only in Darkuman - Smart Watches ...',
      image:
          'https://d12uoqa0c8grue.cloudfront.net/9966864_4a2d1bab-2b89-4e68-a85d-711dda7fae4e_1400x1400.jpg',
      stockStatus: 'OUTSTOCK'),
];
