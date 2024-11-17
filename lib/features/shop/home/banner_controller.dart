class BannerController {
  BannerController._();
  static final BannerController instance = BannerController._();

  int carouselCurrentIndex = 0;
  void updateCarouselIndicator(index){
    carouselCurrentIndex = index;
  }
}