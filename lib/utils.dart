import 'package:intl/intl.dart';

  checkEmailRegex({required String email}) {
    return RegExp(r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+").hasMatch(email);
  }
  checkNickNameRegex({required String nickName, required int min, required int max}) {
    return RegExp("^[ㄱ-ㅎ가-힣0-9a-zA-Z ]{$min,$max}\$").hasMatch(nickName.trim());
  }

  checkSMSCodeRegex({required String code, required int length}) {
    return RegExp("^[0-9]{$length}\$").hasMatch(code);
  }

  checkPasswordRegex({required String password, required int min, required int max}) {
    return RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@!%*#?~^,.&+=])[A-Za-z0-9@!%*#?~^,.&+=]{$min,$max}\$').hasMatch(password);
  }

  timeAgo({required DateTime dateTime,bool numericDates = true}) {
    final dateNow = DateTime.now();
    final difference = dateNow.difference(dateTime);
    if (difference.inDays >= 364) {
      return (difference.inDays ~/ 364) == 1 ? '1 year ago' : '${difference.inDays ~/ 364} years ago';
    } else if (difference.inDays >= 30) {
      return (difference.inDays ~/ 30) == 1 ? '1 month ago' : '${difference.inDays ~/ 30} month ago';
    } else if ((difference.inDays ~/ 7) >= 1) {
      return (difference.inDays ~/ 7) == 1 ? (numericDates) ? '1 week ago' : 'Last week' : '${difference.inDays ~/ 7} week ago';
    } else if (difference.inDays >= 1) {
      return difference.inDays == 1 ? (numericDates) ? '1 day ago' : 'Yesterday' : '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return difference.inHours == 1 ? (numericDates) ? '1 hour ago' : 'An hour ago' : '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return difference.inMinutes == 1 ? (numericDates) ? '1 minute ago' : 'A minute ago' : '${difference.inMinutes} minutes ago';
    } else if (difference.inSeconds >= 5) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  thousandToK (int value) {
    if(value > 999){
      double temp = value / 1000;
      var result = NumberFormat("###,###,###.#### k");
      return result.format(temp);
    } else {
      return value.toString();
    }
  }


