import 'dart:math';

class Password {
  final letterLowerCase = 'abcdefghijklmnopqrstuvwxyz';
  final letterUpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final number = '0123456789';
  final specialCharacter = '@#%*/+>\\\$@?/[]=()&|';

  final random = Random.secure();

  String generatePassword(int lengthPassword, int minimumSpecialCharacter) {
    final allValidCharacters = '$letterLowerCase$letterUpperCase$number';

    var rest = [
      for (var i = 0; i < lengthPassword; i++)
        allValidCharacters[random.nextInt(allValidCharacters.length)]
    ];

    print(rest);

    var specialsCharacters = [
      for (var i = 0; i < minimumSpecialCharacter; i++)
        specialCharacter[random.nextInt(specialCharacter.length)]
    ];

    print(specialsCharacters);

    return ((specialsCharacters + rest)..shuffle(random)).join();
  }
}
