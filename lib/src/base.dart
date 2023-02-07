// ignore: camel_case_types
class BASE_URL {
  BASE_URL._();

  static const GET_INFO_USER = 'api/user/profile';
  static const LOGIN = 'auth/login';
  static const LOGIN_GOOGLE = 'auth/login/google';
  static const LOGIN_FACEBOOK = 'auth/login/facebook';
  static const USER = 'profile';
  static const Avg_Rate = 'rate/product/average';
  static const REGISTER = 'auth/register';
  static const APOPHTHGAN = 'apophthgan';
  static const CATEGORY_SELECT = 'filter-product';
  static const OTP_RESEND_FORGOT = 'auth/forgot-resend-otp';
  static const OTP_RESEND_REGISTER = 'auth/register-resend-otp';
  static const OTP_REGISTER = 'auth/verify';
  static const UPDATE_FILE = 'upload';
  static const PROFILE = 'api/user/profile';
  static const FILE_BOOK = 'upload/get-file';
  static const LISY_BACKGROUND = 'background';
  static const MOOD_REASON = 'mood';
  static const FILTER_PRODUCT = 'product/category';
  static const EDIT_PROFILE = 'api/user/update-info-user';
  static const CHANGE_PASSWORD = 'api/user/change-password';
  static const FORGOT_PASSWORD = 'auth/forgot';
  static const OTP_FORGOT_PASSWORD = 'auth/forgot-verify';
  static const OTP_RESET_PASSWORD = 'api/user/vertify-otp';
  static const RESET_PASSWORD = 'auth/forgot-reset';
  static const FIRST_INTRODUCE = 'intro';
  static const INTRODUCE = 'api/user/introductions2';
  static const GET_LOGO = 'api/user/config-logo';
  static const GET_REFERRAL = 'auth/referral';
  static const GET_LIST_NEW = 'api/user/news';
  static const GET_LIST_DOCUMENTS = 'api/user/documentations';
  static const GET_LIST_COURSE = 'api/user/list-course';
  static const GET_MY_RANK = 'auth/my-membership';
  static const DETAIL_COURSE = 'api/user/detail-course';
  static const ORDER_COURSE = 'api/user/order';
  static const CHANGE_PASS = 'auth/change-password';
  static const LIST_CATEGORIES = 'category/user';
  static const LIST_PRODUCT = 'product';
  static const LIST_NOTIFICATION = 'notification/user';
  static const UNREAD_NOTIFICATION = 'notification/un-read';
  static const READ_NOTIFICATION = 'notification/read';
  static const CHECK_CHAPTER_DONE = 'product/marked-done-chaptet';
  static const DONE_BOOK = 'product/marked-done';
  static const DETAIL_PRODUCT = 'product';
  static const DETAIL_PRODUCT_VIEW = 'product/view';
  static const BUY_RANK_MEMBER = 'auth/upgrade-membership';
  static const RATE_PRODUCT = 'rate/product';
  static const RATE_PRODUCT_VIEW = 'rate/product/default';
  static const LIST_ISSUE = 'advisory/issue-type';
  static const LIST_RANK_MEMBER = 'membership';
  static const CREATE_ADVISE = 'advisory/request';
  static const CREATE_ASK = 'product';
  static const SAVE_BOOK = 'product';
  static const LIKE_QUOTE = 'quote/loved';
  static const LIKE_RATE = 'rate/change-loved-status';
  static const SAVE_QUOTE = 'quote/saved';
  static const BOOK_DONE = 'product/done';
  static const TOP_BOOK_VIEW = 'product/top-view';
  static const BOOK_RECOMMEND = 'product/recommend';
  static const BOOK_READING = 'product/recently-read-books';
  static const LIST_SAVE_BOOK = 'product/saved';
  static const LIST_BOOK_SAME = 'product/same';
  static const LIST_HISTORY = 'transaction';
  static const LIST_HISTORY_ADVISE = 'advisory/request-history';
  static const LIST_Armorial = 'appellation';
  static const LIST_BOUGHT_BOOK = 'my-book';
  static const CONTENT_CONTACT = 'content/contact';
  static const BANKING_LIST = 'banking/list';
  static const BANKING_DETAIL = 'banking';
  static const CONTENT_TERMS = 'content/terms';
  static const CONTENT_FAQ = 'content/faq';
  static const LIST_ASK = 'product';
  static const LIST_QUOTE = 'quote/product';
  static const LIST_QUOTE_VIEW = 'quote/product/default';
  static const HIDE_GG_FB = 'status';
  static const GET_ARMORIAL = 'auth/my-appellation';
  static const LIST_BANNER = 'banner';
  static const OFFER_PACKAGE = 'offer-package';

  static const SEARCH = 'product/search';
  static const SEARCH_POPULAR = 'product/search/popular';


  // receiveTimeout
  static const int receiveTimeout = 15000;

  static const ENV  = 'assets/.env';

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const content_type = 'Content-Type';
  static const application_json = 'application/json';
  ////////////////////////////////////////////////////////
  static const multipart_form_data = 'multipart/form-data';
  static const token = 'token';
  // static const auth_type = 'Authorization';
  ////////////////////////////////////////////////////////
  static String bearer(String token) => token;

  static const headerDemoKey = 'Demo-Header';
  static const headerDemoValue = 'demo header';

  static const SUCCESS = 0;
  static const SUCCESS_200 = 200;
  static const FAIL = 9100;

  static const ACTIVE = 1;
  static const LOCK = 0;
}
