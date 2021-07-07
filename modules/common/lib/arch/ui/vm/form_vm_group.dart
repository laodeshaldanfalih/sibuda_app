import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/widget/form_generic_field.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/res/string/_string.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

/// This approach uses generic type of form (form that consists of text, check box, and radio)
/// and late approach (data about field is defined in runtime, not directly in this ViewModel).
mixin FormVmGroupMixin implements AsyncVm {
  static const submitFormKey = "submitForm";

  LiveData<bool> get isFormReady;

  List<MutableLiveData<FormUiGroupData>> get _fieldGroupList;
  //List<Map<String, MutableLiveData<bool>>> get _isResponseValidList;
  List<Map<String, MutableFormVmResponse>> get _responseGroupList;
  MutableLiveData<bool> get _canProceed;
  MutableLiveData<Result<String>> get _onSubmit;

  List<LiveData<FormUiGroupData>> get fieldGroupList => _fieldGroupList;
  /// Its map keys are [FormUiData.key].
  //List<Map<String, LiveData<bool>>> get isResponseValidList => _isResponseValidList;
  /// Its map keys are [FormUiData.key].
  List<Map<String, FormVmResponse>> get responseGroupList => _responseGroupList;
  LiveData<bool> get canProceed => _canProceed;
  LiveData<Result<String>> get onSubmit => _onSubmit;

  String defaultInvalidMsg = "not valid";

  bool isResponseInit(int groupPosition, String fieldKey) => _responseGroupList[groupPosition][fieldKey]!.isValid.value != null;
  dynamic getResponseWithKey(String key) => getResponseLiveDataWithKey(key).value;
  LiveData getResponseLiveDataWithKey(String key) {
    for(final respGroup in _responseGroupList) {
      for(final entry in respGroup.entries) {
        if(entry.key == key) {
          return entry.value.response;
        }
      }
    }
    throw "No such key '$key' in $runtimeType";
  }
  FormGroupResponse getResponse() {
    final respGroupList = <FormResponse>[];
    for(int i = 0; i < _responseGroupList.length; i++) {
      final respGroup = _responseGroupList[i];
      final header = _fieldGroupList[i].value!.header;
      final respMap = <String, dynamic>{};
      respGroupList.add(FormResponse(header: header, responses: respMap));

      if(mappedKey?.isNotEmpty == true) {
        for(final entry in respGroup.entries) {
          if(mappedKey!.contains(entry.key)) {
            respMap[entry.key] = mapResponse(i, entry.key, entry.value.response.value);
            //mappedKey.remove(entry.key);
          } else {
            respMap[entry.key] = entry.value.response.value;
          }
        }
      } else {
        for(final entry in respGroup.entries) {
          respMap[entry.key] = entry.value.response.value;
        }
      }
    }
    return FormGroupResponse(respGroupList);
  }

  Map<String, dynamic> getResponseMap() => getResponse().toLinear();

  Set<String>? get mappedKey => null; //TODO: Di sini, key dari field dianggap unik semua, bahkan untuk group lain.
  dynamic mapResponse(int groupPosition, String key, dynamic response) => response;

  void registerField({
    required int groupPosition,
    required String inputKey,
    required SibFormField field,
  }) {
    field.responseLiveData.observe(this, (data) {
      prind("registerField() groupPosition= $groupPosition inputKey= $inputKey data= $data field.responseLiveData= ${field.responseLiveData}");
      _responseGroupList[groupPosition][inputKey]!.response.value = data;
    }, tag: "FormVmGroupMixin.registerField() $groupPosition, $inputKey",);
  }

  /// [isOneShot] is true then method [getFieldGroupList] won't be called
  /// if [isFormReady] is currently true.
  void init({bool isOneShot = true,});

  void _checkCanProceed() {
    for(int i = 0; i < _responseGroupList.length ; i++) {
      final isResponseValidMap = _responseGroupList[i];
      for(final isResponseValid in isResponseValidMap.values) {
        //final isResponseInit = _isResponseInitList[i];
        if(isResponseValid.isValid.value != true) {
          _canProceed.value = false;
          return;
        }
      }
    }
    _canProceed.value = true;
  }

  //TODO: FormVmGroup: Cari cara biar isValid LiveData ke reset jika pindah halaman, namun dalam 1 VM.
  void displayInvalidFields() {
    for(int i = 0; i < _responseGroupList.length ; i++) {
      final isResponseValidMap = _responseGroupList[i];
      for(final entry in isResponseValidMap.entries) {
        final isResponseValid = entry.value;
        if(isResponseValid.isValid.value == null) {
          // So even the field that still in init will be notified as invalid.
          isResponseValid.isValid.value = false;
          Future.delayed(Duration(milliseconds: 200), () => isResponseValid.isValid.value = false);
        }
      }
    }
  }

  void submit() {
    startJob(submitFormKey, (isActive) async {
      doSubmitJob().then((value) {
        _onSubmit.value = value;
      });
    });
  }
  Future<List<FormUiGroupData>> getFieldGroupList();
  /// Called right after this [FormVmGroupMixin] form is ready.
  @protected
  void onReady(){}
  Future<Result<String>> doSubmitJob();

  /// Until July 5th, 2021, probable types of [response] is like this:
  /// - For [FormType.text] : It can be either [String] or [DateTime].
  /// - For [FormType.radio] : [String] for selected radio value.
  /// - For [FormType.check] : [Set<int>].
  Future<bool> validateField(int groupPosition, String inputKey, dynamic response) async {
    if(response is String) return response.isNotEmpty;
    if(response is Set) return response.isNotEmpty;
    return response != null;
  }
  String getResponseStringRepr(int groupPosition, String inputKey, dynamic response) =>
      response is String ? response : response?.toString() ?? "";
  String getInvalidMsg(String inputKey, dynamic response) => defaultInvalidMsg;
}


