import 'package:gyms/config/cache.dart';

class UserLoacl {
  static bool? get check => CacheHelper.getData(key: MyCacheMy.check);
  static String? get token => CacheHelper.getData(key: MyCacheMy.token);
  static double? get lat => CacheHelper.getData(key: MyCacheMy.latitude);
  static double? get long => CacheHelper.getData(key: MyCacheMy.longitude);
  static bool? get userLoged => CacheHelper.getData(key: MyCacheMy.logined);
  static List<String>? get favoriteList =>  CacheHelper.getData(key: MyCacheMy.listFavorite) as List<String>;






 static String? get name => CacheHelper.getData(key: MyCacheMy.username);
 static String? get email => CacheHelper.getData(key: MyCacheMy.userEmail);
 static String? get phone => CacheHelper.getData(key: MyCacheMy.userPhone);
 static String? get cirty => CacheHelper.getData(key: MyCacheMy.usercity);








}
