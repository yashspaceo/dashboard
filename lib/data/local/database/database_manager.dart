import 'database.dart';
import 'entity/user.dart';

/// Database manager to store and retrieve data from local database
class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal();

  late AppDatabase _appDatabase;

  /// Initialize database
  init() async {
    _appDatabase =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build(); //todo apply your database name here
    return _appDatabase;
  }

  /// Add user into user table
  void addUser(User user) {
    final userDao = _appDatabase.userDao;
    userDao.insertUser(user);
  }

  /// Get all user list stored into user table
  Future<List<User>> getAllUsers() {
    return _appDatabase.userDao.findAllUsers();
  }

  /// Get all user list stored into user table
  Future<void> removeUserById(int userId) {
    return _appDatabase.userDao.deleteUserById(userId);
  }

  /// Remove all users from table
  Future<void> removeAllUsers() {
    return _appDatabase.userDao.deleteAllUsers();
  }
}
