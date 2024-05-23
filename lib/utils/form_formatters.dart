import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormFormatters {
  static MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
      mask: '+48 ### ### ###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);
  static MaskTextInputFormatter postalCodeFormatter = MaskTextInputFormatter(
      mask: '##-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);
}
