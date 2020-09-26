import 'package:flutter/foundation.dart';
import 'package:twozerofoureight/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:twozerofoureight/domain/saved_board/data_source/saved_board_data_source.dart';
import 'package:twozerofoureight/domain/saved_board/facade/saved_board_facade.dart';
import 'package:twozerofoureight/domain/saved_board/models/saved_board.dart';
import 'package:twozerofoureight/infrastructure/saved_board/entities/saved_board_entity.dart';

class SavedBoardFacade extends ISavedBoardFacade {
  final ISavedBoardDataSource dataSource;

  SavedBoardFacade({@required this.dataSource});
  @override
  Future<Either<Error, Unit>> create(SavedBoard savedBoard) async {
    try {
      await dataSource.create(SavedBoardEntity.fromModel(savedBoard));
      return Right(unit);
    } catch (_) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, Unit>> delete(UniqueId id) async {
    try {
      await dataSource.delete(id.value);
      return Right(unit);
    } catch (_) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, List<SavedBoard>>> findAll() async {
    try {
      final entityList = await dataSource.findAll();
      return Right(entityList.map((entity) => entity.toModel()).toList());
    } catch (_) {
      return Left(Error());
    }
  }
}
