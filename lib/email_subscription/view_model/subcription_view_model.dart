import 'dart:async';

import 'package:email_validator/email_validator.dart';

abstract class SubscriptionViewModel {
  Sink get inputMailText;

  Stream<bool> get outputIsButtonEnabled;

  Stream<String> get outputErrorText;

  void dispose();
}

class SubscriptionViewModelImpl implements SubscriptionViewModel {
  StreamController<String> _mailTextController =
      StreamController<String>.broadcast();

  @override
  void dispose() => _mailTextController.close();

  @override
  Sink get inputMailText => _mailTextController;

  @override
  Stream<String> get outputErrorText => outputIsButtonEnabled.map((isEnabled) => isEnabled ? null : "Invalid Email");

  @override
  Stream<bool> get outputIsButtonEnabled => _mailTextController.stream.map((email) => EmailValidator.validate(email));  
}
