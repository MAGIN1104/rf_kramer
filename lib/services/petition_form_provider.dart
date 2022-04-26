import 'package:flutter/material.dart';
import 'package:rfk/models/PetitionModel.dart';

class PetitionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PetitionModel petition;
  PetitionFormProvider(this.petition);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
