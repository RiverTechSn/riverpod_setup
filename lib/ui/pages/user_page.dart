import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_settup/core/models/api_error.dart';
import 'package:river_pod_settup/core/providers/user_provider.dart';
import 'package:river_pod_settup/ui/pages/create_user_page.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilisateurs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateUserPage()),
                ),
          ),
        ],
      ),
      body: usersAsync.when(
        data:
            (users) => ListView(
              children:
                  users
                      .map(
                        (user) => ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.email),
                        ),
                      )
                      .toList(),
            ),
        error: (error, _) {
          final err = error as ApiError;
          return Center(child: Text(err.message.join('\n')));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
