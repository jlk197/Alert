import 'package:alert/models/entities/contact_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  Future<void> sendSMS(List<ContactEntity> contacts, String message) async {
    var recivers = contacts.map((e) => e.number).toList();
    final Uri uri = Uri(
      scheme: 'sms',
      path: recivers.join(";"),
      queryParameters: <String, String>{
        'body': message,
      },
    );
    await launchUrl(uri);
  }

  Future<void> callForHelp() async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: "112",
    );
    await launchUrl(uri);
  }
}
