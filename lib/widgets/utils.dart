// import 'package:intl/intl.dart';

import 'dart:io';
import 'dart:math';

/// 이메일 정규표현식
checkEmailRegex({required String email}) {
  return RegExp(
      r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+").hasMatch(email);
}

checkPhoneNumberRegex({required String phoneNumber}) {
  return RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(phoneNumber);
}

/// 닉네임 정규표현식 한글, 영문, 숫자, 공백 최소 최대치
checkNickNameRegex(
    {required String nickName, required int min, required int max}) {
  return RegExp('^[ㄱ-ㅎ가-힣0-9a-zA-Z ]{$min,$max}\$').hasMatch(nickName.trim());
}

/// SMS 인증코드 정규표현식
checkSMSCodeRegex({required String code, required int length}) {
  return RegExp('^[0-9]{$length}\$').hasMatch(code);
}

/// 비밀번호 정규표현식 대,소문자 영문, 숫자, 특수문자 포함 n~n 자
checkPasswordRegex(
    {required String password, required int min, required int max}) {
  return RegExp(
          '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@!%*#?~^,.&+=])[A-Za-z0-9@!%*#?~^,.&+=]{$min,$max}\$')
      .hasMatch(password);
}

/// n시간전 등의 기능
timeAgo({required DateTime dateTime, bool numericDates = true}) {
  final dateNow = DateTime.now();
  final difference = dateNow.difference(dateTime);
  final isKr = (Platform.localeName == 'ko_KR');
  if (difference.inDays >= 364) {
    return (difference.inDays ~/ 364) == 1
        ? '1 ${isKr ? '년 전' : 'year ago'}'
        : '${difference.inDays ~/ 364}${isKr ? '년 전' : ' year ago'}';
  } else if (difference.inDays >= 30) {
    return (difference.inDays ~/ 30) == 1
        ? '1 ${isKr ? '개월 전' : 'month ago'}'
        : '${difference.inDays ~/ 30}${isKr ? '개월 전' : ' month ago'}';
  } else if ((difference.inDays ~/ 7) >= 1) {
    return (difference.inDays ~/ 7) == 1
        ? (numericDates)
            ? '1 ${isKr ? '주 전' : 'week ago'}'
            : isKr ? '저번 주' : 'Last week'
        : '${difference.inDays ~/ 7}${isKr ? '주 전' : ' week ago'}';
  } else if (difference.inDays >= 1) {
    return difference.inDays == 1
        ? (numericDates)
            ? '1${isKr ? '일 전' : ' day ago'}'
            : isKr ? '어제' : 'Yesterday'
        : '${difference.inDays}${isKr ? '일 전' : ' day ago'}';
  } else if (difference.inHours >= 1) {
    return difference.inHours == 1
        ? (numericDates)
            ? '1${isKr ? '시간 전' : ' hour ago'}'
            : 'An hour ago'
        : '${difference.inHours}${isKr ? '시간 전' : ' hour ago'}';
  } else if (difference.inMinutes >= 1) {
    return difference.inMinutes == 1
        ? (numericDates)
            ? isKr ? '1분 전' : '1 minute ago'
            : isKr ? '1분 전' : 'A minute ago'
        : '${difference.inMinutes}${isKr ? '분 전' : ' minutes ago'}';
  } else if (difference.inSeconds >= 5) {
    return '${difference.inSeconds}${isKr ? '초 전' : ' seconds ago'}';
  } else {
    return isKr ? '방금 전' : 'Just now';
  }
}

/// 1000 이상의 수 를 n K,M,B ... 로 바꿔주는 함수
thousandToK(int value) {
  if (value < 1000) return value.toString();

  if (value < 10000) {
    final s = (value / 1000).toStringAsFixed(1);
    if (s[s.length - 1] == '0') {
      return '${s.substring(0, s.length - 2)}K';
    }
    return '${s}K';
  }
  if (value < 1000000) {
    return '${(value / 1000).toStringAsFixed(1)}K';
  }

  if (value < 10000000) {
    final s = (value / pow(1000, 2)).toStringAsFixed(1);
    if (s[s.length - 1] == '0') {
      return '${s.substring(0, s.length - 2)}M';
    }
    return '${s}M';
  }

  if (value < 1000000000) {
    return '${(value / pow(1000, 2)).toStringAsFixed(1)}M';
  }

  if (value < 10000000000) {
    final s = (value / pow(1000, 3)).toStringAsFixed(1);
    if (s[s.length - 1] == '0') {
      return '${s.substring(0, s.length - 2)}B';
    }
    return '${s}B';
  }

  if (value < 1000000000000) {
    return '${(value / pow(1000, 3)).toStringAsFixed(1)}B';
  }

  if (value < 10000000000000) {
    final s = (value / pow(1000, 4)).toStringAsFixed(1);
    if (s[s.length - 1] == '0') {
      return '${s.substring(0, s.length - 2)}T';
    }
    return '${s}T';
  }

  if (value < 1000000000000000) {
    return '${(value / pow(1000, 4)).toStringAsFixed(1)}T';
  }

  return '${(value / pow(1000, 5)).toStringAsFixed(1)}Q';
}
