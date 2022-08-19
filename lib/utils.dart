import 'package:intl/intl.dart';




  checkEmailRegex({required String email}) {
    return RegExp(r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+").hasMatch(email);
  }
  checkNickNameRegex({required String nickName, required int min, required int max}) {
    return RegExp(r'\\w[a-zA-Z가-힣\d]{"$min","$max"}\$').hasMatch(nickName);
  }

  // static bool checkSMSCodeRegex({required String code}) {
  //   return GetUtils.isLengthEqualTo(code, 6);
  // }

  // static bool checkPasswordRegex({required String password}) {
  //   String regex = r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&.])[A-Za-z\d$@$!%*#?&.]{8,20}$";
  //   return GetUtils.hasMatch(password, regex);
  // }

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


