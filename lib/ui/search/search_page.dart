import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountInfo {
  final String name;
  final String id;
  final String iconUrl;

  const AccountInfo({
    required this.name,
    required this.id,
    required this.iconUrl,
  });
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final List<AccountInfo> accountInfo = [
      AccountInfo(
        name: 'Flutter',
        id: 'flutter',
        iconUrl: 'https://avatars.githubusercontent.com/u/14101776?v=4',
      )
    ];

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'アカウント名を入力してください',
              ),
              onChanged: (value) {
                print(value);
              },
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: accountInfo.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(accountInfo[index].iconUrl),
                ),
                title: Text(accountInfo[index].name),
                subtitle: Text(accountInfo[index].id),
                onTap: () {
                  print(accountInfo[index].id);
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
