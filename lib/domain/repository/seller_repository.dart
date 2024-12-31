import 'package:e_commerce/domain/models/Seller.dart';

abstract class SellerRepository {
  Future<List<Seller>> getSellers();
  Future<Seller> getSellerById();
}