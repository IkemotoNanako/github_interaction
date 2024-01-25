import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_interaction/core/account.dart';
import 'package:github_interaction/repository/search/search_repository.dart';
import 'package:http/http.dart' as http;

final SearchRepositoryProvider =
    Provider<SearchRepository>((ref) => SearchRepositoryImpl());

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl();

  @override
  Future<List<Account>> fetch(String query) async {
    try {
      final responses = await http.get(
        Uri.https(
          'api.github.com',
          '/search/users',
          {'q': query},
        ),
      );
      Map<String, dynamic> accounts = json.decode(responses.body);
      return Future.value(
        accounts['items']
            .map<Account>((account) => Account(
                  id: account['id'].toString(),
                  name: account['login'],
                  iconUrl: account['avatar_url'],
                ))
            .toList(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
