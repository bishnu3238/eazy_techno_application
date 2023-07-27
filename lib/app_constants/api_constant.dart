const String host = "https://www.eazytechno.com";
const String path = "biocellar/admin/webservices";
const String dirt = "$host/$path";
const String imgDir = "$host/biocellar/admin/menu_image";


const String fetchTable = "$dirt/api_tables.php"; // get
const String pincodeApi = "http://www.postalpincode.in/api/pincode"; // get
const String filterApi = "$dirt/filter_data.php"; // ?category=[2,7]&brand=[]&price=[100,250];
const String saveAddressApi = "$dirt/save_address.php"; // post
const String getUserAddresses = "$dirt/get_user_addresses.php"; // get
const String signUpApi = "$dirt/signup.php"; // post
const String logInApi = "$dirt/login.php";
const String deleteUserApi = "$dirt/delete_user.php";
const String submitOrderApi = "$dirt/createOrder.php";

const String getUserOrdersApi = "$dirt/getOrders.php"; // post user_id

/// ----------------------------------------------------------------[parameters]
const String params1 = "/?table_name";
const String pCategory = "?category";
const String pBrand = "&brand";
const String pPrice = "&price";
const String pDiscount = "&discount";
const String pRating = "&rating";
const String pUserId = "?user_id";



const categoryImgDir = "https://eazytechno.com/biocellar/admin/category_images";
const brandImgDir = "https://eazytechno.com/biocellar/admin/category_images";
 const bannerImgDir =
    "https://eazytechno.com/biocellar/admin/slider_image"; // change to correct directory;
const itemImgDir = "$host/biocellar/admin/menu_image";


enum Api {
  fetchTables,
  pincodeApi,
  filterApi,
  saveAddressApi,
  getUserAddresses,
  signUpApi,
  logInApi,
  deleteUserApi,
  submitOrderApi,
  getUserOrdersApi
}
