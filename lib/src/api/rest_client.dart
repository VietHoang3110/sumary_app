import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as HTTP;
import 'package:retrofit/retrofit.dart';
import 'package:sumary_app/src/base.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/buy_book.dart';
import 'package:sumary_app/src/models/model_generator/change_password_request.dart';
import 'package:sumary_app/src/models/model_generator/content_contact.dart';
import 'package:sumary_app/src/models/model_generator/content_faq.dart';
import 'package:sumary_app/src/models/model_generator/content_terms.dart';
import 'package:sumary_app/src/models/model_generator/create_advise.dart';
import 'package:sumary_app/src/models/model_generator/create_ask.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';
import 'package:sumary_app/src/models/model_generator/get_rank_member.dart';
import 'package:sumary_app/src/models/model_generator/list_ask.dart';
import 'package:sumary_app/src/models/model_generator/list_background.dart';
import 'package:sumary_app/src/models/model_generator/list_banner.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/src/models/model_generator/list_category.dart';
import 'package:sumary_app/src/models/model_generator/list_history_affiliate.dart';
import 'package:sumary_app/src/models/model_generator/list_notification.dart';
import 'package:sumary_app/src/models/model_generator/list_product.dart';
import 'package:sumary_app/src/models/model_generator/forgot_password.dart';
import 'package:sumary_app/src/models/model_generator/forgot_password_request.dart';
import 'package:sumary_app/src/models/model_generator/login.dart';
import 'package:sumary_app/src/models/model_generator/rate_product.dart';
import 'package:sumary_app/src/models/model_generator/read_notification_request.dart';
import 'package:sumary_app/src/models/model_generator/otp_forgot_password.dart';
import 'package:sumary_app/src/models/model_generator/otp_resend.dart';
import 'package:sumary_app/src/models/model_generator/register.dart';
import 'package:sumary_app/src/models/model_generator/reset_password_request.dart';
import 'package:sumary_app/src/models/model_generator/save_book.dart';
import 'package:sumary_app/src/models/model_generator/unread_notifi.dart';
import '../models/model_generator/avg_rate.dart';
import '../models/model_generator/buy_rank_member.dart';
import '../models/model_generator/category_select.dart';
import '../models/model_generator/check_chapter_done.dart';
import '../models/model_generator/create_rate_product.dart';
import '../models/model_generator/detail_banking.dart';
import '../models/model_generator/file_book_pdf.dart';
import '../models/model_generator/filter_apophthgan.dart';
import '../models/model_generator/filter_product.dart';
import '../models/model_generator/get_armorial.dart';
import '../models/model_generator/get_referral.dart';
import '../models/model_generator/hide_gg_fb.dart';
import '../models/model_generator/like_quote.dart';
import '../models/model_generator/list_armorial_user.dart';
import '../models/model_generator/list_book_bought.dart';
import '../models/model_generator/list_book_done.dart';
import '../models/model_generator/list_book_reading.dart';
import '../models/model_generator/list_book_same.dart';
import '../models/model_generator/list_data_banking.dart';
import '../models/model_generator/list_history_advise.dart';
import '../models/model_generator/list_history_appellation_received.dart';
import '../models/model_generator/list_history_recharge.dart';
import '../models/model_generator/list_history_wallet.dart';
import '../models/model_generator/list_issue.dart';
import '../models/model_generator/list_quote.dart';
import '../models/model_generator/list_rank_member_user.dart';
import '../models/model_generator/list_top_view.dart';
import '../models/model_generator/login_google_facebook.dart';
import '../models/model_generator/mood_reason.dart';
import '../models/model_generator/offer_package.dart';
import '../models/model_generator/save_quote.dart';
import '../models/model_generator/search.dart';
import '../models/model_generator/search_popular.dart';
import '../models/model_generator/unsave_book.dart';
import '../models/model_generator/update_file.dart';
import '../models/model_generator/user_info.dart';
import '../models/model_generator/base_response.dart';
import '../models/model_generator/otp_forgot_pass_request.dart';
import '../models/model_generator/otp_register.dart';
import '../models/model_generator/otp_register_request.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://onthicongchuc.net/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  // =================================> GET <===================================

  @GET(BASE_URL.GET_INFO_USER)
  Future<ResponseDataStatus> getInfoUser();

  @GET(BASE_URL.USER)
  Future<DataResponse>getUserInfo();

  // @GET(BASE_URL.OTP_RESET_PASSWORD)
  // Future<ResponseOtpForgotPassword> otpForgotPassword(@Query("email") String email, @Query("otp_code") String otpCode);
  //
  // @GET(BASE_URL.OTP_RESET_PASSWORD)
  // Future<OtpRegisterResponse> otpRegister(@Query("otp_code") String otpCode);

  @GET(BASE_URL.FIRST_INTRODUCE)
  Future<IntroduceResponse> firstIntroduce();

  @GET(BASE_URL.GET_LOGO)
  Future<LogoResponse> getLogo();

  @GET(BASE_URL.GET_REFERRAL)
  Future<GetReferralResponse> getReferral();

  @GET(BASE_URL.GET_LIST_NEW)
  Future<ListNewsResponse> getListNews(@Query('pageSize') int pageSize, @Query('currentPage') int currentPage);

  @GET(BASE_URL.GET_LIST_DOCUMENTS)
  Future<ListDocumentsResponse> getListDocuments();

  @GET(BASE_URL.INTRODUCE)
  Future<IntroduceResponse> getIntroduce();

  @GET(BASE_URL.GET_LIST_COURSE)
  Future<CoursesResponse> getCourse();

  @GET(BASE_URL.UNREAD_NOTIFICATION)
  Future<UnreadNotifiResponse> getUnreadNotifi();

  @GET(BASE_URL.GET_MY_RANK)
  Future<RankMemberResponse> getMyRank();

  @GET(BASE_URL.DETAIL_COURSE)
  Future<DetailCoursesResponse> getDetailCourse(@Query('id') int id);

  @GET(BASE_URL.FILE_BOOK+"/{name}")
  Future<FileBookPdfResponse> getFileBookPdf(@Path('name') String name);

  @GET(BASE_URL.LISY_BACKGROUND)
  Future<ListBackgroundResponse> getListBackground();

  @GET(BASE_URL.Avg_Rate+"/{id}")
  Future<AvgRateResponse> getAvgRate(@Path('id') String id);

  // Hiệp
  @GET(BASE_URL.FILE_BOOK+"/{id}")
  Future<dynamic> getFileBook(@Path('id') String id);
  // @GET(BASE_URL.DETAIL_COURSE)
  // Future<DetailCoursesResponse> getDetailCourse(@Query('id') int id);
  // @GET(BASE_URL.DETAIL_COURSE)
  // Future<DetailCoursesResponse> getDetailCourse(@Query('id') int id);


  @GET(BASE_URL.MOOD_REASON)
  Future<DataMoodAndReasonResponse> getMoodAndReason();

  @GET(BASE_URL.CATEGORY_SELECT)
  Future<CategoryFilterResponse> getCategorySelect();

  @GET(BASE_URL.APOPHTHGAN)
  Future<ApophthganFilterResponse> getApophthgan(
      @Query('mood') String mood,
      @Query('reason') String reason,
      );

  @GET(BASE_URL.SEARCH)
  Future<SearchResponse> getSearch(
      @Query('page') int page ,
      @Query('pageSize') int pageSize,
      @Query('name') String name,
      @Query('translator') String translator,
      );
  @GET(BASE_URL.SEARCH_POPULAR)
  Future<SearchPopularResponse> getSearchPopular();

  // Quân
  @GET(BASE_URL.LIST_NOTIFICATION)
  Future<ListNotificationResponse> getListNotification(@Query('page') int page ,@Query('pageSize') int pageSize );

  // @GET(BASE_URL.LIST_CATEGORIES)
  // Future<ListCategoryResponse> getListCategories(@Query('page') int? page ,@Query('pageSize') int? pageSize );

  @GET(BASE_URL.LIST_CATEGORIES)
  Future<ListCategoryResponse> getListCategories();

  @GET(BASE_URL.LIST_PRODUCT)
  Future<ListProductResponse> getListProducts(@Query('catId1') String catId1,@Query('catId2') String catId2,@Query('catId3') String catId3,@Query('page') int? page ,@Query('pageSize') int? pageSize);

  @GET(BASE_URL.LIST_PRODUCT)
  Future<ListProductResponse> getListProducts1(@Query('catId1') String catId1,@Query('catId2') String catId2,@Query('catId3') String catId3,@Query('page') int? page ,@Query('pageSize') int? pageSize);

  @GET(BASE_URL.DETAIL_PRODUCT+"/{id}")
  Future<DetailProductResponse> getDetailProduct(@Path('id') String id);

  @GET(BASE_URL.DETAIL_PRODUCT_VIEW+"/{id}")
  Future<DetailProductResponse> getDetailProductView(@Path('id') String id);

  @GET(BASE_URL.RATE_PRODUCT+"/{id}")
  Future<RateProductResponse> getRateProduct(@Path('id') String id,@Query('page') int page, @Query('pageSize') int pageSize) ;

  @GET(BASE_URL.RATE_PRODUCT_VIEW+"/{id}")
  Future<RateProductResponse> getRateProductView(@Path('id') String id,@Query('page') int page, @Query('pageSize') int pageSize) ;

  @GET(BASE_URL.LIST_BOOK_SAME+"/{id}")
  Future<ListBookSameResponse> getListBookSame(@Path('id') String id,@Query('page') int page, @Query('pageSize') int pageSize) ;

  @GET(BASE_URL.LIST_ISSUE)
  Future<ListIssueResponse> getListIssue(@Query('page') int page ,@Query('pageSize') int pageSize, @Query('keyword') String  keyword);

  @GET(BASE_URL.LIST_RANK_MEMBER)
  Future<ListRankMemberResponse> getListRankMember(@Query('keyword') String?  keyword, @Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.CONTENT_TERMS)
  Future<ContentTermsResponse> getTerms();

  @GET(BASE_URL.CONTENT_FAQ)
  Future<ContentFAQResponse> getFAQ();

  @GET(BASE_URL.GET_ARMORIAL)
  Future<YourArmorialResponse> getMyArmorial();

  @GET(BASE_URL.HIDE_GG_FB)
  Future<HideGGFBResponse> getHideGGFB();

  @GET(BASE_URL.CONTENT_CONTACT)
  Future<ContentContactResponse> getContact();

  @GET(BASE_URL.BANKING_LIST)
  Future<ListDataBankingResponse> getListDataBanking();

  @GET(BASE_URL.TOP_BOOK_VIEW)
  Future<ListTopViewResponse> getListBookTopView();

  @GET(BASE_URL.BOOK_DONE)
  Future<ListBookDoneResponse> getListBookDone();

  @GET(BASE_URL.BOOK_RECOMMEND)
  Future<ListTopViewResponse> getListBookRecommend();

  @GET(BASE_URL.BOOK_READING)
  Future<ListBookReadingResponse> getListBookReading();

  @GET(BASE_URL.BANKING_DETAIL+"/{id}")
  Future<DetailBankingResponse> getDetailBanking(@Path('id') String id);

  @GET(BASE_URL.LIST_SAVE_BOOK)
  Future<ListBookSavedResponse> getListProductsSave(@Query('keyword') String keyword , @Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_BANNER)
  Future<ListBannerResponse> getListBanner(@Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_HISTORY)
  Future<ListHistoryWalletResponse> getListHistoryWallet(@Query('type') String type,@Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_HISTORY)
  Future<ListHistoryRechargeResponse> getListHistoryRecharge(@Query('type') String type,@Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_HISTORY)
  Future<ListHistoryAffiliateResponse> getListHistoryAffiliate(@Query('type') String type,@Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_HISTORY)
  Future<ListHistoryAppellationResponse> getListHistoryAppellation(@Query('type') String type,@Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_HISTORY_ADVISE)
  Future<ListHistoryAdviseResponse> getListHistoryAdvise(@Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_Armorial)
  Future<ListArmorialResponse> getListArmorial(@Query('keyword') String keyword,@Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_BOUGHT_BOOK)
  Future<ListBookBoughtResponse> getListProductsBought(@Query('keyword') String  keyword, @Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_ASK+"/{id}"+'/asked-questions')
  Future<ListAskResponse> getListAsk(@Path('id') String id, @Query('page') int page ,@Query('pageSize') int pageSize);

  @GET(BASE_URL.LIST_QUOTE+"/{id}")
  Future<ListQuoteResponse> getListQuote(@Path('id') String id);

  @GET(BASE_URL.LIST_QUOTE_VIEW+"/{id}")
  Future<ListQuoteResponse> getListQuoteView(@Path('id') String id);

  @GET(BASE_URL.OFFER_PACKAGE)
  Future<OfferPackageResponse> getOfferPackage();


  // =================================> POST <==================================
  @POST(BASE_URL.LOGIN)
  Future<LoginResponse> loginApp(@Body() LoginAppRequest loginAppRequest);

  @POST(BASE_URL.LOGIN_GOOGLE)
  Future<LogoFBAndGGResponse> loginAppGoogle(@Body() LoginGoogleAndFacebookRequest loginGoogleAndFacebookRequest);

  @POST(BASE_URL.LOGIN_FACEBOOK)
  Future<LogoFBAndGGResponse> loginAppFacebook(@Body() LoginGoogleAndFacebookRequest loginGoogleAndFacebookRequest);

  @POST(BASE_URL.OTP_REGISTER)
  Future<OtpRegisterResponse> otpRegisterApp(@Body() OtpRegisterRequest otpRegisterRequest);

  // @POST(BASE_URL.OTP_RESEND)
  // Future<OtpResendResponse> otpResend(@Body() DataOtpResend dataOtpResend);

  @POST(BASE_URL.FORGOT_PASSWORD)
  Future<ForgotPasswordResponse> forgotPass(@Body() ForgotPasswordRequest forgotPasswordRequest);

  @POST(BASE_URL.OTP_FORGOT_PASSWORD)
  Future<OtpForgotResponse> otpForgotPass(@Body() OtpForgotPasswordRequest otpForgotPasswordRequest);

  @POST(BASE_URL.CHANGE_PASSWORD)
  Future<ResponseStatus> changePassword(@Body() ParamChangePassword paramChangePassword);

  @POST(BASE_URL.RESET_PASSWORD)
  Future<ResponseStatus> resetPassword(@Body() ParamResetPassword paramResetPassword);

  @POST(BASE_URL.EDIT_PROFILE)
  Future<ResponseDataStatus> postUpdateProfile(@Body() ParamChangeInfo infoUser);

  @POST(BASE_URL.EDIT_PROFILE)
  Future<ResponseDataStatus> postUpdateProfileNotImage(@Body() ParamChangeInfoNotImage infoUser);

  @POST(BASE_URL.EDIT_PROFILE)
  Future<ResponseDataStatus> postUpdateProfileAvatar(@Body() ParamChangeInfoAvatar infoUser);

  @POST(BASE_URL.ORDER_COURSE)
  Future<ResponseDataStatus> orderCourse(@Body() ParamOrderCourse paramOrderCourse);

  // @POST(BASE_URL.PROFILE)
  // Future<ResponseDataStatus> postImages(@Part() File image, @Query('code') String code, @Query('email') String email, @Query('name') String name);

  @POST(BASE_URL.OTP_RESEND_FORGOT)
  Future<OtpResendResponse> resendOtpForgotPass();

  @POST(BASE_URL.OTP_RESEND_REGISTER)
  Future<OtpResendResponse> resendOtpRegisterPass();

  @POST(BASE_URL.RESET_PASSWORD)
  Future<BaseResponse> resetPass(@Body() ResetPasswordRequest resetPasswordRequest);

  @POST(BASE_URL.RATE_PRODUCT+"/{id}")
  Future<CreateRateResponse> createRate(@Body() CreateRate createRate, @Path("id") String id);

  @POST(BASE_URL.DETAIL_PRODUCT+"/{id}"+"/buy-book")
  Future<BaseResponse> buyBook(@Body() PostBuyBook postBuyBook, @Path("id") String id);

  @POST(BASE_URL.FILTER_PRODUCT+"/{id}")
  Future<ProductFilterResponse> getProductFilter(
      @Path("id") String id,
      @Body() List<String> data
      );

  @POST(BASE_URL.FILTER_PRODUCT+"/{id}")
  Future<ProductFilterResponse> getProductFilter1(
      @Path("id") String id,
      @Body() List<String> data
      );

  @POST(BASE_URL.FILTER_PRODUCT+"/{id}")
  Future<ProductFilterResponse> getProductFilter2(
      @Path("id") String id,
      @Body() List<String> data
      );


  @POST(BASE_URL.BUY_RANK_MEMBER)
  Future<BuyRankMemberResponse> buyRankMember(@Body() PostBuyRank postBuyRank);

  @POST(BASE_URL.CREATE_ADVISE)
  Future<CreateAdviseResponse> createAdvise(@Body() CreateAdvise createAdvise);

  @POST(BASE_URL.CREATE_ASK+"/{id}"+"/ask")
  Future<CreateAskResponse> createAsk(@Body() CreateAsk createAsk, @Path("id") String id);

  @POST(BASE_URL.SAVE_BOOK+"/{id}"+"/save")
  Future<SaveBookResponse> saveBook(@Path("id") String id);

  @POST(BASE_URL.SAVE_BOOK+"/{id}"+"/unsave")
  Future<UnsaveBookResponse> unsaveBook(@Path("id") String id);

  @POST(BASE_URL.LIKE_QUOTE+"/{id}")
  Future<LikeQuoteResponse> likeQuote(@Path("id") String id);

  @POST(BASE_URL.LIKE_RATE + "/{id}")
  Future<BaseResponse> likeRate(@Path("id") String id);

  @POST(BASE_URL.SAVE_QUOTE+"/{id}")
  Future<SaveQuoteResponse> saveQuote(@Path("id") String id);

  //Bo Hiep
  @POST(BASE_URL.USER)
  Future<BaseResponse> updateProfile(@Body() ParamChangeInfo paramChangeInfo);

  @POST(BASE_URL.USER)
  Future<BaseResponse> updateAvatar(@Body() ParamChangeInfoAvatar paramChangeInfoAvatar);

  @POST(BASE_URL.USER)
  Future<BaseResponse> updateProfileNoAvatar(@Body() ParamChangeInfoNotImage paramChangeInfoNotImage);

  @POST(BASE_URL.USER)
  Future<BaseResponse> updateProfileAvatar(@Body() ParamChangeInfoNotImage paramChangeInfoNotImage);

  @POST(BASE_URL.UPDATE_FILE)
  Future<DataFileUpdate> updateFile(@Part() File file);

  @POST(BASE_URL.REGISTER)
  Future<RegisterResponse> registerApp(@Body() RegisterAppRequest registerAppRequest);

  // Quân
  @POST(BASE_URL.CHANGE_PASS)
  Future<BaseResponse> changePass(@Body() ChangePasswordRequest changePasswordRequest);

  @POST(BASE_URL.READ_NOTIFICATION)
  Future<BaseResponse> readNotification(@Body() ReadNotificationRequest readNotificationRequest );

  @POST(BASE_URL.CHECK_CHAPTER_DONE + "/{id}"+"/{chapter}")
  Future<CheckChapterDone> checkChapterDone(@Path("id") String id, @Path("chapter") int chapter);

  @POST(BASE_URL.DONE_BOOK + "/{id}")
  Future<BaseResponse> doneBook(@Path("id") String id);

}