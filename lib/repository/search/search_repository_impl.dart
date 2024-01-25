import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_interaction/core/account.dart';
import 'package:github_interaction/repository/search/search_repository.dart';

final SearchRepositoryProvider =
    Provider<SearchRepository>((ref) => SearchRepositoryImpl());

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl();

  @override
  Future<List<Account>> fetch() {
    return Future.value([
      Account(
        id: '1',
        name: 'name1',
        iconUrl: 'https://avatars.githubusercontent.com/u/1?v=4',
      ),
    ]);
  }
}
