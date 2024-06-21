import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> sendEmail() async {
  const String username = 'ahmed.reda55767@gmail.com';
  const String password = 'bhvo yolh ybhz ykmo';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = const Address(username, 'Drip Alert')
    ..recipients.add(username)
    ..subject = 'Test Email from Flutter'
    ..text =
        'This is a test email sent from a Flutter app using the mailer package.';

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: $sendReport');
    print('email sent successfully');
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
// Future<void> sendInGmail() async {
//   try {
//     var message = Message();
//     var userEmail = 'ahmed.reda55767@gmail.com';
//     message.subject = 'testttttttt';
//     message.text = 'take an action before the water damage the infected place ';
//     message.from = Address(userEmail.toString());
//     message.recipients.add(userEmail);
//     var smtpServer = gmailRelaySaslXoauth2(userEmail, 'bhvo yolh ybhz ykmo');
//     send(message, smtpServer);
//     print('email sent successfully');
//   } catch (e) {
//     print(e.toString());
//   }
// }
