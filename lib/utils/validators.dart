class Validators {
  static const String _requiredFieldMessage = "Pole wymagane";

  static String? notEmptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return _requiredFieldMessage;
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value?.length == 15) {
      return null;
    }
    return _requiredFieldMessage;
  }

  static String? notEmptyDateValidator(DateTime? value) {
    if (value == null) {
      return _requiredFieldMessage;
    }
    return null;
  }

  static String? listValidator(List<String> value) {
    if (value.contains("")) {
      return _requiredFieldMessage;
    }
    return null;
  }

  static String? postalCodeValidator(String? value) {
    if (value?.length == 6) {
      return null;
    }
    return "Podaj prawidłowy kod pocztowy";
  }
}
