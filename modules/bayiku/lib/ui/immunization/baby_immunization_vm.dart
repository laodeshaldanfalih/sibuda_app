import 'package:bayiku/core/domain/usecase/baby_immunization_use_case.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/model/immunization_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';

class BabyImmunizationVm extends AsyncVm {
  static const getImmunizationGroupsKey = "getImmunizationGroups";
  static const getImmunizationOverviewKey = "getImmunizationOverview";

  BabyImmunizationVm({
    required GetBabyImmunizationGroupList getBabyImmunizationGroupList,
    required GetBabyImmunizationOverview getBabyImmunizationOverview,
  }):
    _getBabyImmunizationGroupList = getBabyImmunizationGroupList,
    _getBabyImmunizationOverview = getBabyImmunizationOverview
  ;

  final GetBabyImmunizationGroupList _getBabyImmunizationGroupList;
  final GetBabyImmunizationOverview _getBabyImmunizationOverview;

  final MutableLiveData<List<UiImmunizationListGroup>> _immunizationGroups = MutableLiveData();
  final MutableLiveData<ImmunizationOverview> _overview = MutableLiveData();
  //final MutableLiveData<Tuple2<Expirable, bool>> _onConfirm = MutableLiveData();

  LiveData<List<UiImmunizationListGroup>> get immunizationGroups => _immunizationGroups;
  LiveData<ImmunizationOverview> get overview => _overview;
  //LiveData<Tuple2<Expirable, bool>> get onConfirm => _onConfirm;

  @override
  List<LiveData> get liveDatas => [_immunizationGroups, _overview];

  void getImmunizationGroups({
    required String babyNik,
    bool forceLoad = false,
  }) {
    if(!forceLoad && _immunizationGroups.value != null) return;
    startJob(getImmunizationGroupsKey, (isActive) async {
      _getBabyImmunizationGroupList(babyNik).then((value) {
        if(value is Success<List<ImmunizationDetailGroup>>) {
          final data = value.data.map((e) => UiImmunizationListGroup.fromDomainModel(e)).toList(growable: false);
          _immunizationGroups.value = data;
        }
      });
    });
  }
  void getImmunizationOverview({
    bool forceLoad = false,
  }) {
    if(!forceLoad && _overview.value != null) return;
    startJob(getImmunizationOverviewKey, (isActive) async {
      _getBabyImmunizationOverview().then((value) {
        if(value is Success<ImmunizationOverview>) {
          final data = value.data;
          _overview.value = data;
        }
      });
    });
  }

  void onConfirmSuccess({
    required int group,
    required int child,
    required BabyImmunizationPopupResult result,
  }) {
    final oldUiData = _immunizationGroups.value![group].immunizationList[child];
    final oldImmData = oldUiData.core;
    final oldImmDetail = oldUiData.detail;

    if(oldImmData.date != null) {
      prine("ImmunizationData at group '$group', child '$child' has already been confirmed.");
      return;
    }

    _immunizationGroups.value![group].immunizationList[child] = oldUiData.copy(
      core: oldImmData.copy(date: result.date),
      detail: oldImmDetail?.copy(batchNo: result.noBatch.toString()),
    );
    _immunizationGroups.notifyObservers();
  }
}