abstract class FormVmGroup extends AsyncVm with FormVmGroupMixin {
  FormVmGroup({
    this.defaultInvalidMsg = Strings.field_can_not_be_empty,
  });

  @override
  late List<MutableLiveData<FormUiGroupData>> _fieldGroupList;

  @override
  late List<Map<String, MutableFormVmResponse>> _responseGroupList;

  @override
  List<LiveData<FormUiGroupData>> get fieldGroupList {
    _assertFormReady();
    return _fieldGroupList;
  }
  /// Its map keys are [FormUiData.key].
  List<Map<String, FormVmResponse>> get responseGroupList {
    _assertFormReady();
    return _responseGroupList;
  }

  @override
  final MutableLiveData<bool> _canProceed = MutableLiveData();

  @override
  final MutableLiveData<Result<String>> _onSubmit = MutableLiveData();

  @override
  final String defaultInvalidMsg;

  MutableLiveData<bool> _isFormReady = MutableLiveData(false);
  @override
  LiveData<bool> get isFormReady => _isFormReady;

  //List<void Function()> _onReadyCallbacks = [];

  void _assertFormReady() {
    if(!isActive) {
      throw "Form `$runtimeType` is not active, thus it is unusable";
    }
    if(isFormReady.value != true) {
      throw "Form `$runtimeType` is not ready yet";
    }
  }

  @override
  void init({bool isOneShot = true}){
    if(isOneShot && isFormReady.value == true) return;
    getFieldGroupList().then((fieldGroupList) {
      _fieldGroupList = fieldGroupList.map((e) => MutableLiveData(e)).toList(growable: false);
      int i = 0;
      _responseGroupList = fieldGroupList.map((e) {
        final i2 = i++;
        final map = <String, MutableFormVmResponse>{};
        for(final formData in e.data) {
          final isValidData = MutableLiveData<bool>();
          isValidData.observe(this, (isValid) {
            _checkCanProceed();
          }, tag: "FormVmGroup ${formData.key}",);
          final responseData = MutableLiveData();
          responseData.observe(this, (response) {
            validateField(i2, formData.key, response).then((isValid) {
              isValidData.value = isValid;
            });
          }, tag: "FormVmGroup ${formData.key}",);
          map[formData.key] = MutableFormVmResponse(
            response: responseData,
            isValid: isValidData,
          );
        }
        return map;
      }).toList(growable: false);
      _isFormReady.value = true;
      onReady();
    });
  }

  @protected
  void setResponse(int group, String key, response) {
    if(_responseGroupList[group][key] == null) {
      throw "No such `key` '$key' in group '$group' in this '$runtimeType'";
    }
    _responseGroupList[group][key]!.response.value = response;
  }

  @override
  void dispose() {
    _isFormReady.value = false;
    _isFormReady.dispose();
    for(int i = 0; i < _fieldGroupList.length; i++) {
      _fieldGroupList[i].dispose();
      for(final formResponse in _responseGroupList[i].values) {
        formResponse.response.dispose();
        formResponse.isValid.dispose();
      }
    }
    super.dispose();
  }
}