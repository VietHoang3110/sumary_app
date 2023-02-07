
import 'package:get/get.dart';
import 'package:sumary_app/src/base.dart';
import 'package:sumary_app/src/router.dart';

import 'models/model_generator/detail_productt.dart';
import 'models/model_generator/list_notification.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async => Get.back();

  static navigateTest() async => await Get.toNamed(ROUTE_NAMES.TEST);

  static navigateSplash() async => await Get.toNamed(ROUTE_NAMES.SPLASH);

  static navigateLogin({String? email}) async => await Get.toNamed(ROUTE_NAMES.LOGIN);

  static navigateLogout() async => await Get.offAllNamed(ROUTE_NAMES.LOGIN);

  static navigateMain() async => await Get.offAllNamed(ROUTE_NAMES.MAIN);

  static navigateMain2() async => await Get.offAllNamed(ROUTE_NAMES.MAIN2);

  static navigateIntro() async => await Get.offAllNamed(ROUTE_NAMES.INTRO);

  static navigateIntro1() async => await Get.offAllNamed(ROUTE_NAMES.INTRO_1);

  static navigateMarketing() async => await Get.toNamed(ROUTE_NAMES.MARKETING);

  static navigateEvent() async => await Get.toNamed(ROUTE_NAMES.EVENT);

  static navigateAdvise() async => await Get.toNamed(ROUTE_NAMES.ADVISE_SCREEN);

  static navigateForgotPassword() async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD);

  static navigateRegister() async => await Get.toNamed(ROUTE_NAMES.REGISTER_PAGE);

  static navigateForgotPasswordOTP(email) async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD_OTP, arguments: email);

  static navigateOTPRegiter(email) async => await Get.toNamed(ROUTE_NAMES.OTP_REGISTER, arguments: email);

  static navigateForgotPasswordReset() async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD_RESET);

  static navigateChangePassword() async => await Get.toNamed(ROUTE_NAMES.CHANGE_PASSWORD);

  static navigateInformationAccount() async => await Get.toNamed(ROUTE_NAMES.INFORMATION_ACCOUNT);

  static navigateInfo() async => await Get.toNamed(ROUTE_NAMES.INFO);

  static navigateAccountDetail() async => await Get.toNamed(ROUTE_NAMES.ACCOUNT_DETAIL);

  static navigateListHistoryAdvise() async => await Get.toNamed(ROUTE_NAMES.LIST_HISTORY_ADVISE);

  static navigateDetailHistoryAdvise(String name,String issue,String date,String phone,String email,String content,String idIssue) async => await Get.toNamed(ROUTE_NAMES.DETAIL_HISTORY_ADVISE,arguments: [name,issue,date,phone,email,content,idIssue]);

  static navigateChangePass() async => await Get.toNamed(ROUTE_NAMES.CHANGE_PASS);

  static navigateAboutUs() async => await Get.toNamed(ROUTE_NAMES.ABOUT_US);

  static navigateTerm() async => await Get.toNamed(ROUTE_NAMES.TERM);

  static navigateQuestion() async => await Get.toNamed(ROUTE_NAMES.QUESTION);

  static navigateRankMember(String name) async => await Get.toNamed(ROUTE_NAMES.RANK_MEMBER, arguments: name);

  static navigateTopUp() async => await Get.toNamed(ROUTE_NAMES.TOP_UP);

  static navigateTopUpDetail(String id) async => await Get.toNamed(ROUTE_NAMES.TOP_UP_DETAIL, arguments: id);

  static navigateHistory() async => await Get.toNamed(ROUTE_NAMES.HISTORY);

  // static navigateBookDetail(String id) async => await Get.toNamed(ROUTE_NAMES.BOOK_DETAIL,arguments: id);

  static navigateArmorialPage() async => await Get.toNamed(ROUTE_NAMES.ARMORIAL_PAGE);

  static navigateBookDetailMain(String id) async => await Get.toNamed(ROUTE_NAMES.BOOK_DETAIL_MAIN, arguments: id);

  static navigateChapterDetail(String id,int indexBook) async => await Get.toNamed(ROUTE_NAMES.CHAPTER_DETAIL,arguments: [id,indexBook]);

  static navigateWriteAReview(String id) async => await Get.toNamed(ROUTE_NAMES.WRITE_A_REVIEW, arguments: id);

  static navigateNotificationScreen() async => await Get.toNamed(ROUTE_NAMES.NOTIFICATION_SCREEN);

  static navigateNotificationDetail(final String id, String? title,String? content, String? description,bool? isRead, bool? isActivated,String? author,String? createdAt,) async => await Get.toNamed(ROUTE_NAMES.NOTIFICATION_DETAIL,arguments: [id,title,content,description,isRead,isActivated,author,createdAt]);

  static navigateChangeInformationAccount(arguments) async => await Get.toNamed(ROUTE_NAMES.CHANGE_INFORMATION_ACCOUNT, arguments: arguments);

  static navigateDetailNew(arguments) async => await Get.toNamed(ROUTE_NAMES.DETAIL_NEW, arguments: arguments);

  static navigateDetailDocument(arguments) async => await Get.toNamed(ROUTE_NAMES.DETAIL_DOCUMENT, arguments: arguments);

  static navigateEditInfo(arguments) async => await Get.toNamed(ROUTE_NAMES.EDIT_INFO, arguments: arguments);

  static navigateSearch() async => await Get.toNamed(ROUTE_NAMES.SEARCH_SCREEN);

  static navigateMakeAQuestion(String id) async => await Get.toNamed(ROUTE_NAMES.MAKE_A_QUESTION, arguments: id);

  static navigateMakeAQuestion2(String id) async => await Get.toNamed(ROUTE_NAMES.MAKE_A_QUESTION2, arguments:  id);

  static navigateDocumentsScreen() async => await Get.toNamed(ROUTE_NAMES.DOCUMENTS_SCREEN);

  static navigateCourseDetailScreen(arguments) async => await Get.toNamed(ROUTE_NAMES.COURSE_DETAIL_SCREEN, arguments: arguments);

  static navigateBuyCourseScreen(arguments) async => await Get.toNamed(ROUTE_NAMES.BUY_COURSE, arguments: arguments);

  static navigateAudioScreen(DataDetailProduct dataBook, int? indexChap) async => await Get.toNamed(ROUTE_NAMES.AUDIO_SCREEN, arguments: [dataBook,indexChap]);


  // Kiet
  static navigateSurveyFields() async => await Get.toNamed(ROUTE_NAMES.TAB_SURVEY_FIELDS,);

  static navigateSurveyFieldsWidget() async => await Get.toNamed(ROUTE_NAMES.TAB_SURVEY_FIELDS_WIDGET,);

  static navigateTabSurveyFavoritet() async => await Get.toNamed(ROUTE_NAMES.TAB_SURVEY_FAVORITE,);

  static navigateTabSurveyFavoriteWidget() async => await Get.toNamed(ROUTE_NAMES.TAB_SURVEY_FAVORITE_WIDGET,);

  static navigateSevice_Pack1() async => await Get.toNamed(ROUTE_NAMES.SEVICE_PACK1,);

  static navigateIntro_Recommend() async => await Get.toNamed(ROUTE_NAMES.INTRO_RECOMMMEND,);

  static navigateLibrary_Survey() async => await Get.toNamed(ROUTE_NAMES.LIBRARY_SURVEY,);
  static navigateLibrary_Survey_Widget() async => await Get.toNamed(ROUTE_NAMES.LIBRARY_SURVEY_WIDGET,);
  static navigateConsultation_Survey() async => await Get.toNamed(ROUTE_NAMES.CONSULTATION_SURVEY,);
  static navigateConsultation_Survey_Widget() async => await Get.toNamed(ROUTE_NAMES.CONSULTATION_SURVEY_WIDGET,);

  static navigatePay_Pack() async => await Get.toNamed(ROUTE_NAMES.PAY_PACK,);
  static navigatePay_Retail() async => await Get.toNamed(ROUTE_NAMES.PAY_RETAIL,);

}
