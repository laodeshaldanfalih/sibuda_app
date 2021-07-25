import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/page/_page.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
import 'package:common/config/_config.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/providers.dart';
import 'package:common/util/navigations.dart' as nav_ext;
import 'package:common/value/const_values.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/di/kehamilanku_vm_di.dart';
import 'package:kehamilanku/ui/chart/mother_chart_page.dart';
import 'package:kehamilanku/ui/chart/mother_preg_eval_chart_menu_page.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_page.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_page.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_popup_page.dart';
import 'package:kehamilanku/ui/pregnancy_check/kehamilanku_trimester_form_page.dart';


class KehamilankuRoutes extends ModuleRoute {
  KehamilankuRoutes._() : super(GlobalRoutes.manager);
  static final obj = KehamilankuRoutes._();

  @override
  SibRoute get entryPoint => kehamilankuHomePage;

  @override
  final String name = GlobalRoutes.kehamilanku;

  @override
  Set<SibRoute> get routes => {
    kehamilankuHomePage,
  };


  static final kehamilankuHomePage = SibRoute("KehamilankuHomePage", KehamilankuHomePage, (ctx) => MainFrame(
    body: KehamilankuHomePage().inVmProvider([
      (ctx) => KehamilankuVmDi.kehamilankuHomeVm(context: ctx),
    ]),
  ));
  static final pregnancyCheckPage = _PregnancyCheckPageRoute.obj;
  static final immunizationPage = _PregnancyImmunizationPageRoute.obj;

  static final pregEvalChartMenuPage = _PregnancyEvalChartMenuPageRoute.obj;
  static final chartPage = _MotherChartPageRoute.obj;

  // ================= POPUP ================
  static final immunizationPopup = _PregnancyImmunizationPopupRoute.obj;
}


class _PregnancyCheckPageRoute {
  _PregnancyCheckPageRoute._();
  static final obj = _PregnancyCheckPageRoute._();

  void go({
    required BuildContext context,
    required MotherTrimester data,
    required ProfileCredential pregnancyCred,
  }) {
    final SibRoute _route = SibRoute("PregnancyCheckPage", KehamilankuTrimesterFormPage, (ctx) {
      final FormGroupInterceptor? interceptor = ConfigUtil.formInterceptor;
      return MainFrame(
        body: FormFaker(
          interceptor: interceptor,
          child: KehamilankuTrimesterFormPage(interceptor: interceptor,).inVmProvider([
                (ctx) => KehamilankuVmDi.checkFormVm(
                  context: ctx,
                  pregnancyCred: pregnancyCred,
                ),
          ]),
        ),
      );
    });
    _route.goToPage(context, args: {Const.KEY_TRIMESTER : data});
  }
}

class _PregnancyImmunizationPageRoute {
  _PregnancyImmunizationPageRoute._();
  static final obj = _PregnancyImmunizationPageRoute._();

  void go({
    required BuildContext context,
    required ProfileCredential pregnancyCred,
  }) {
    final route = SibRoute("PregnancyImmunizationPage", PregnancyImmunizationPage, (ctx) => MainFrame(
      body: PregnancyImmunizationPage().inVmProvider([
            (ctx) => KehamilankuVmDi.immunizationVm(
              context: ctx,
              pregnancyCred: pregnancyCred
            ),
      ]),
    ));
    route.goToPage(context);
  }
}

class _PregnancyImmunizationPopupRoute {
  _PregnancyImmunizationPopupRoute._();
  static final obj = _PregnancyImmunizationPopupRoute._();
/*
  final SibRoute _route = SibRoute("PregnancyImmunizationPopup", PregnancyImmunizationPopupPage, (ctx) => MainFrame(
    body: PregnancyImmunizationPopupPage().inVmProvider([
          (ctx) => KehamilankuVmDi.immunizationVm,
    ]),
  ));
 */
  /// Returns future String. String is for date confirmation. If null, then
  /// it means the confirmation is not successful.
  Future<String?> popup({
    required BuildContext context,
    required ImmunizationData immunization,
    required ProfileCredential pregnancyCred,
  }) {
    //_route.goToPage(context, args: {Const.KEY_TRIMESTER : data});
    final _route = SibRoute("PregnancyImmunizationPopup", PregnancyImmunizationPopupPage, (ctx) => MainFrame(
      body: PregnancyImmunizationPopupPage().inVmProvider([
            (ctx) => KehamilankuVmDi.immunizationPopupVm(
              immunization: immunization,
              context: ctx,
              pregnancyCred: pregnancyCred,
            ),
      ]),
    ));
    return _route.showAsDialog<String>(context);
  }
  void backPage(BuildContext context, String? date) {
    nav_ext.backPage(context, result: date);
  }
}

class _PregnancyEvalChartMenuPageRoute {
  _PregnancyEvalChartMenuPageRoute._();
  static final obj = _PregnancyEvalChartMenuPageRoute._();

  void go({
    required BuildContext context,
    required ProfileCredential pregnancyCred,
  }) {
    final route = SibRoute("MotherPregEvalChartMenuPage", MotherPregEvalChartMenuPage, (ctx) => MainFrame(
      body: MotherPregEvalChartMenuPage().inVmProvider([
            (ctx) => KehamilankuVmDi.pregEvalChartMenuVm(
              context: ctx,
              pregnancyCred: pregnancyCred,
            ),
      ]),
    ));
    route.goToPage(context);
  }
}

class _MotherChartPageRoute {
  _MotherChartPageRoute._();
  static final obj = _MotherChartPageRoute._();

  void go({
    required BuildContext context,
    required MotherChartType type,
    required ProfileCredential pregnancyCred,
  }) {
    final _route = SibRoute("MotherChartPage", MotherChartPage, (ctx) => MainFrame(
      body: MotherChartPage().inVmProvider([
            (ctx) => KehamilankuVmDi.motherChartVm(
              context: ctx,
              pregnancyCred: pregnancyCred,
            ),
      ]),
    ));
    _route.goToPage(context, args: { Const.KEY_DATA: type });
  }
}