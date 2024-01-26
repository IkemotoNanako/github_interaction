import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_interaction/core/account.dart';
import 'package:github_interaction/repository/search/search_repository.dart';
import 'package:http/http.dart' as http;

final searchRepositoryProvider =
    Provider<SearchRepository>((ref) => SearchRepositoryImpl());

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl();

  @override
  Future<List<Account>> fetch(String query) async {
    final url = Uri.https(
      'api.github.com',
      '/search/users',
      {'q': query},
    );
    try {
      final responses = await http.get(url);
      if (responses.statusCode != 200) {
        throw Exception('Failed to fetch accounts');
      } else {
        final body = jsonDecode(responses.body);
        final List<dynamic> items = body['items'];
        final List<Account> accounts =
            items.map((dynamic item) => Account.fromJson(item)).toList();
        return accounts;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
