import 'package:get_it/get_it.dart';
import 'package:the_dice_game/scoped_model/login_model.dart';
import 'package:the_dice_game/scoped_model/register_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerFactory<LoginModel>(() => LoginModel());
  locator.registerFactory<RegisterModel>(() => RegisterModel());
}
