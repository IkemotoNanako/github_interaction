import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_interaction/ui/search/view_model/search_page_notifier.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final state = ref.watch(searchNotifierProvider);
    final notifier = ref.watch(searchNotifierProvider.notifier);
    final accounts = state.accounts;

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'input account name',
              ),
              onChanged: (value) {
                print(value);
                notifier.searchAccount(value);
              },
            ),
          ),
          accounts.isEmpty
              ? const Center(
                  child: Text('no result'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(accounts[index].iconUrl),
                      ),
                      title: Text(accounts[index].name),
                      subtitle: Text(accounts[index].id),
                      onTap: () {
                        print(accounts[index].id);
                        context.go('/search/details');
                      },
                    );
                  },
                )
        ],
      )),
    );
  }
}
