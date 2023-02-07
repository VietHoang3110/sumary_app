import 'dart:async';
import 'dart:collection';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:sumary_app/bloc/Filter_product_2/filter_product_2_bloc.dart';
import 'package:sumary_app/bloc/buy_book/buy_book_bloc.dart';
import 'package:sumary_app/bloc/buy_rank_member/buy_rank_member_bloc.dart';
import 'package:sumary_app/bloc/check_chapter_done/check_chapter_done_bloc.dart';
import 'package:sumary_app/bloc/content_FAQ/content_FAQ_bloc.dart';
import 'package:sumary_app/bloc/content_contact/content_contact_bloc.dart';
import 'package:sumary_app/bloc/content_terms/content_terms_bloc.dart';
import 'package:sumary_app/bloc/create_advise/create_advise_bloc.dart';
import 'package:sumary_app/bloc/create_ask/create_ask_bloc.dart';
import 'package:sumary_app/bloc/detail_product/detail_product_bloc.dart';
import 'package:sumary_app/bloc/detail_product_view/detail_product_view_bloc.dart';
import 'package:sumary_app/bloc/done_book/done_book_bloc.dart';
import 'package:sumary_app/bloc/get_referral/get_referral_bloc.dart';
import 'package:sumary_app/bloc/hide_gg_fb/hide_gg_fb_bloc.dart';
import 'package:sumary_app/bloc/like_rate/like_rate_bloc.dart';
import 'package:sumary_app/bloc/list_ask/list_ask_bloc.dart';
import 'package:sumary_app/bloc/list_background/list_background_bloc.dart';
import 'package:sumary_app/bloc/list_banner/list_banner_bloc.dart';
import 'package:sumary_app/bloc/list_book_bought/list_book_bought_bloc.dart';
import 'package:sumary_app/bloc/list_book_recommend/list_book_recommend_bloc.dart';
import 'package:sumary_app/bloc/list_book_save/list_book_save_bloc.dart';
import 'package:sumary_app/bloc/list_categories/list_categories_bloc.dart';
import 'package:sumary_app/bloc/list_data_banking/list_data_banking_bloc.dart';
import 'package:sumary_app/bloc/list_history_recharge/list_history_recharge_bloc.dart';
import 'package:sumary_app/bloc/list_issue/list_issue_bloc.dart';
import 'package:sumary_app/bloc/list_notification/list_notification_bloc.dart';
import 'package:sumary_app/bloc/list_rank_member/list_rank_member_bloc.dart';
import 'package:sumary_app/bloc/list_rate_product/list_rate_product_bloc.dart';
import 'package:sumary_app/bloc/list_rate_product_view/list_rate_product_view_bloc.dart';
import 'package:sumary_app/bloc/login_google/login_google_bloc.dart';
import 'package:sumary_app/bloc/my_armorial/my_armorial_bloc.dart';
import 'package:sumary_app/bloc/otp_register/otp_register_bloc.dart';
import 'package:sumary_app/bloc/reset_password/reset_password_bloc.dart';
import 'package:sumary_app/bloc/save_book/save_book_bloc.dart';
import 'package:sumary_app/bloc/search_popular/search_popular_bloc.dart';
import 'package:sumary_app/bloc/unread_notifi/unread_notifi_bloc.dart';
import 'package:sumary_app/bloc/user_info/user_info_bloc.dart';
import 'package:sumary_app/screens/account_information/infor_main.dart';
import 'package:sumary_app/screens/account_information/information_list/account_detail.dart';
import 'package:sumary_app/screens/account_information/information_list/change_pass.dart';
import 'package:sumary_app/screens/account_information/information_list/history.dart';
import 'package:sumary_app/screens/account_information/information_list/history_advise/detail_history_advise.dart';
import 'package:sumary_app/screens/account_information/information_list/history_advise/list_history_advise.dart';
import 'package:sumary_app/screens/account_information/information_list/marketing/event_screen.dart';
import 'package:sumary_app/screens/account_information/information_list/marketing/marketing_screen.dart';
import 'package:sumary_app/screens/account_information/information_list/question.dart';
import 'package:sumary_app/screens/account_information/information_list/term.dart';
import 'package:sumary_app/screens/account_information/rank_member.dart';
import 'package:sumary_app/screens/account_information/top_up/top_up.dart';
import 'package:sumary_app/screens/account_information/top_up/top_up_detail.dart';
import 'package:sumary_app/screens/book_detail/book_detail_main.dart';
import 'package:sumary_app/screens/book_detail/book_detail_new.dart';
import 'package:sumary_app/screens/chapter_detail/audio_screen.dart';
import 'package:sumary_app/screens/chapter_detail/chapter_detail_screen.dart';
import 'package:sumary_app/screens/chapter_detail/make_a_question.dart';
import 'package:sumary_app/screens/forgot_password/forgot_password_otp_screen.dart';
import 'package:sumary_app/screens/introduce/intro1.dart';
import 'package:sumary_app/screens/introduce/introduce_screen.dart';
import 'package:sumary_app/screens/introduce/recommend/consultation_survey.dart';
import 'package:sumary_app/screens/introduce/recommend/consultation_survey_widget.dart';
import 'package:sumary_app/screens/introduce/recommend/intro_recommend.dart';
import 'package:sumary_app/screens/introduce/recommend/library_survey.dart';
import 'package:sumary_app/screens/introduce/recommend/library_survey_widget.dart';
import 'package:sumary_app/screens/introduce/tab_khaosat_thamvan/survey_field_widget.dart';
import 'package:sumary_app/screens/introduce/tab_khaosat_thamvan/survey_interrogation_widget.dart';
import 'package:sumary_app/screens/introduce/tab_khaosat_thamvan/tab_survey_favourite.dart';
import 'package:sumary_app/screens/introduce/tab_khaosat_thamvan/tab_survey_fields.dart';
import 'package:sumary_app/screens/main2.dart';
import 'package:sumary_app/screens/menu/elective/search_detail.dart';
import 'package:sumary_app/screens/menu/library/widget/widget_book_detail.dart';
import 'package:sumary_app/screens/menu/library/widget/write_a_review.dart';
import 'package:sumary_app/screens/notification/notification.dart';
import 'package:sumary_app/screens/notification/notification_detail.dart';
import 'package:sumary_app/screens/payment_method/pay_pack.dart';
import 'package:sumary_app/screens/payment_method/pay_retail.dart';
import 'package:sumary_app/screens/screens.dart';
import 'package:sumary_app/screens/service_pack_TamSach/pack.dart';
import 'package:sumary_app/src/base.dart';
import 'package:sumary_app/src/messages.dart';
import 'package:sumary_app/src/router.dart';
import 'package:sumary_app/storages/storages.dart';
import 'api_resfull/api.dart';
import 'bloc/Filter_product/filter_product_bloc.dart';
import 'bloc/Filter_product_1/filter_product_1_bloc.dart';
import 'bloc/avg_rate/avg_rate_bloc.dart';
import 'bloc/blocs.dart';
import 'bloc/create_rate_product/create_rate_product_bloc.dart';
import 'bloc/detail_banking/detail_banking_bloc.dart';
import 'bloc/filter_Apophthgan/filter_Apophthgan_bloc.dart';
import 'bloc/get_content_file_pdf/get_content_file_pdf_bloc.dart';
import 'bloc/intro/intro_bloc.dart';
import 'bloc/like_quote/like_quote_bloc.dart';
import 'bloc/list_armorial/list_armorial_bloc.dart';
import 'bloc/list_book_done/list_book_done_bloc.dart';
import 'bloc/list_book_reading/list_book_reading_bloc.dart';
import 'bloc/list_book_same/list_book_same_bloc.dart';
import 'bloc/list_book_top_view/list_book_top_view_bloc.dart';
import 'bloc/list_categories/fitlter_category_bloc.dart';
import 'bloc/list_history_advise/list_history_advise_bloc.dart';
import 'bloc/list_history_affiliate/list_history_affiliate_bloc.dart';
import 'bloc/list_history_appellation/list_history_appellation_bloc.dart';
import 'bloc/list_history_wallet/list_history_wallet_bloc.dart';
import 'bloc/list_offer_package/list_offer_package_bloc.dart';
import 'bloc/list_product_by_categories/list_product_by_categories_bloc.dart';
import 'bloc/list_quote/list_quote_bloc.dart';
import 'bloc/list_quote_view/list_quote_view_bloc.dart';
import 'bloc/login_facebook/login_facebook_bloc.dart';
import 'bloc/mood_and_reason/mood_and_reason_bloc.dart';
import 'bloc/my_rank_member/my_rank_member_bloc.dart';
import 'bloc/read_noti/read_noti_bloc.dart';
import 'bloc/save_quote/save_quote_bloc.dart';
import 'bloc/search/search_bloc.dart';
import 'bloc/unsave_book/unsave_book_bloc.dart';
import 'bloc/updateProfile/update_profile_bloc.dart';
import 'firebase_options.dart';
import 'screens/account_information/information_list/about_us.dart';
import 'screens/chapter_detail/make_a_question2.dart';
import 'screens/menu/armorial_page.dart';
import 'screens/register/otp_register.dart';
import 'screens/register/register_screen.dart';

