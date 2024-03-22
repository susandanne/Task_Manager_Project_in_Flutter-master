class Url{
   static String  baseurl='https://task.teamrabbil.com/api/v1';
   static String registrationUrl='$baseurl/registration';
   static String login='$baseurl/login';
   static String createTask='$baseurl/createTask';
   static String taskStatusCount='$baseurl/taskStatusCount';
   static String listTaskByStatusNew='$baseurl/listTaskByStatus/New';
   static String listTaskByStatusCompleted='$baseurl/listTaskByStatus/Completed';
   static String deleteTask(String id)=>'$baseurl/deleteTask/$id';
   static String updateTaskStatus(String id,String status)=>'$baseurl/updateTaskStatus/$id/$status';
}