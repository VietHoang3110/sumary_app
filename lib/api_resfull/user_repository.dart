import 'dart:io';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart' show Dio; // ignore: import_of_legacy_library_into_null_safe
import 'package:sumary_app/api_resfull/dio_provider.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';
import 'package:sumary_app/src/models/model_generator/buy_rank_member.dart';
import 'package:sumary_app/src/models/model_generator/change_password_request.dart';
import 'package:sumary_app/src/models/model_generator/content_contact.dart';
import 'package:sumary_app/src/models/model_generator/content_faq.dart';
import 'package:sumary_app/src/models/model_generator/create_advise.dart';
import 'package:sumary_app/src/models/model_generator/create_rate_product.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';
import 'package:sumary_app/src/models/model_generator/filter_product.dart';
import 'package:sumary_app/src/models/model_generator/get_armorial.dart';
import 'package:sumary_app/src/models/model_generator/get_rank_member.dart';
import 'package:sumary_app/src/models/model_generator/list_ask.dart';
import 'package:sumary_app/src/models/model_generator/list_category.dart';
import 'package:sumary_app/src/models/model_generator/list_notification.dart';
import 'package:sumary_app/src/models/model_generator/list_product.dart';
import 'package:sumary_app/src/models/model_generator/forgot_password.dart';
import 'package:sumary_app/src/models/model_generator/forgot_password_request.dart';
import 'package:sumary_app/src/models/model_generator/login.dart';
import 'package:sumary_app/src/models/model_generator/rate_product.dart';
import 'package:sumary_app/src/models/model_generator/read_notification_request.dart';
import 'package:sumary_app/src/models/model_generator/otp_forgot_pass_request.dart';
import 'package:sumary_app/src/models/model_generator/otp_forgot_password.dart';
import 'package:sumary_app/src/models/model_generator/otp_register.dart';
import 'package:sumary_app/src/models/model_generator/otp_register_request.dart';
import 'package:sumary_app/src/models/model_generator/otp_resend.dart';
import 'package:sumary_app/src/models/model_generator/reset_password_request.dart';
import 'package:sumary_app/src/models/model_generator/search.dart';
import 'package:sumary_app/src/models/model_generator/unread_notifi.dart';
import 'package:sumary_app/src/models/model_generator/update_file.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/storages/share_local.dart';

