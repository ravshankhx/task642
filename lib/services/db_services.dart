import 'package:hive/hive.dart';
import 'package:task642/model/account_model.dart';
import 'package:task642/model/user_model.dart';

class HiveDB {
  var box = Hive.box("task_2");

  void storeUser(User user) async {
    box.put("user", user.toJson());
  }

  User loadUser() {
    var user = new User.fromJson(box.get('user'));
    return user;
  }

  void removeUser() async {
    box.delete("user");
  }

  //for account
  void storeAccount(Account account) async {
    box.put("account", account.toJson());
  }

  Account loadAccount() {
    var account = new Account.fromJson(box.get('account'));
    return account;
  }

  void removeAccount() async {
    box.delete("account");
  }
}
