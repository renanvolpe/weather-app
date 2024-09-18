import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/utils/failure.dart';


//TODO to make like dioService that separete sqlite proccess from code
abstract class SqliteService {
  Future<Either<dynamic, dynamic>> get({required String table, Map<String, String>? params});
  Future<Either<dynamic, dynamic>> post({required String table, required body});
  Future<Either<dynamic, dynamic>> put({required String table, required Map body, String? token});
  Future<Either<dynamic, dynamic>> delete({required String table, required Map body});
  Future<Either<dynamic, dynamic>> patch({required String table, required Map body, String? token});
}

class SqliteClient implements SqliteService {
  Database database;

  SqliteClient({
    required this.database,
  });

  @override
  Future<Either> delete({required String table, required Map body}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<dynamic>>> get({required String table, Map<String, String>? params}) async {
    var response = await database.query(table);
    if (response.isEmpty) {
      return const Left(ServerFailure());
    }
    return Right(response);
  }

  @override
  Future<Either> patch({required String table, required Map body, String? token}) {
    throw UnimplementedError();
  }

  @override
  Future<Either> post({required String table, required body}) async {
    var response = await database.insert(table, body);
    return Right(response);
  }

  @override
  Future<Either> put({required String table, required Map body, String? token}) {
    throw UnimplementedError();
  }
}
