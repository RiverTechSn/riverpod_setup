import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_settup/core/models/api_error.dart';
import 'package:river_pod_settup/core/models/user_dto.dart';
import 'package:river_pod_settup/core/providers/user_provider.dart';

class CreateUserPage extends ConsumerWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final createUserState = ref.watch(createUserProvider);

    ref.listen(createUserProvider, (_, state) {
      state.whenOrNull(
        data: (user) {
          if (user != null) {
            Navigator.pop(context);
          }
        },
        error: (err, _) {
          final apiErr = err as ApiError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(apiErr.message.join('\n'))));
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Créer Utilisateur')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  createUserState.isLoading
                      ? null
                      : () {
                        final user = User(
                          name: nameCtrl.text,
                          email: emailCtrl.text,
                        );
                        ref.read(createUserProvider.notifier).create(user);
                      },
              child:
                  createUserState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Créer'),
            ),
          ],
        ),
      ),
    );
  }
}
