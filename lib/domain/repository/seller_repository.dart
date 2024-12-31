import 'package:e_commerce/domain/models/Seller.dart';

abstract class SellerRepository {
  List<Seller> getSellers();
  Seller getSellerById();
}