class ResponseObject{
  final bool Issuccess;
  final int statuscode;
  final dynamic responsebody;
  final String? errormessage;

  ResponseObject({required this.Issuccess,required this.statuscode, required this.responsebody,this.errormessage=''});
}