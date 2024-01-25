import 'package:github_interaction/core/account.dart';

abstract class SearchRepository {
  Future<List<Account>> fetch(String query);
}
