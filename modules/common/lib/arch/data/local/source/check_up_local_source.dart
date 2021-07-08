import 'package:common/arch/data/local/dao/check_up_dao.dart';
import 'package:common/arch/data/local/db/app_db.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';

mixin CheckUpLocalSrc {
  Future<Result<bool>> saveCheckUpId({
    required int id,
    required int period,
    required String nik,
  });
  Future<Result<int>> getCheckUpId({
    required int period,
    required String nik,
  });
}


class CheckUpLocalSrcImpl with CheckUpLocalSrc {
  final CheckUpIdDao _checkUpIdDao;
  CheckUpLocalSrcImpl({
    required CheckUpIdDao checkUpIdDao,
  }):
      _checkUpIdDao = checkUpIdDao
  ;

  @override
  Future<Result<bool>> saveCheckUpId({
    required int id,
    required int period,
    required String nik,
  }) async {
    try {
      final entity = CheckUpIdEntity(id: id, period: period, nik: nik);
      final rowId = await _checkUpIdDao.insert(entity);
      if(rowId < 0) {
        return Fail();
      }
      return Success(true);
    } catch(e) {
      return Fail(error: e);
    }
  }
  @override
  Future<Result<int>> getCheckUpId({
    required int period,
    required String nik,
  }) async {
    try {
      //prind("getCheckUpId() period = $period nik = $nik");
      final e = await _checkUpIdDao.getByNikAndPeriod(nik: nik, period: period);
      //prind("getCheckUpId() e = $e");
      if(e == null) {
        return Fail();
      }
      return Success(e.id);
    } catch(e, stack) {
      prine(e);
      prine(stack);
      return Fail(error: e);
    }
  }
}