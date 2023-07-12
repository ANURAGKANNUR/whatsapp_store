part of '../../app/routes/app_pages.dart';

abstract class Routes {
  Routes._();
  static const loginPage = _Paths.loginPage;
  static const profilePage=_Paths.profilePage;
  static const productPage=_Paths.productPage;
}

abstract class _Paths {
  _Paths._();
  static const loginPage = '/loginPage';
  static const productPage='/productPage';
  static const profilePage='/profilePage';

}
