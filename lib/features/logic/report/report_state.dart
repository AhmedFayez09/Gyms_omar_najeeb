part of 'report_cubit.dart';

abstract class ReportState {}

class ReportInitial extends ReportState {}
class PostReportLoading extends ReportState {}
class PostReportError extends ReportState {}
class PostReportSuccess extends ReportState {}


