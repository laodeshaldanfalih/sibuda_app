import 'package:common/arch/di/usecase_di.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/material.dart';
import 'package:home/core/di/home_usecase_di.dart';
import 'package:home/ui/form_get_started/child_form_vm.dart';
import 'package:home/ui/form_get_started/children_count_vm.dart';
import 'package:home/ui/form_get_started/do_mother_have_pregnancy_vm.dart';
import 'package:home/ui/form_get_started/father_form_vm.dart';
import 'package:home/ui/form_get_started/get_started_form_main_vm.dart';
import 'package:home/ui/form_get_started/mother_form_vm.dart';
import 'package:home/ui/form_get_started/mother_hpl_vm.dart';
import 'package:home/ui/home/home_vm.dart';
import 'package:home/ui/home/notif_and_message_vm.dart';
import 'package:home/ui/login/login_vm.dart';
import 'package:home/ui/signup/sign_up_vm.dart';
import 'package:home/ui/splash/splash_vm.dart';

class HomeVmDi {
  HomeVmDi._();

  static SplashVm get splashVm => SplashVm(
    getCityList: UseCaseDi.getCityList,
    isLoggedInUseCase: UseCaseDi.isLoggedIn,
    initConfig: UseCaseDi.initConfig,
  );
  static GetStartedFormMainVm get getStartedFormMainVm => GetStartedFormMainVm(
    signUpAndRegisterOtherData: HomeUseCaseDi.signUpAndRegister,
    login: HomeUseCaseDi.login,
    initConfig: UseCaseDi.initConfig,
    //saveMotherHpl: HomeUseCaseDi.saveMotherHpl,
  );
  static SignUpFormVm get signUpFormVm => SignUpFormVm(HomeUseCaseDi.signUp);
  static LoginFormVm get loginFormVm => LoginFormVm(HomeUseCaseDi.login);
  static MotherFormVm get motherFormVm => MotherFormVm(HomeUseCaseDi.saveMotherData);
  static FatherFormVm get fatherFormVm => FatherFormVm(HomeUseCaseDi.saveFatherData);
  static MotherHplVm motherHplVm({
    BuildContext? context,
  }) => MotherHplVm(
    context: context,
    getMotherNik: UseCaseDi.getMotherNik,
    //saveMotherPregnancy: UseCaseDi.saveMotherPregnancy,
    saveMotherHpl: HomeUseCaseDi.saveMotherHpl,
  );
  static DoMotherHavePregnancyVm get doMotherHavePregnancyVm => DoMotherHavePregnancyVm(
    deleteCurrentMotherHpl: HomeUseCaseDi.deleteCurrentMotherHpl,
  );
  static ChildrenCountVm get childrenCountVm => ChildrenCountVm(
    //saveLastChildBirthDate: HomeUseCaseDi.saveLastChildBirthDate,
    saveChildrenCount: HomeUseCaseDi.saveChildrenCount,
  );
  static ChildFormVm childFormVm({
    BuildContext? context,
    LiveData<int>? childCount,
  }) => ChildFormVm(
    context: context,
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    childCount: childCount ?? MutableLiveData(1),
    saveChildrenData: HomeUseCaseDi.saveChildrenData,
  );
  static HomeVm homeVm({BuildContext? context,}) => HomeVm(
    context: context,
    getHomeMenuList: HomeUseCaseDi.getHomeMenuList,
    getHomeStatusList: HomeUseCaseDi.getHomeStatusList,
    getHomeTipsList: HomeUseCaseDi.getHomeTipsList,
    getMotherNik: UseCaseDi.getMotherNik,
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    getProfile: UseCaseDi.getProfile,
  );
  static NotifAndMessageVm notifAndMessageVm({BuildContext? context,}) => NotifAndMessageVm(
    context: context,
    getCurrentEmail: UseCaseDi.getCurrentEmail,
    getMessageList: HomeUseCaseDi.getMessageList,
    getNotifList: HomeUseCaseDi.getNotifList,
  );
}