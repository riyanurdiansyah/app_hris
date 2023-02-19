import 'package:app_hris/src/domain/entities/menu_entity.dart';
import 'package:app_hris/src/domain/entities/task_entity.dart';
import 'package:app_hris/src/domain/entities/user_entity.dart';

const emptyMenu = MenuEntity(
  code: 0,
  status: false,
  message: "",
  data: [],
);

const emptyUser = UserEntity(
  code: 0,
  status: false,
  message: "",
  data: emptyDataUser,
  token: "",
);

const emptyDataUser = UserDataEntity(
  uuid: "",
  employeeId: "",
  username: "",
  email: "",
  phoneNumber: "",
  role: 0,
  companySecretKey: "",
  createdAt: "",
  updatedAt: "",
);

const emptyTask = TaskEntity(
  code: 0,
  status: false,
  message: "",
  data: [],
);