// Quyen sua 20/7

Future main() async {
  Bloc.observer = SimpleBlocObserver();
  await dotenv.load(fileName: BASE_URL.ENV);
  shareLocal = await ShareLocal.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  UserRepository userRepository = UserRepository();
  await GetStorage.init();
  await Firebase.initializeApp(
    name: "app",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  FlutterDownloader.registerCallback(callBack);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  // const AndroidNotificationChannel channel=AndroidNotificationChannel('high_importance_channel', 'xxxx',importance: Importance.max);
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  // await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.createNotificationChannel(channel);
  // var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
  // var initializationSettingsIOS = new IOSInitializationSettings();
  // var initializationSettings = new InitializationSettings(
  //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  // flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (String? x){});
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');
  //   RemoteNotification notification=message.notification!;
  //   AndroidNotification androidNotification=message.notification!.android!;

  //   if (notification!=null && androidNotification!=null) {
  //     var androidPlatformChannelSpecifics =const AndroidNotificationDetails(
  //         'channel_ID', 'channel name',
  //         importance: Importance.max,
  //         playSound: true,
  //         showProgress: true,
  //         priority: Priority.high,
  //         ticker: 'test ticker');

  //     var iOSChannelSpecifics = const IOSNotificationDetails();
  //     var platformChannelSpecifics = NotificationDetails(
  //         android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);
  //     await flutterLocalNotificationsPlugin
  //         .show(0, notification.title, notification.body, platformChannelSpecifics, payload: 'test');
  //   }
  // });
  // if (defaultTargetPlatform == TargetPlatform.android) {}
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: userRepository,
            localRepository: const EventRepositoryStorage(),
          )..add(AuthenticationStateInit()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              userRepository: userRepository,
              localRepository: const EventRepositoryStorage(),
            ),
          ),
          BlocProvider<LoginFacebookBloc>(
            create: (context) => LoginFacebookBloc(
              userRepository: userRepository,
              localRepository: const EventRepositoryStorage(),
            ),
          ),
          BlocProvider<LoginGoogleBloc>(
            create: (context) => LoginGoogleBloc(
              userRepository: userRepository,
              localRepository: const EventRepositoryStorage(),
            ),
          ),
          BlocProvider<ChangePasswordBloc>(
            create: (context) => ChangePasswordBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(
              userRepository: userRepository,
              localRepository: const EventRepositoryStorage(),
            ),
          ),
          BlocProvider<ForgotPasswordBloc>(
            create: (context) => ForgotPasswordBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ListBackgroundBloc>(
            create: (context) => ListBackgroundBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ForgotPasswordOTPBloc>(
            create: (context) => ForgotPasswordOTPBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ResetPasswordBloc>(
            create: (context) => ResetPasswordBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<UpdateProfileBloc>(
            create: (context) => UpdateProfileBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<MoodAndReasonBloc>(
            create: (context) => MoodAndReasonBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<ForgotPasswordBloc>(
            create: (context) => ForgotPasswordBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider<InfoUserBloc>(
            create: (context) => InfoUserBloc(
                userRepository: userRepository,
                localRepository: const EventRepositoryStorage(),
                context: context),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(userRepository: userRepository),
          ),
          BlocProvider<FilterApophthganBloc>(
            create: (context) =>
                FilterApophthganBloc(userRepository: userRepository),
          ),
          BlocProvider<OTPRegisterBloc>(
            create: (context) =>
                OTPRegisterBloc(userRepository: userRepository),
          ),
          BlocProvider<UserInfoBloc>(
            create: (context) => UserInfoBloc(userRepository: userRepository),
          ),
          BlocProvider<GetListCategoriesBloc>(
            create: (context) =>
                GetListCategoriesBloc(userRepository: userRepository),
          ),
          BlocProvider<GetListNotificationBloc>(
            create: (context) =>
                GetListNotificationBloc(userRepository: userRepository),
          ),
          BlocProvider<GetListProductByCategoriesBloc>(
            create: (context) =>
                GetListProductByCategoriesBloc(userRepository: userRepository),
          ),
          BlocProvider<DetailProductBloc>(
            create: (context) =>
                DetailProductBloc(userRepository: userRepository),
          ),
          BlocProvider<ListRateProductBloc>(
            create: (context) =>
                ListRateProductBloc(userRepository: userRepository),
          ),
          BlocProvider<FilterProduct1Bloc>(
            create: (context) =>
                FilterProduct1Bloc(userRepository: userRepository),
          ),
          BlocProvider<FilterProduct2Bloc>(
            create: (context) =>
                FilterProduct2Bloc(userRepository: userRepository),
          ),
          BlocProvider<ListHistoryAffiliateBloc>(
            create: (context) =>
                ListHistoryAffiliateBloc(userRepository: userRepository),
          ),
          BlocProvider<ListHistoryAppellationBloc>(
            create: (context) =>
                ListHistoryAppellationBloc(userRepository: userRepository),
          ),
          BlocProvider<ReadNotiBloc>(
            create: (context) => ReadNotiBloc(userRepository: userRepository),
          ),
          BlocProvider<CreateRateBloc>(
            create: (context) => CreateRateBloc(userRepository: userRepository),
          ),
          BlocProvider<ListIssueBloc>(
            create: (context) => ListIssueBloc(userRepository: userRepository),
          ),
          BlocProvider<CreateAdviseBloc>(
            create: (context) =>
                CreateAdviseBloc(userRepository: userRepository),
          ),
          BlocProvider<ContentTermsBloc>(
            create: (context) =>
                ContentTermsBloc(userRepository: userRepository),
          ),
          BlocProvider<UnreadNotifiBloc>(
            create: (context) =>
                UnreadNotifiBloc(userRepository: userRepository),
          ),
          BlocProvider<DetailProductViewBloc>(
            create: (context) =>
                DetailProductViewBloc(userRepository: userRepository),
          ),
          BlocProvider<FilterProductBloc>(
            create: (context) =>
                FilterProductBloc(userRepository: userRepository),
          ),
          BlocProvider<CategorySelectBloc>(
            create: (context) =>
                CategorySelectBloc(userRepository: userRepository),
          ),
          BlocProvider<ContentFAQBloc>(
            create: (context) => ContentFAQBloc(userRepository: userRepository),
          ),
          BlocProvider<ContentContactBloc>(
            create: (context) =>
                ContentContactBloc(userRepository: userRepository),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(userRepository: userRepository),
          ),
          BlocProvider<SearchPopularBloc>(
            create: (context) =>
                SearchPopularBloc(userRepository: userRepository),
          ),
          BlocProvider<SaveBookBloc>(
            create: (context) => SaveBookBloc(userRepository: userRepository),
          ),
          BlocProvider<UnsaveBookBloc>(
            create: (context) => UnsaveBookBloc(userRepository: userRepository),
          ),
          BlocProvider<ListBookSaveBloc>(
            create: (context) =>
                ListBookSaveBloc(userRepository: userRepository),
          ),
          BlocProvider<ListAskBloc>(
            create: (context) => ListAskBloc(userRepository: userRepository),
          ),
          BlocProvider<CreateAskBloc>(
            create: (context) => CreateAskBloc(userRepository: userRepository),
          ),
          BlocProvider<ContentFileBloc>(
            create: (context) =>
                ContentFileBloc(userRepository: userRepository),
          ),
          BlocProvider<ListBookBoughtBloc>(
            create: (context) =>
                ListBookBoughtBloc(userRepository: userRepository),
          ),
          BlocProvider<BuyBookBloc>(
            create: (context) => BuyBookBloc(userRepository: userRepository),
          ),
          BlocProvider<MyRankBloc>(
            create: (context) => MyRankBloc(userRepository: userRepository),
          ),
          BlocProvider<ListRankMemberBloc>(
            create: (context) =>
                ListRankMemberBloc(userRepository: userRepository),
          ),
          BlocProvider<BuyRankMemberBloc>(
            create: (context) =>
                BuyRankMemberBloc(userRepository: userRepository),
          ),
          BlocProvider<HideGGFBBloc>(
            create: (context) => HideGGFBBloc(userRepository: userRepository),
          ),
          BlocProvider<MyArmorialBloc>(
            create: (context) => MyArmorialBloc(userRepository: userRepository),
          ),
          BlocProvider<ListDataBankingBloc>(
            create: (context) =>
                ListDataBankingBloc(userRepository: userRepository),
          ),
          BlocProvider<DetailDataBankingBloc>(
            create: (context) =>
                DetailDataBankingBloc(userRepository: userRepository),
          ),
          BlocProvider<ListHistoryWalletBloc>(
            create: (context) =>
                ListHistoryWalletBloc(userRepository: userRepository),
          ),
          BlocProvider<ListHistoryRechargeBloc>(
            create: (context) =>
                ListHistoryRechargeBloc(userRepository: userRepository),
          ),
          BlocProvider<ListArmorialBloc>(
            create: (context) =>
                ListArmorialBloc(userRepository: userRepository),
          ),
          BlocProvider<IntroBloc>(
            create: (context) => IntroBloc(userRepository: userRepository),
          ),
          BlocProvider<GetReferralBloc>(
            create: (context) =>
                GetReferralBloc(userRepository: userRepository),
          ),
          BlocProvider<AvgRateBloc>(
            create: (context) => AvgRateBloc(userRepository: userRepository),
          ),
          BlocProvider<ListHistoryAdviseBloc>(
            create: (context) => ListHistoryAdviseBloc(userRepository: userRepository),
          ),
          BlocProvider<ListBookTopViewBloc>(
            create: (context) => ListBookTopViewBloc(userRepository: userRepository),
          ),
          BlocProvider<ListBookReadingBloc>(
            create: (context) => ListBookReadingBloc(userRepository: userRepository),
          ),
          BlocProvider<ListBookRecommendBloc>(
            create: (context) => ListBookRecommendBloc(userRepository: userRepository),
          ),
          BlocProvider<ListBookSameBloc>(
            create: (context) => ListBookSameBloc(userRepository: userRepository),
          ),
          BlocProvider<ListBannerBloc>(
            create: (context) => ListBannerBloc(userRepository: userRepository),
          ),
          BlocProvider<ListBookDoneBloc>(
            create: (context) => ListBookDoneBloc(userRepository: userRepository),
          ),
          BlocProvider<ListQuoteBloc>(
            create: (context) => ListQuoteBloc(userRepository: userRepository),
          ),
          BlocProvider<ListQuoteViewBloc>(
            create: (context) => ListQuoteViewBloc(userRepository: userRepository),
          ),
          BlocProvider<LikeQuoteBloc>(
            create: (context) => LikeQuoteBloc(userRepository: userRepository),
          ),
          BlocProvider<LikeRateBloc>(
            create: (context) => LikeRateBloc(userRepository: userRepository),
          ),
          BlocProvider<SaveQuoteBloc>(
            create: (context) => SaveQuoteBloc(userRepository: userRepository),
          ),
          BlocProvider<ListRateProductViewBloc>(
            create: (context) => ListRateProductViewBloc(userRepository: userRepository),
          ),
          BlocProvider<ListOfferPackageBloc>(
            create: (context) => ListOfferPackageBloc(userRepository: userRepository),
          ),
          BlocProvider<CheckChapterDoneBloc>(
            create: (context) => CheckChapterDoneBloc(userRepository: userRepository),
          ),
          BlocProvider<DoneBookBloc>(
            create: (context) => DoneBookBloc(userRepository: userRepository),
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NunitoSans'),
      title: MESSAGES.APP_TITLE,
      initialRoute: ROUTE_NAMES.SPLASH,
      getPages: [
        GetPage(
          name: ROUTE_NAMES.MAIN,
          page: () => MainScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.MAIN2,
          page: () => Main2Screen(),
        ),
        // GetPage(
        //   name: ROUTE_NAMES.TEST,
        //   page: () => MyHomePage(),
        // ),
        GetPage(
          name: ROUTE_NAMES.INTRO,
          page: () => const IntroducePage(),
        ),
        GetPage(
          name: ROUTE_NAMES.INTRO_1,
          page: () => const IntroSurvey(),
        ),
        GetPage(
          name: ROUTE_NAMES.ACCOUNT_DETAIL,
          page: () => const AccountDetail(),
        ),
        GetPage(
          name: ROUTE_NAMES.SPLASH,
          page: () => SplashPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.MARKETING,
          page: () => const MarketingScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.EVENT,
          page: () => const EventScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.LOGIN,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.REGISTER_PAGE,
          page: () => RegisterScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.FORGOT_PASSWORD,
          page: () => ForgotPasswordScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.FORGOT_PASSWORD_OTP,
          page: () => ForgotPasswordOTPScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.OTP_REGISTER,
          page: () => OTP_RegisterScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.FORGOT_PASSWORD_RESET,
          page: () => ForgotPasswordResetScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.INFO,
          page: () => const InforScreenMain(),
        ),
        GetPage(
          name: ROUTE_NAMES.CHANGE_PASS,
          page: () => const ChangePass(),
        ),
        GetPage(
          name: ROUTE_NAMES.ABOUT_US,
          page: () => const AboutUs(),
        ),
        GetPage(
          name: ROUTE_NAMES.TERM,
          page: () => const TermScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.QUESTION,
          page: () => const Question(),
        ),
        GetPage(
          name: ROUTE_NAMES.HISTORY,
          page: () => const HistoryScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.RANK_MEMBER,
          page: () => const RankMember(),
        ),
        GetPage(
          name: ROUTE_NAMES.TOP_UP,
          page: () => const TopUp(),
        ),
        GetPage(
          name: ROUTE_NAMES.TOP_UP_DETAIL,
          page: () => const TopUpDetail(),
        ),
        GetPage(
          name: ROUTE_NAMES.BOOK_DETAIL,
          page: () => const BookDetail(),
        ),
        GetPage(
          name: ROUTE_NAMES.ARMORIAL_PAGE,
          page: () => const ArmorialPage(),
        ),
        GetPage(
          name: ROUTE_NAMES.NOTIFICATION_SCREEN,
          page: () => const NotificationScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.NOTIFICATION_DETAIL,
          page: () => const NotificationDetail(),
        ),
        GetPage(
          name: ROUTE_NAMES.WRITE_A_REVIEW,
          page: () => const WriteAReview(),
        ),
        // GetPage(
        //   name: ROUTE_NAMES.BOOK_DETAIL_MAIN,
        //   // page: () => BookDetail(),
        //   page: () => const BookDetailMain(),
        // ),
        GetPage(
          name: ROUTE_NAMES.BOOK_DETAIL_MAIN,
          page: () => const BookDetailNew(),
        ),
        GetPage(
          name: ROUTE_NAMES.CHAPTER_DETAIL,
          page: () => const ChapterDetailScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.MAKE_A_QUESTION,
          page: () => const MakeAQuestion(),
        ),
        GetPage(
          name: ROUTE_NAMES.MAKE_A_QUESTION2,
          page: () => const MakeAQuestion2(),
        ),
        GetPage(
          name: ROUTE_NAMES.SEARCH_SCREEN,
          page: () => const Search_Screen(),
        ),
        GetPage(
          name: ROUTE_NAMES.ADVISE_SCREEN,
          page: () => const AdviseScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.LIST_HISTORY_ADVISE,
          page: () => const ListHistoruAdvise(),
        ),
        GetPage(
          name: ROUTE_NAMES.DETAIL_HISTORY_ADVISE,
          page: () => const DetailHistoryAdvise(),
        ),
        GetPage(
          name: ROUTE_NAMES.AUDIO_SCREEN,
          page: () => const AudioScreen(),
        ),


        //Todo Kiet
        GetPage(
          name: ROUTE_NAMES.TAB_SURVEY_FIELDS,
          page: () => const Tab_Survey_Fields(),
        ),
        GetPage(
          name: ROUTE_NAMES.TAB_SURVEY_FIELDS_WIDGET,
          page: () => const Tab_Survey_Fields_Widget(),
        ),
        GetPage(
          name: ROUTE_NAMES.TAB_SURVEY_FAVORITE,
          page: () => const Tab_Survey_Favorite(),
        ),
        GetPage(
          name: ROUTE_NAMES.TAB_SURVEY_FAVORITE_WIDGET,
          page: () => const Tab_Survey_Favorite_Widget(),
        ),
        GetPage(
          name: ROUTE_NAMES.SEVICE_PACK1,
          page: () => const Sevice_Pack1(),
        ),
        GetPage(
          name: ROUTE_NAMES.INTRO_RECOMMMEND,
          page: () => const IntroRecommend(),
        ),

        GetPage(
          name: ROUTE_NAMES.LIBRARY_SURVEY,
          page: () => const Library_Survey(),
        ),
        GetPage(
          name: ROUTE_NAMES.LIBRARY_SURVEY_WIDGET,
          page: () => const Library_Survey_Widget(),
        ),
        GetPage(
          name: ROUTE_NAMES.CONSULTATION_SURVEY,
          page: () => const Consultation_Survey(),
        ),
        GetPage(
          name: ROUTE_NAMES.CONSULTATION_SURVEY_WIDGET,
          page: () => const Consultation_Survey_Widget(),
        ),
        GetPage(
          name: ROUTE_NAMES.PAY_PACK,
          page: () => const Pay_Pack(),
        ),
        GetPage(
          name: ROUTE_NAMES.PAY_RETAIL,
          page: () => const Pay_Retail(),
        ),
      ],
    );
  }
}

void callBack(String id, DownloadTaskStatus status, int progress) {
  print(status.toString());
}
