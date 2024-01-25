import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_interaction/core/account.dart';
import 'package:github_interaction/model/search/search_state.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) => SearchNotifier(),
);

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(const SearchState());

  void searchAccount(String query) async {
    // 実際はここでAPIを叩くReposittoryを呼び出す
    final accounts = [
      const Account(
        name: 'name',
        iconUrl: 'https://avatars.githubusercontent.com/u/1?v=4',
        id: 'id',
      )
    ];
    state = state.copyWith(accounts: accounts);
  }
}
