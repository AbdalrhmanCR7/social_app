import 'package:flutter/material.dart';

import '../../../../core/utils/functions.dart';
import '../../../../core/widgets/auth_text_form_field.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/settings_repository.dart';

class EditUsernameDialog extends StatefulWidget {
  final void Function() whenComplete;
  final void Function() onStart;

  const EditUsernameDialog({
    super.key,
    required this.whenComplete,
    required this.onStart,
  });

  @override
  State<EditUsernameDialog> createState() => _EditUsernameDialogState();
}

class _EditUsernameDialogState extends State<EditUsernameDialog> {
  final SettingsRepository _settingsRepository = SettingsRepositoryImpl();
  final TextEditingController _fullNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text('Edit user name'),
      ),
      content: Form(
        key: _formKey,
        child: AuthTextFormField(
          horizontalPadding: 0,
          verticalPadding: 0,
          controller: _fullNameController,
          prefixIcon: Icons.person,
          labelText: 'Full Name',
          validator: (fullName) => usernameValidator(fullName),
        ),
      ),
      actions: [
        InkWell(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              widget.onStart();
              await _settingsRepository
                  .updateUserName(_fullNameController.text);
              widget.whenComplete();
            }
          },
          child: const Center(
            child: Text('Edit'),
          ),
        ),
      ],
    );
  }
}