import '../src/models/model_generator/avg_rate.dart';
import '../src/models/model_generator/buy_book.dart';
import '../src/models/model_generator/category_select.dart';
import '../src/models/model_generator/check_chapter_done.dart';
import '../src/models/model_generator/content_terms.dart';
import '../src/models/model_generator/create_ask.dart';
import '../src/models/model_generator/detail_banking.dart';
import '../src/models/model_generator/file_book_pdf.dart';
import '../src/models/model_generator/filter_apophthgan.dart';
import '../src/models/model_generator/get_referral.dart';
import '../src/models/model_generator/hide_gg_fb.dart';
import '../src/models/model_generator/like_quote.dart';
import '../src/models/model_generator/list_armorial_user.dart';
import '../src/models/model_generator/list_background.dart';
import '../src/models/model_generator/list_banner.dart';
import '../src/models/model_generator/list_book_bought.dart';
import '../src/models/model_generator/list_book_done.dart';
import '../src/models/model_generator/list_book_reading.dart';
import '../src/models/model_generator/list_book_same.dart';
import '../src/models/model_generator/list_book_saved.dart';
import '../src/models/model_generator/list_data_banking.dart';
import '../src/models/model_generator/list_history_advise.dart';
import '../src/models/model_generator/list_history_affiliate.dart';
import '../src/models/model_generator/list_history_appellation_received.dart';
import '../src/models/model_generator/list_history_recharge.dart';
import '../src/models/model_generator/list_history_wallet.dart';
import '../src/models/model_generator/list_issue.dart';
import '../src/models/model_generator/list_quote.dart';
import '../src/models/model_generator/list_rank_member_user.dart';
import '../src/models/model_generator/list_top_view.dart';
import '../src/models/model_generator/login_google_facebook.dart';
import '../src/models/model_generator/mood_reason.dart';
import '../src/models/model_generator/offer_package.dart';
import '../src/models/model_generator/save_book.dart';
import '../src/models/model_generator/save_quote.dart';
import '../src/models/model_generator/search_popular.dart';
import '../src/models/model_generator/unsave_book.dart';
import '../src/models/model_generator/user_info.dart';
import '../src/models/model_generator/register.dart';
enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  Dio dio = Dio();
  final _controller = StreamController<AuthenticationStatus>();
  final _controllerUser = StreamController<InfoUser>();
  UserRepository() {
    statusUser.listen((event) {
      if(event.token == dotenv.env[PreferencesKey.TOKEN]!){
        dio = DioProvider.instance();
      }else{
        dio = DioProvider.instance(token: shareLocal.getString(PreferencesKey.TOKEN));
      }
    });
    // if (shareLocal.getString(PreferencesKey.TOKEN) != '' ||
    //     shareLocal.getString(PreferencesKey.TOKEN) != null)
    //   DioProvider.instance(token: shareLocal.getString(PreferencesKey.TOKEN));
    // else
    //   DioProvider.instance();
  }

  //==========================================> GET <=========================================

  Future<ResponseDataStatus> getInfoUser() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getInfoUser();

  Future<IntroduceResponse> getFirstIntro() async => await RestClient(dio, baseUrl: dio.options.baseUrl).firstIntroduce();

  Future<LogoResponse> getLogo() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getLogo();

  Future<ListNewsResponse> getListNews({required int pageSize, required int currentPage}) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getListNews(pageSize, currentPage);

  Future<ListDocumentsResponse> getListDocuments() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getListDocuments();

  Future<IntroduceResponse> getIntroduce() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getIntroduce();

  Future<CoursesResponse> getCourse() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getCourse();

  Future<DataResponse> getUserInfo() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getUserInfo();

  Future<AvgRateResponse> getAvgRate(String id) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getAvgRate(id);

  Future<GetReferralResponse> getReferral() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getReferral();

  Future<CategoryFilterResponse> getCategorySelect() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getCategorySelect();

  Future<ContentTermsResponse> getTerms() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getTerms();

  Future<ContentFAQResponse> getFAQ() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getFAQ();

  Future<UnreadNotifiResponse> getUnreadNotifi() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getUnreadNotifi();

  Future<DataMoodAndReasonResponse> getMoodAndReason() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getMoodAndReason();

  Future<ContentContactResponse> getContact() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getContact();

  Future<RankMemberResponse> getMyRank() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getMyRank();

  Future<HideGGFBResponse> getHideGGFB() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getHideGGFB();

  Future<ListBackgroundResponse> getListBackground() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListBackground();

  Future<DetailCoursesResponse> getDetailCourse(int id) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getDetailCourse(id);

  Future<ListCategoryResponse> getListCategories() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListCategories();

  Future<ListRankMemberResponse> getListRankMember(String? keyword,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListRankMember(keyword,page,pageSize);

  Future<ListArmorialResponse> getListArmorial(String? keyword,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListArmorial(keyword!,page,pageSize);

  Future<ListProductResponse> getListProduct(String catId1,String catId2,String catId3,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListProducts(catId1, catId2, catId3,page,pageSize);

  Future<ListProductResponse> getListProduct1(String catId1,String catId2,String catId3,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListProducts1(catId1, catId2, catId3,page,pageSize);

  Future<FileBookPdfResponse> getFileBookPdf(String name) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getFileBookPdf(name);
  //Của bố Hiệp
  Future<dynamic> getFileBook(String id) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getFileBook(id);

  Future<DetailBankingResponse> getDetailBanking(String id) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getDetailBanking(id);

  Future<SearchResponse> getSearch(int page, int pageSize,String name,String translator) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getSearch(page, pageSize,name,translator);

  Future<ListHistoryWalletResponse> getListHistoryWallet(String type,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListHistoryWallet(type, page, pageSize);

  Future<ListHistoryRechargeResponse> getListHistoryRecharge(String type,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListHistoryRecharge(type, page, pageSize);

  Future<ListHistoryAffiliateResponse> getListHistoryAffiliate(String type,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListHistoryAffiliate(type, page, pageSize);

  Future<ListHistoryAppellationResponse> getListHistoryAppellation(String type,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListHistoryAppellation(type, page, pageSize);

  Future<ListHistoryAdviseResponse> getListHistoryAdvise(int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListHistoryAdvise(page, pageSize);

  Future<SearchPopularResponse> getSearchPopular() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getSearchPopular();

  Future<ListTopViewResponse> getListBookTopView() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListBookTopView();

  Future<ListBookReadingResponse> getListBookReading() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListBookReading();

  Future<ListTopViewResponse> getListBookRecommend() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListBookRecommend();

  Future<ListDataBankingResponse> getListDataBanking() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListDataBanking();

  Future<ListNotificationResponse> getListNotification(int page, int pageSize,) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListNotification(page, pageSize);

  Future<ListBannerResponse> getListBanner(int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListBanner(page, pageSize);

  Future<ListBookDoneResponse> getListBookDone() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListBookDone();

  Future<ListBookSavedResponse> getListProductsSave(String keyword, int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListProductsSave(keyword,page,pageSize);

  Future<ListBookSameResponse> getListBookSame(String id, int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListBookSame(id,page,pageSize);

  Future<ApophthganFilterResponse> getApophthgan(String mood, String reason) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getApophthgan(mood,reason);

  Future<ListBookBoughtResponse> getListProductsBought(String keyword,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListProductsBought(keyword,page,pageSize);

  Future<ListAskResponse> getListAsk(String id,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListAsk(id,page,pageSize);

  Future<DetailProductResponse> getDetailProduct(String id) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getDetailProduct(id);

  Future<DetailProductResponse> getDetailProductView(String id) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getDetailProductView(id);

  Future<YourArmorialResponse> getMyArmorial() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getMyArmorial();

  Future<OfferPackageResponse> getOfferPackage() async => await RestClient(dio,baseUrl: dio.options.baseUrl).getOfferPackage();

  Future<ListQuoteResponse> getListQuote(String id) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListQuote(id);

  Future<ListQuoteResponse> getListQuoteView(String id) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListQuoteView(id);

  Future<RateProductResponse> getRateProduct(String id,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getRateProduct(id, page, pageSize);

  Future<RateProductResponse> getRateProductView(String id,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getRateProductView(id, page, pageSize);

  Future<ListIssueResponse> getListIssue(String keyword ,int page, int pageSize) async => await RestClient(dio,baseUrl: dio.options.baseUrl).getListIssue(page, pageSize, keyword);
  //=========================================> POST <=========================================

  Future<LoginResponse> loginApp({required String email, required String password, required String token_firebase}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).loginApp(LoginAppRequest(email: email, password: password, token_firebase: token_firebase));

  Future<LogoFBAndGGResponse> loginAppFacebook({required String token, required String token_device}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).loginAppFacebook(LoginGoogleAndFacebookRequest(token: token, token_device: token_device));

  Future<LogoFBAndGGResponse> loginAppGoogle({required String token, required String token_device}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).loginAppGoogle(LoginGoogleAndFacebookRequest(token: token, token_device: token_device));

  Future<RegisterResponse> registerApp({required String name, required String email, required String password, String? referrer}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).registerApp(RegisterAppRequest(name: name ,email: email, password: password, referrer: referrer));

  Future<OtpResendResponse> resendOtpForgotPass() async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).resendOtpForgotPass();

  Future<OtpResendResponse> resendOtpRegisterPass() async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).resendOtpRegisterPass();

  Future<ResponseStatus> changePassword({required ParamChangePassword paramChangePassword}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).changePassword(paramChangePassword);

  Future<ForgotPasswordResponse> forgotPass({required String email}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).forgotPass(ForgotPasswordRequest(email));

  Future<OtpForgotResponse> otpForgotPass({required String otp}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).otpForgotPass(OtpForgotPasswordRequest(otp));

  Future<OtpRegisterResponse> otpRegisterApp({required String otp}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).otpRegisterApp(OtpRegisterRequest(otp));

  Future<ResponseStatus> resetPassword({required ParamResetPassword paramResetPassword}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).resetPassword(paramResetPassword);

  Future<ResponseDataStatus> postUpdateProfile({required ParamChangeInfo infoUser}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).postUpdateProfile(infoUser);

  Future<CreateAdviseResponse> createAdvise({required String name, required String issueType, required String appointmentDate, required int phoneNumber, required String email, required String content, required String note}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).createAdvise(CreateAdvise(name: name, issueType: issueType, appointmentDate: appointmentDate, phoneNumber: phoneNumber, email: email, content: content,note: note));

  Future<CreateAskResponse> createAsk({required String name, required String question, required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).createAsk(CreateAsk(name: name,  question: question), id);

  Future<SaveBookResponse> saveBook({ required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).saveBook( id);

  Future<LikeQuoteResponse> likeQuote({ required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).likeQuote( id);

  Future<SaveQuoteResponse> saveQuote({ required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).saveQuote( id);

  Future<BaseResponse> likeRate({ required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).likeRate( id);

  Future<BaseResponse> readNotification(String id) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).readNotification(ReadNotificationRequest(id));

  Future<UnsaveBookResponse> unsaveBook({ required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).unsaveBook( id);

  Future<BaseResponse> buyBook({ required String payment_type, required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).buyBook(PostBuyBook(payment_type), id);

  Future<BuyRankMemberResponse> buyRankMember({ required String mid}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).buyRankMember(PostBuyRank(mid));

  Future<ProductFilterResponse> getProductFilter({required List<String> data,required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).getProductFilter(id,data);

  Future<ProductFilterResponse> getProductFilter1({required List<String> data,required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).getProductFilter1(id,data);

  Future<ProductFilterResponse> getProductFilter2({required List<String> data,required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).getProductFilter2(id,data);

  Future<CheckChapterDone> checkChapterDone({required String id, required int chapter}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).checkChapterDone(id,chapter);

  Future<BaseResponse> doneBook({required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).doneBook(id);

  //Của Bố Hiệp ngu
  Future<DataFileUpdate> updateFile({required File file }) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).updateFile(file);

  Future<BaseResponse> updateProfile({required String? name, required String? phone, required String? avatar }) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).updateProfile(ParamChangeInfo(name:name, phone:phone, avatar:avatar));

  Future<BaseResponse> updateAvatar({required String avatar }) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).updateAvatar(ParamChangeInfoAvatar(avatar:avatar));

  Future<BaseResponse> updateProfileNoAvatar({required String name, required String phone}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).updateProfile(ParamChangeInfo(name:name, phone:phone));


  Future<ResponseDataStatus> postUpdateProfileNotImage({required ParamChangeInfoNotImage infoUser}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).postUpdateProfileNotImage(infoUser);


  Future<ResponseDataStatus> orderCourse({required ParamOrderCourse paramOrderCourse}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).orderCourse(paramOrderCourse);

  Future<BaseResponse> changePass({required String password, required String newPassword}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).changePass(ChangePasswordRequest(password, newPassword));

  Future<BaseResponse> resetPass({required String password, required String newPassword}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).resetPass(ResetPasswordRequest(password: password, newPassword: newPassword));

  Future<CreateRateResponse> createRate({ required int voiceStar, required int contentStar, required String content,required String id}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).createRate(CreateRate(voiceStar: voiceStar, contentStar: contentStar, content: content),id);

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Stream<InfoUser> get statusUser async* {
    yield* _controllerUser.stream;
  }

  void logOut() => _controller.add(AuthenticationStatus.unauthenticated);

  void addUser(InfoUser user) => _controllerUser.add(user);

  void dispose(){
    _controllerUser.close();
    _controller.close();
  }
}