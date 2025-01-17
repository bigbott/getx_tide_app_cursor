
import 'package:appwrite/appwrite.dart';
import 'package:getx_tide_app_cursor/app/data/appwrite_function/secret_constants.dart';

final appwrite = _Appwrite();

class _Appwrite {

  static const APPWRITE_ENDPOINT = 'https://cloud.appwrite.io/v1';

   _Appwrite() {
     _initAppwrite();
   }
  
  late final Client client;
  late final Functions functions;


  void _initAppwrite() {
    client = Client()
        .setEndpoint(APPWRITE_ENDPOINT)
        .setProject(SecretConstants.APPWRITE_PROJECT_ID);
    functions = Functions(client);
  }

}