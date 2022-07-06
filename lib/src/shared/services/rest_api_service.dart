import 'package:demo_luci_web/src/feature/home/data/models/staff_info_responsive.dart';
import 'package:demo_luci_web/src/feature/home/data/models/time_line_responsive.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../env.dart';
import '../constants/api_constants.dart';

part 'rest_api_service.g.dart';

///We do call the rest API to get, store data on a remote database for that we
///need to write the rest API call at a single place and need to return the data
///if the rest call is a success or need to return custom error exception on the
///basis of 4xx, 5xx status code. We can make use of http package to make the
///rest API call in the flutter

///APIs class is for api tags
///
///NOTE: run this command everytime you edit this file: flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET(RawAPI.staffInfo)
  Future<StaffInfoResponsive> getStaffInfo();
  @GET(RawAPI.timeLine)
  Future<List<TimeLineResponsive>> getTimeLine();
  @GET(RawAPI.fake)
  Future<List<TimeLineResponsive>> getErr();
}
