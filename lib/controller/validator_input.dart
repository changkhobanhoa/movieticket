import 'package:email_validator/email_validator.dart';

class InputValidator {
  static String? comfirmPass(
      String username, String email, String pass, String comfirmPass) {
    if (username.isNotEmpty ||
        email.isNotEmpty ||
        pass.isNotEmpty ||
        comfirmPass.isNotEmpty ||
        pass.trim() == comfirmPass.trim() ||
        EmailValidator.validate(email)) {
      return null;
    }
   if(username.isNotEmpty){

   }else if(email.isNotEmpty){
    
   }
  }
}
