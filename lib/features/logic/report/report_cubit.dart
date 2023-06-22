import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gyms/utils/service/dio_helper.dart';
part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());

  static ReportCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();
  void postReport({
    required String name,
    required String phone,
    required String email,
    required String message,
  }) async {
    emit(PostReportLoading());
    
     dioHelper.postData(
      endPoint: ApiPath.postReport,
      body: {"name": name, "phone": phone, "email": email, "message": message},
    ).then((value) {
      emit(PostReportSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(PostReportError());
    });
  }
}
