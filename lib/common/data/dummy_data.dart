import 'package:loundry_apps_01_23/common/common.dart';

class Data {
  static List<UserModel> users = [
    UserModel(
      email: 'abiyyu23@gmail.com',
      password: '12345',
      name: 'Abiyyu',
    ),
    UserModel(
      email: 'akmal@gmail.com',
      password: '11111',
      name: 'akmal',
    ),
     UserModel(
      email: 'baharudin231@gmail.com',
      password: '12345',
      name: 'Baharudin',
    ),
     UserModel(
      email: 'user.test01@gmail.com',
      password: '12345',
      name: 'user',
    ),
  ];

  static List<ProductModel> products = [
    ProductModel(
      name: 'T-Shirt',
      category: 'Man',
      icon: 'assets/shirt.png',
    ),
    ProductModel(
      name: 'Outer',
      category: 'Man',
      icon: 'assets/outer.png',
    ),
    ProductModel(
      name: 'Pants',
      category: 'Man',
      icon: 'assets/pants.png',
    ),
    ProductModel(
      name: 'Dress',
      category: 'Woman',
      icon: 'assets/dress.png',
    ),
    ProductModel(
      name: 'Others',
      category: 'Woman',
      icon: 'assets/others.png',
    ),
  ];

  static DateTime now = DateTime.now();

  static List<HistoryModel> histories = [
    
    HistoryModel(
      date: DateTime(now.year, now.month, now.day , 11, 33),
      title: 'IRON',
      description: 'Some clothes are torn and damaged before iron',
      payment: 'Transfer',
      customerName: 'Abiyyu',
      pickupDate: DateTime(now.year, now.month, now.day, 12, 55),
      dropDate: DateTime(now.year, now.month, now.day, 12, 55)
          .add(const Duration(days: 2)),
      totalPayment: 10,
    ),
    HistoryModel(
      date: DateTime(now.year, now.month, now.day , 11, 30),
      title: 'WASH & IRON',
      description: 'Only Iron',
      payment: 'COD',
      customerName: 'Abiyyu',
      pickupDate: DateTime(now.year, now.month, now.day, 10, 50),
      dropDate: DateTime(now.year, now.month, now.day, 12, 45)
          .add(const Duration(days: 1)),
      totalPayment: 25,
    ),
    HistoryModel(
      date: DateTime(now.year, now.month, now.day - 1, 11, 10),
      title: 'IRON',
      description: 'Some clothes are torn and damaged before iron',
      payment: 'Transfer',
      customerName: 'Abiyyu',
      pickupDate: DateTime(now.year, now.month, now.day, 12, 30),
      dropDate: DateTime(now.year, now.month, now.day, 12, 30)
          .add(const Duration(days: 1)),
      totalPayment: 10,
    ),
    HistoryModel(
      date: DateTime(now.year, now.month, now.day - 2, 10, 10),
      title: 'Iron',
      description: 'Some clothes are torn and damaged before washing',
      payment: 'COD (Cash on delivery)',
      customerName: 'customer1',
      pickupDate: DateTime(now.year, now.month, now.day, 10, 10),
      dropDate: DateTime(now.year, now.month, now.day, 10, 10)
          .add(const Duration(days: 2)),
      totalPayment: 15,
    ),
    HistoryModel(
      date: DateTime(now.year, now.month, now.day - 2, 10, 10),
      title: 'WASH AND DRY',
      description: 'Some clothes are torn and damaged before iron',
      payment: 'Transfer',
      customerName: 'Jeki',
      pickupDate: DateTime(now.year, now.month - 1, now.day, 10, 10),
      dropDate: DateTime(now.year, now.month - 1, now.day, 10, 10)
          .add(const Duration(days: 1)),
      totalPayment: 5,
    ),
  ];
}
