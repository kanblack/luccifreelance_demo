import '../../../generated/l10n.dart';
import '../constants/enums_constants.dart';

extension ActionTypeExtension on ActionTypeEnum {
  String get value {
    switch (this) {
      case ActionTypeEnum.deleteBDSInfo:
        return "DELETE_BDS_INFO";
      case ActionTypeEnum.editBDSInfo:
        return "EDIT_BDS_INFO";
      case ActionTypeEnum.addNewBDSInfo:
        return "ADD_NEW_BDS_INFO";
      case ActionTypeEnum.login:
        return "LOGIN";
      default:
        return "";
    }
  }
}

final Map<String, ActionTypeEnum> actionTypeEnums = Map.of({
  ActionTypeEnum.addNewBDSInfo.value: ActionTypeEnum.addNewBDSInfo,
  ActionTypeEnum.editBDSInfo.value: ActionTypeEnum.editBDSInfo,
  ActionTypeEnum.deleteBDSInfo.value: ActionTypeEnum.deleteBDSInfo,
  ActionTypeEnum.login.value: ActionTypeEnum.login,
  ActionTypeEnum.unKnow.value: ActionTypeEnum.unKnow,
});

String getActionTypeEnum(ActionTypeEnum actionTypeEnum) {
  switch (actionTypeEnum) {
    case ActionTypeEnum.deleteBDSInfo:
      return S.current.lbl_delete_BDS_action;
    case ActionTypeEnum.editBDSInfo:
      return S.current.lbl_edit_BDS_action;
    case ActionTypeEnum.addNewBDSInfo:
      return S.current.lbl_add_BDS_action;
    case ActionTypeEnum.login:
      return S.current.lbl_login_action;
    default:
      return "Null";
  }
}
