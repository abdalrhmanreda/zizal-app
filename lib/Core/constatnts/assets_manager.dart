const baseImagesPath = "assets/images";
const basePath = 'assets/images';
const bagPath = '$basePath/bag';
const bannersPath = '$basePath/banners';
const profilePath = '$basePath/profile';
const categoriesPath = '$basePath/categories';

class AssetsManager {
  static const appLogo = '$baseImagesPath/logo1.jpg';
  static const appLogo2 = '$baseImagesPath/logo2.gif';
  static const loginImage = '$baseImagesPath/login.png';
  static const loginIcon = '$baseImagesPath/login_icon.svg';
  static const waringImage = '$baseImagesPath/warning.png';
  static const loadingStatisticGIF = '$baseImagesPath/loading_statistic.gif';
  static String statisticBg = "$basePath/statistic_bg_image.png";
  static String productBg = "$basePath/product_bg.png";
  static String barcodeBg = "$basePath/barcode.png";

  //order status images
  static const orderRecordedImage = '$baseImagesPath/delivery.png';
  static const orderWithReceivingRepImage = '$baseImagesPath/delivery-man.png';
  static const orderResendImage = '$baseImagesPath/delivery-status.png';
  static const orderReturnedTotallyImage = '$baseImagesPath/delivery-truck.png';
  static const orderOnRoadWithRepImage = '$baseImagesPath/fast-delivery.png';
  static const orderReadyToSendImage = '$baseImagesPath/order-fulfillment.png';
  static const orderNotNowImage = '$baseImagesPath/package.png';
  static const orderReceivedImage = '$baseImagesPath/receiving.png';
  static const orderManagementImage = '$baseImagesPath/management.png';
  static const orderChangeAddressImage = '$baseImagesPath/placeholder.png';
  static const orderBoxImage = '$baseImagesPath/box.png';
  static const withRepRecievingImage = '$baseImagesPath/with_rep_recieving.png';

  // general images
  static String forgotPassword = "$basePath/forgot_password.jpg";
  static String mapRounded = "$basePath/rounded_map.png";
  static String warning = "$basePath/warning.png";
  static String error = "$basePath/error.png";
  static String addressMap = "$basePath/address_map.png";
  static String emptySearch = "$basePath/empty_search.png";
  static String successful = "$basePath/successful.png";

  // Profile
  static String address = "$profilePath/address.png";
  static String login = "$profilePath/login.png";
  static String logout = "$profilePath/logout.png";
  static String privacy = "$profilePath/privacy.png";
  static String recent = "$profilePath/recent.png";
  static String theme = "$profilePath/theme.png";
  // Bag
  static String bagWish = "$bagPath/bag_wish.png";
  static String shoppingBasket = "$bagPath/shopping_basket.png";
  static String shoppingCart = "$bagPath/shopping_cart.png";
  static String orderBag = "$bagPath/order.png";
  static String orderSvg = "$bagPath/order_svg.png";
  static String wishlistSvg = "$bagPath/wishlist_svg.png";
  // Categories path
  static String mobiles = "$categoriesPath/mobiles.png";
  static String fashion = "$categoriesPath/fashion.png";
  static String watch = "$categoriesPath/watch.png";
  static String book = "$categoriesPath/book_img.png";
  static String electronics = "$categoriesPath/electronics.png";
  static String cosmetics = "$categoriesPath/cosmetics.png";
  static String shoes = "$categoriesPath/shoes.png";
  static String pc = "$categoriesPath/pc.png";
  static const String googleIcon = "$basePath/google icon.png";
  static const String loginCover = "$basePath/Tablet login-amico.png";
}
