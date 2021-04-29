namespace java satori.thrift.gen
struct EntityStruct {
	1:optional i64 id
}
exception TokenInvalid {
	1:string message
}
exception TokenExpired {
	1:string message
}
exception AccessDenied {
	1:string message
}
exception ArgumentNotFound {
	1:string message
	2:string model
	3:i64 id
}
exception CannotReturnObject {
	1:string message
}
exception InvalidArgument {
	1:string message
	2:string name
	3:string reason
}
typedef i64 EntityId
struct Attribute {
	1:string name
	2:bool is_blob
	3:string value
	4:optional string filename
}
exception MissingBlob {
	1:string message
}
struct AnonymousAttribute {
	1:bool is_blob
	2:string value
	3:optional string name
	4:optional string filename
}
exception BadAttributeType {
	1:string message
	2:string name
	3:string requested_type
}
typedef i64 SubpageId
typedef i64 ContestId
typedef i64 DateTime
struct SubpageStruct {
	1:optional i64 id
	2:optional ContestId contest
	3:optional bool is_public
	4:optional bool is_sticky
	5:optional bool is_announcement
	6:optional string name
	7:optional string content
	8:optional i32 order
	9:optional DateTime date_created
}
exception CannotSetField {
	1:string message
	2:string field
}
exception SphinxException {
	1:string message
	2:string error
}
exception CannotDeleteObject {
	1:string message
}
typedef i64 ProblemId
typedef i64 TestSuiteId
struct ProblemMappingStruct {
	1:optional i64 id
	2:optional ContestId contest
	3:optional ProblemId problem
	4:optional string code
	5:optional string title
	6:optional string description
	7:optional string group
	8:optional string override_fields
	9:optional string statement
	10:optional TestSuiteId default_test_suite
}
typedef i64 ProblemMappingId
typedef i64 ContestantId
struct TestSuiteStruct {
	1:optional i64 id
	2:optional ProblemId problem
	3:optional string name
	4:optional string description
	5:optional string dispatcher
	6:optional string accumulators
	7:optional string reporter
}
typedef i64 TestId
struct TestStruct {
	1:optional i64 id
	2:optional ProblemId problem
	3:optional string name
	4:optional string description
	5:optional string environment
	6:optional bool obsolete
}
struct RankingStruct {
	1:optional i64 id
	2:optional ContestId contest
	3:optional string name
	4:optional string aggregator
	5:optional string header
	6:optional string footer
	7:optional bool is_public
}
typedef i64 RankingId
struct PrinterStruct {
	1:optional i64 id
	2:optional string name
	3:optional string description
	4:optional string script
}
typedef i64 PrinterId
typedef i64 SubmitId
struct TestResultStruct {
	1:optional i64 id
	2:optional SubmitId submit
	3:optional TestId test
	4:optional bool pending
}
typedef i64 TestResultId
struct RoleStruct {
	1:optional i64 id
	2:optional string name
	3:optional string sort_field
}
typedef i64 RoleId
typedef i64 UserId
typedef i64 SystemRoleId
struct ContestStruct {
	1:optional i64 id
	2:optional string name
	3:optional string description
	4:optional SystemRoleId contestant_role
	5:optional SystemRoleId admin_role
	6:optional PrinterId printer
	7:optional bool archived
	8:optional DateTime lock_start
	9:optional DateTime lock_finish
	10:optional string lock_address
	11:optional string lock_netmask
}
struct ContestantStruct {
	1:optional i64 id
	2:optional string name
	3:optional string sort_field
	4:optional ContestId contest
	5:optional bool accepted
	6:optional bool invisible
	7:optional string login
	8:optional string usernames
}
exception AlreadyRegistered {
	1:string message
	2:string login
}
struct TestSuiteResultStruct {
	1:optional i64 id
	2:optional SubmitId submit
	3:optional TestSuiteId test_suite
	4:optional bool pending
	5:optional string status
	6:optional string report
}
typedef i64 TestSuiteResultId
typedef i64 QuestionId
struct QuestionStruct {
	1:optional i64 id
	2:optional ProblemMappingId problem
	3:optional ContestId contest
	4:optional RoleId inquirer
	5:optional string content
	6:optional string answer
	7:optional DateTime date_created
}
struct TemporarySubmitStruct {
	1:optional i64 id
	2:optional bool pending
	3:optional DateTime date_created
}
typedef i64 TemporarySubmitId
struct ProblemStruct {
	1:optional i64 id
	2:optional string name
	3:optional string description
	4:optional string statement
	5:optional string submit_fields
}
struct GlobalStruct {
	1:optional i64 id
	2:optional SystemRoleId contest_admins
	3:optional SystemRoleId anonymous
	4:optional SystemRoleId authenticated
	5:optional SystemRoleId zero
	6:optional ProblemId assignment
	7:optional string profile_fields
}
typedef i64 GlobalId
struct SubmitToCheck {
	1:optional i64 test_result
	2:map<string,AnonymousAttribute> test_data
	3:map<string,AnonymousAttribute> submit_data
}
typedef i64 MachineId
struct MachineStruct {
	1:optional i64 id
	2:optional string name
	3:optional string sort_field
	4:optional string login
	5:optional string address
	6:optional string netmask
}
exception InvalidLogin {
	1:string message
	2:string login
	3:string reason
}
exception LoginFailed {
	1:string message
}
exception InvalidPassword {
	1:string message
	2:string reason
}
struct UserStruct {
	1:optional i64 id
	2:optional string name
	3:optional string sort_field
	4:optional string login
	5:optional string email
	6:optional string firstname
	7:optional string lastname
	8:optional bool activated
	9:optional bool confirmed
	10:optional string affiliation
}
struct SystemRoleStruct {
	1:optional i64 id
	2:optional string name
	3:optional string sort_field
}
exception InvalidEmail {
	1:string message
	2:string email
	3:string reason
}
typedef i64 GroupId
struct GroupStruct {
	1:optional i64 id
	2:optional string name
	3:optional string sort_field
}
struct SubmitStruct {
	1:optional i64 id
	2:optional ContestantId contestant
	3:optional ProblemMappingId problem
	4:optional DateTime time
}
struct PrintJobStruct {
	1:optional i64 id
	2:optional ContestantId contestant
	3:optional ContestId contest
	4:optional DateTime time
	5:optional bool pending
	6:optional string status
	7:optional string report
}
typedef i64 PrintJobId
struct PrivilegeTimes {
	1:optional DateTime start_on
	2:optional DateTime finish_on
}
exception ExternalIdentityFailed {
	1:string message
	2:string reason
}
struct ExternalIdentityStruct {
	1:optional i64 id
	2:optional string handler
	3:optional string provider
	4:optional UserId user
	5:optional string email
	6:optional string name
}
struct ExternalIdentityResult {
	1:string token
	2:bool linked
	3:optional string salt
}
exception InvalidExternalIdentityCallback {
	1:string message
	2:string reason
}
typedef i64 ExternalIdentityId
struct ExternalIdentityRedirect {
	1:string token
	2:optional string redirect
	3:optional string html
}
exception InvalidExternalIdentityProvider {
	1:string message
	2:string provider
	3:string reason
}
struct SizedContestantList {
	1:list<ContestantStruct> contestants
	2:i32 count
}
struct ContestInfo {
	1:ContestStruct contest
	2:ContestantStruct contestant
	3:bool can_apply
	4:bool can_join
	5:bool is_admin
}
struct PageInfo {
	1:ContestStruct contest
	2:ContestantStruct contestant
	3:RoleStruct role
	4:UserStruct user
	5:list<SubpageStruct> subpages
	6:list<RankingStruct> rankings
	7:bool is_admin
	8:bool is_problemsetter
	9:bool contest_is_admin
	10:bool contest_can_ask_questions
	11:bool contest_answers_exist
	12:bool contest_submittable_problems_exist
	13:bool contest_viewable_problems_exist
	14:bool contest_can_backup
	15:bool contest_can_print
}
struct ProblemMappingInfo {
	1:ProblemMappingStruct problem_mapping
	2:bool can_submit
	3:bool is_admin
	4:bool has_pdf
	5:string html
	6:PrivilegeTimes contestant_role_view_times
	7:PrivilegeTimes contestant_role_submit_times
}
struct TestResultInfo {
	1:TestStruct test
	2:TestResultStruct test_result
	3:map<string,AnonymousAttribute> attributes
}
struct TestSuiteResultInfo {
	1:TestSuiteStruct test_suite
	2:TestSuiteResultStruct test_suite_result
	3:map<string,AnonymousAttribute> attributes
}
struct ResultInfo {
	1:SubmitStruct submit
	2:ContestantStruct contestant
	3:ProblemMappingStruct problem_mapping
	4:string status
	5:string report
	6:string data
	7:string data_filename
	8:list<TestResultInfo> test_results
	9:list<TestSuiteResultInfo> test_suite_results
}
struct SizedResultList {
	1:list<ResultInfo> results
	2:i32 count
}
struct SubpageInfo {
	1:SubpageStruct subpage
	2:string html
	3:bool is_admin
}
service Entity {
	list<EntityStruct> Entity_filter(1:string token, 2:optional EntityStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	EntityStruct Entity_get_struct(1:string token, 2:EntityId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Entity_oa_add_list(1:string token, 2:EntityId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Entity_oa_add_map(1:string token, 2:EntityId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Entity_oa_delete(1:string token, 2:EntityId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Entity_oa_get(1:string token, 2:EntityId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Entity_oa_get_blob(1:string token, 2:EntityId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Entity_oa_get_blob_hash(1:string token, 2:EntityId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Entity_oa_get_list(1:string token, 2:EntityId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Entity_oa_get_map(1:string token, 2:EntityId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Entity_oa_get_str(1:string token, 2:EntityId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Entity_oa_set(1:string token, 2:EntityId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Entity_oa_set_blob(1:string token, 2:EntityId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Entity_oa_set_blob_hash(1:string token, 2:EntityId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Entity_oa_set_list(1:string token, 2:EntityId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Entity_oa_set_map(1:string token, 2:EntityId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Entity_oa_set_str(1:string token, 2:EntityId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Server {
	string Server_getIDL(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Subpage extends Entity {
	void Subpage_content_files_add_list(1:string token, 2:SubpageId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Subpage_content_files_add_map(1:string token, 2:SubpageId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Subpage_content_files_delete(1:string token, 2:SubpageId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Subpage_content_files_get(1:string token, 2:SubpageId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Subpage_content_files_get_blob(1:string token, 2:SubpageId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Subpage_content_files_get_blob_hash(1:string token, 2:SubpageId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Subpage_content_files_get_list(1:string token, 2:SubpageId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Subpage_content_files_get_map(1:string token, 2:SubpageId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Subpage_content_files_get_str(1:string token, 2:SubpageId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Subpage_content_files_set(1:string token, 2:SubpageId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Subpage_content_files_set_blob(1:string token, 2:SubpageId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Subpage_content_files_set_blob_hash(1:string token, 2:SubpageId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Subpage_content_files_set_list(1:string token, 2:SubpageId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Subpage_content_files_set_map(1:string token, 2:SubpageId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Subpage_content_files_set_str(1:string token, 2:SubpageId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SubpageStruct Subpage_create_for_contest(1:string token, 2:SubpageStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:SphinxException error8)
	SubpageStruct Subpage_create_global(1:string token, 2:SubpageStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:SphinxException error8)
	void Subpage_delete(1:string token, 2:SubpageId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<SubpageStruct> Subpage_filter(1:string token, 2:optional SubpageStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<SubpageStruct> Subpage_get_for_contest(1:string token, 2:ContestId contest, 3:bool announcements) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<SubpageStruct> Subpage_get_global(1:string token, 2:bool announcements) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SubpageStruct Subpage_get_struct(1:string token, 2:SubpageId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SubpageStruct Subpage_modify(1:string token, 2:SubpageId _self, 3:SubpageStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:SphinxException error8)
}
service ProblemMapping extends Entity {
	ProblemMappingStruct ProblemMapping_create(1:string token, 2:ProblemMappingStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:SphinxException error8)
	ProblemMappingStruct ProblemMapping_create_assignment(1:string token, 2:ProblemMappingStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:SphinxException error8)
	void ProblemMapping_delete(1:string token, 2:ProblemMappingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<ProblemMappingStruct> ProblemMapping_filter(1:string token, 2:optional ProblemMappingStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ProblemMappingStruct ProblemMapping_get_struct(1:string token, 2:ProblemMappingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void ProblemMapping_judge_assignment(1:string token, 2:ProblemMappingId _self, 3:map<ContestantId,map<string,AnonymousAttribute>> results) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ProblemMappingStruct ProblemMapping_modify(1:string token, 2:ProblemMappingId _self, 3:ProblemMappingStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:SphinxException error8)
	void ProblemMapping_statement_files_add_list(1:string token, 2:ProblemMappingId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void ProblemMapping_statement_files_add_map(1:string token, 2:ProblemMappingId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void ProblemMapping_statement_files_delete(1:string token, 2:ProblemMappingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute ProblemMapping_statement_files_get(1:string token, 2:ProblemMappingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string ProblemMapping_statement_files_get_blob(1:string token, 2:ProblemMappingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string ProblemMapping_statement_files_get_blob_hash(1:string token, 2:ProblemMappingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> ProblemMapping_statement_files_get_list(1:string token, 2:ProblemMappingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> ProblemMapping_statement_files_get_map(1:string token, 2:ProblemMappingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string ProblemMapping_statement_files_get_str(1:string token, 2:ProblemMappingId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void ProblemMapping_statement_files_set(1:string token, 2:ProblemMappingId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void ProblemMapping_statement_files_set_blob(1:string token, 2:ProblemMappingId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void ProblemMapping_statement_files_set_blob_hash(1:string token, 2:ProblemMappingId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void ProblemMapping_statement_files_set_list(1:string token, 2:ProblemMappingId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void ProblemMapping_statement_files_set_map(1:string token, 2:ProblemMappingId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void ProblemMapping_statement_files_set_str(1:string token, 2:ProblemMappingId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service ProblemStatementUtils {
	string ProblemStatementUtils_render_to_pdf(1:string token, 2:string statement, 3:map<string,AnonymousAttribute> attachments_oa_map) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:SphinxException error7)
}
service TestSuite extends Entity {
	TestSuiteStruct TestSuite_create(1:string token, 2:TestSuiteStruct fields, 3:map<string,AnonymousAttribute> params, 4:list<TestId> test_list, 5:list<map<string,AnonymousAttribute>> test_params) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void TestSuite_delete(1:string token, 2:TestSuiteId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<TestSuiteStruct> TestSuite_filter(1:string token, 2:optional TestSuiteStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	TestSuiteStruct TestSuite_get_struct(1:string token, 2:TestSuiteId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<map<string,AnonymousAttribute>> TestSuite_get_test_params(1:string token, 2:TestSuiteId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<TestStruct> TestSuite_get_tests(1:string token, 2:TestSuiteId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	TestSuiteStruct TestSuite_modify(1:string token, 2:TestSuiteId _self, 3:TestSuiteStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	TestSuiteStruct TestSuite_modify_full(1:string token, 2:TestSuiteId _self, 3:TestSuiteStruct fields, 4:map<string,AnonymousAttribute> params, 5:list<TestId> test_list, 6:list<map<string,AnonymousAttribute>> test_params) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void TestSuite_params_add_list(1:string token, 2:TestSuiteId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TestSuite_params_add_map(1:string token, 2:TestSuiteId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TestSuite_params_delete(1:string token, 2:TestSuiteId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute TestSuite_params_get(1:string token, 2:TestSuiteId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string TestSuite_params_get_blob(1:string token, 2:TestSuiteId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string TestSuite_params_get_blob_hash(1:string token, 2:TestSuiteId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> TestSuite_params_get_list(1:string token, 2:TestSuiteId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> TestSuite_params_get_map(1:string token, 2:TestSuiteId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string TestSuite_params_get_str(1:string token, 2:TestSuiteId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void TestSuite_params_set(1:string token, 2:TestSuiteId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TestSuite_params_set_blob(1:string token, 2:TestSuiteId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TestSuite_params_set_blob_hash(1:string token, 2:TestSuiteId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TestSuite_params_set_list(1:string token, 2:TestSuiteId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TestSuite_params_set_map(1:string token, 2:TestSuiteId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TestSuite_params_set_str(1:string token, 2:TestSuiteId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TestSuite_rejudge(1:string token, 2:TestSuiteId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Ranking extends Entity {
	RankingStruct Ranking_create(1:string token, 2:RankingStruct fields, 3:map<string,AnonymousAttribute> params, 4:map<ProblemMappingId,TestSuiteId> problem_test_suites, 5:map<ProblemMappingId,map<string,AnonymousAttribute>> problem_params) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Ranking_delete(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<RankingStruct> Ranking_filter(1:string token, 2:optional RankingStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Ranking_full_ranking(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<ProblemMappingId,map<string,AnonymousAttribute>> Ranking_get_problem_params(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<ProblemMappingId,TestSuiteStruct> Ranking_get_problem_test_suites(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	RankingStruct Ranking_get_struct(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	RankingStruct Ranking_modify(1:string token, 2:RankingId _self, 3:RankingStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	RankingStruct Ranking_modify_full(1:string token, 2:RankingId _self, 3:RankingStruct fields, 4:map<string,AnonymousAttribute> params, 5:map<ProblemMappingId,TestSuiteId> problem_test_suites, 6:map<ProblemMappingId,map<string,AnonymousAttribute>> problem_params) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Ranking_modify_problem(1:string token, 2:RankingId _self, 3:ProblemMappingId problem, 4:optional TestSuiteId test_suite, 5:optional map<string,AnonymousAttribute> params) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Ranking_params_add_list(1:string token, 2:RankingId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_params_add_map(1:string token, 2:RankingId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_params_delete(1:string token, 2:RankingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Ranking_params_get(1:string token, 2:RankingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Ranking_params_get_blob(1:string token, 2:RankingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Ranking_params_get_blob_hash(1:string token, 2:RankingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Ranking_params_get_list(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Ranking_params_get_map(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Ranking_params_get_str(1:string token, 2:RankingId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Ranking_params_set(1:string token, 2:RankingId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_params_set_blob(1:string token, 2:RankingId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Ranking_params_set_blob_hash(1:string token, 2:RankingId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_params_set_list(1:string token, 2:RankingId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_params_set_map(1:string token, 2:RankingId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_params_set_str(1:string token, 2:RankingId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Ranking_presentation_add_list(1:string token, 2:RankingId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_presentation_add_map(1:string token, 2:RankingId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_presentation_delete(1:string token, 2:RankingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Ranking_presentation_get(1:string token, 2:RankingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Ranking_presentation_get_blob(1:string token, 2:RankingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Ranking_presentation_get_blob_hash(1:string token, 2:RankingId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Ranking_presentation_get_list(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Ranking_presentation_get_map(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Ranking_presentation_get_str(1:string token, 2:RankingId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Ranking_presentation_set(1:string token, 2:RankingId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_presentation_set_blob(1:string token, 2:RankingId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Ranking_presentation_set_blob_hash(1:string token, 2:RankingId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_presentation_set_list(1:string token, 2:RankingId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_presentation_set_map(1:string token, 2:RankingId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Ranking_presentation_set_str(1:string token, 2:RankingId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Ranking_rejudge(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Ranking_stop(1:string token, 2:RankingId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Printer extends Entity {
	PrinterStruct Printer_create(1:string token, 2:PrinterStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Printer_delete(1:string token, 2:PrinterId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<PrinterStruct> Printer_filter(1:string token, 2:optional PrinterStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	PrinterStruct Printer_get_struct(1:string token, 2:PrinterId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	PrinterStruct Printer_modify(1:string token, 2:PrinterId _self, 3:PrinterStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
}
service TestResult extends Entity {
	list<TestResultStruct> TestResult_filter(1:string token, 2:optional TestResultStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	TestResultStruct TestResult_get_struct(1:string token, 2:TestResultId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TestResult_rejudge(1:string token, 2:TestResultId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Role extends Entity {
	list<RoleStruct> Role_filter(1:string token, 2:optional RoleStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	RoleStruct Role_get_struct(1:string token, 2:RoleId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Contest extends Entity {
	void Contest_add_admin(1:string token, 2:ContestId _self, 3:UserId user) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Contest_appearance_add_list(1:string token, 2:ContestId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contest_appearance_add_map(1:string token, 2:ContestId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contest_appearance_delete(1:string token, 2:ContestId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Contest_appearance_get(1:string token, 2:ContestId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Contest_appearance_get_blob(1:string token, 2:ContestId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Contest_appearance_get_blob_hash(1:string token, 2:ContestId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Contest_appearance_get_list(1:string token, 2:ContestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Contest_appearance_get_map(1:string token, 2:ContestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Contest_appearance_get_str(1:string token, 2:ContestId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Contest_appearance_set(1:string token, 2:ContestId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contest_appearance_set_blob(1:string token, 2:ContestId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Contest_appearance_set_blob_hash(1:string token, 2:ContestId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contest_appearance_set_list(1:string token, 2:ContestId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contest_appearance_set_map(1:string token, 2:ContestId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contest_appearance_set_str(1:string token, 2:ContestId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ContestStruct Contest_create(1:string token, 2:ContestStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Contest_delete(1:string token, 2:ContestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	void Contest_delete_admin(1:string token, 2:ContestId _self, 3:RoleId role) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Contest_disable_lock(1:string token, 2:ContestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<ContestStruct> Contest_filter(1:string token, 2:optional ContestStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ContestantStruct Contest_find_contestant(1:string token, 2:ContestId _self, 3:RoleId user) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ContestStruct Contest_get_current_lock(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ContestStruct Contest_get_struct(1:string token, 2:ContestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ContestantStruct Contest_join(1:string token, 2:ContestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:AlreadyRegistered error7)
	ContestStruct Contest_modify(1:string token, 2:ContestId _self, 3:ContestStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
}
service TestSuiteResult extends Entity {
	list<TestSuiteResultStruct> TestSuiteResult_filter(1:string token, 2:optional TestSuiteResultStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	TestSuiteResultStruct TestSuiteResult_get_struct(1:string token, 2:TestSuiteResultId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TestSuiteResult_rejudge(1:string token, 2:TestSuiteResultId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Question extends Entity {
	void Question_answer_files_add_list(1:string token, 2:QuestionId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Question_answer_files_add_map(1:string token, 2:QuestionId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Question_answer_files_delete(1:string token, 2:QuestionId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Question_answer_files_get(1:string token, 2:QuestionId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Question_answer_files_get_blob(1:string token, 2:QuestionId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Question_answer_files_get_blob_hash(1:string token, 2:QuestionId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Question_answer_files_get_list(1:string token, 2:QuestionId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Question_answer_files_get_map(1:string token, 2:QuestionId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Question_answer_files_get_str(1:string token, 2:QuestionId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Question_answer_files_set(1:string token, 2:QuestionId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Question_answer_files_set_blob(1:string token, 2:QuestionId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Question_answer_files_set_blob_hash(1:string token, 2:QuestionId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Question_answer_files_set_list(1:string token, 2:QuestionId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Question_answer_files_set_map(1:string token, 2:QuestionId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Question_answer_files_set_str(1:string token, 2:QuestionId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	QuestionStruct Question_create(1:string token, 2:QuestionStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Question_delete(1:string token, 2:QuestionId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<QuestionStruct> Question_filter(1:string token, 2:optional QuestionStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	QuestionStruct Question_get_struct(1:string token, 2:QuestionId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	QuestionStruct Question_modify(1:string token, 2:QuestionId _self, 3:QuestionStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:SphinxException error8)
}
service TemporarySubmit extends Entity {
	TemporarySubmitStruct TemporarySubmit_create(1:string token, 2:map<string,AnonymousAttribute> test_data, 3:map<string,AnonymousAttribute> submit_data) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TemporarySubmit_delete(1:string token, 2:TemporarySubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<TemporarySubmitStruct> TemporarySubmit_filter(1:string token, 2:optional TemporarySubmitStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	TemporarySubmitStruct TemporarySubmit_get_struct(1:string token, 2:TemporarySubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TemporarySubmit_result_add_list(1:string token, 2:TemporarySubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_result_add_map(1:string token, 2:TemporarySubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_result_delete(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute TemporarySubmit_result_get(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string TemporarySubmit_result_get_blob(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string TemporarySubmit_result_get_blob_hash(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> TemporarySubmit_result_get_list(1:string token, 2:TemporarySubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> TemporarySubmit_result_get_map(1:string token, 2:TemporarySubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string TemporarySubmit_result_get_str(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void TemporarySubmit_result_set(1:string token, 2:TemporarySubmitId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_result_set_blob(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TemporarySubmit_result_set_blob_hash(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_result_set_list(1:string token, 2:TemporarySubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_result_set_map(1:string token, 2:TemporarySubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_result_set_str(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TemporarySubmit_submit_data_add_list(1:string token, 2:TemporarySubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_submit_data_add_map(1:string token, 2:TemporarySubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_submit_data_delete(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute TemporarySubmit_submit_data_get(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string TemporarySubmit_submit_data_get_blob(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string TemporarySubmit_submit_data_get_blob_hash(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> TemporarySubmit_submit_data_get_list(1:string token, 2:TemporarySubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> TemporarySubmit_submit_data_get_map(1:string token, 2:TemporarySubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string TemporarySubmit_submit_data_get_str(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void TemporarySubmit_submit_data_set(1:string token, 2:TemporarySubmitId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_submit_data_set_blob(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TemporarySubmit_submit_data_set_blob_hash(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_submit_data_set_list(1:string token, 2:TemporarySubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_submit_data_set_map(1:string token, 2:TemporarySubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_submit_data_set_str(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TemporarySubmit_test_data_add_list(1:string token, 2:TemporarySubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_test_data_add_map(1:string token, 2:TemporarySubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_test_data_delete(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute TemporarySubmit_test_data_get(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string TemporarySubmit_test_data_get_blob(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string TemporarySubmit_test_data_get_blob_hash(1:string token, 2:TemporarySubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> TemporarySubmit_test_data_get_list(1:string token, 2:TemporarySubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> TemporarySubmit_test_data_get_map(1:string token, 2:TemporarySubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string TemporarySubmit_test_data_get_str(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void TemporarySubmit_test_data_set(1:string token, 2:TemporarySubmitId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_test_data_set_blob(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void TemporarySubmit_test_data_set_blob_hash(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_test_data_set_list(1:string token, 2:TemporarySubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_test_data_set_map(1:string token, 2:TemporarySubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void TemporarySubmit_test_data_set_str(1:string token, 2:TemporarySubmitId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Problem extends Entity {
	ProblemStruct Problem_create(1:string token, 2:ProblemStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Problem_default_test_data_add_list(1:string token, 2:ProblemId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Problem_default_test_data_add_map(1:string token, 2:ProblemId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Problem_default_test_data_delete(1:string token, 2:ProblemId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Problem_default_test_data_get(1:string token, 2:ProblemId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Problem_default_test_data_get_blob(1:string token, 2:ProblemId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Problem_default_test_data_get_blob_hash(1:string token, 2:ProblemId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Problem_default_test_data_get_list(1:string token, 2:ProblemId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Problem_default_test_data_get_map(1:string token, 2:ProblemId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Problem_default_test_data_get_str(1:string token, 2:ProblemId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Problem_default_test_data_set(1:string token, 2:ProblemId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Problem_default_test_data_set_blob(1:string token, 2:ProblemId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Problem_default_test_data_set_blob_hash(1:string token, 2:ProblemId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Problem_default_test_data_set_list(1:string token, 2:ProblemId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Problem_default_test_data_set_map(1:string token, 2:ProblemId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Problem_default_test_data_set_str(1:string token, 2:ProblemId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Problem_delete(1:string token, 2:ProblemId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<ProblemStruct> Problem_filter(1:string token, 2:optional ProblemStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ProblemStruct Problem_get_struct(1:string token, 2:ProblemId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ProblemStruct Problem_modify(1:string token, 2:ProblemId _self, 3:ProblemStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
}
service Global extends Entity {
	list<GlobalStruct> Global_filter(1:string token, 2:optional GlobalStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Global_generators_add_list(1:string token, 2:GlobalId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_generators_add_map(1:string token, 2:GlobalId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_generators_delete(1:string token, 2:GlobalId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Global_generators_get(1:string token, 2:GlobalId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Global_generators_get_blob(1:string token, 2:GlobalId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Global_generators_get_blob_hash(1:string token, 2:GlobalId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Global_generators_get_list(1:string token, 2:GlobalId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Global_generators_get_map(1:string token, 2:GlobalId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Global_generators_get_str(1:string token, 2:GlobalId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Global_generators_set(1:string token, 2:GlobalId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_generators_set_blob(1:string token, 2:GlobalId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Global_generators_set_blob_hash(1:string token, 2:GlobalId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_generators_set_list(1:string token, 2:GlobalId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_generators_set_map(1:string token, 2:GlobalId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_generators_set_str(1:string token, 2:GlobalId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,string> Global_get_accumulators(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,string> Global_get_aggregators(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,string> Global_get_dispatchers(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	GlobalStruct Global_get_instance(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,string> Global_get_reporters(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	GlobalStruct Global_get_struct(1:string token, 2:GlobalId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Global_judges_add_list(1:string token, 2:GlobalId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_judges_add_map(1:string token, 2:GlobalId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_judges_delete(1:string token, 2:GlobalId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Global_judges_get(1:string token, 2:GlobalId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Global_judges_get_blob(1:string token, 2:GlobalId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Global_judges_get_blob_hash(1:string token, 2:GlobalId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Global_judges_get_list(1:string token, 2:GlobalId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Global_judges_get_map(1:string token, 2:GlobalId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Global_judges_get_str(1:string token, 2:GlobalId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Global_judges_set(1:string token, 2:GlobalId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_judges_set_blob(1:string token, 2:GlobalId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Global_judges_set_blob_hash(1:string token, 2:GlobalId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_judges_set_list(1:string token, 2:GlobalId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_judges_set_map(1:string token, 2:GlobalId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Global_judges_set_str(1:string token, 2:GlobalId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Test extends Entity {
	TestStruct Test_create(1:string token, 2:TestStruct fields, 3:map<string,AnonymousAttribute> data) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Test_data_add_list(1:string token, 2:TestId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Test_data_add_map(1:string token, 2:TestId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Test_data_delete(1:string token, 2:TestId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Test_data_get(1:string token, 2:TestId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Test_data_get_blob(1:string token, 2:TestId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Test_data_get_blob_hash(1:string token, 2:TestId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Test_data_get_list(1:string token, 2:TestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Test_data_get_map(1:string token, 2:TestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Test_data_get_str(1:string token, 2:TestId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Test_data_set(1:string token, 2:TestId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Test_data_set_blob(1:string token, 2:TestId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Test_data_set_blob_hash(1:string token, 2:TestId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Test_data_set_list(1:string token, 2:TestId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Test_data_set_map(1:string token, 2:TestId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Test_data_set_str(1:string token, 2:TestId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Test_delete(1:string token, 2:TestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<TestStruct> Test_filter(1:string token, 2:optional TestStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	TestStruct Test_get_struct(1:string token, 2:TestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	TestStruct Test_modify(1:string token, 2:TestId _self, 3:TestStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	TestStruct Test_modify_full(1:string token, 2:TestId _self, 3:TestStruct fields, 4:map<string,AnonymousAttribute> data) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Test_rejudge(1:string token, 2:TestId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Blob {
	void Blob_create(1:string token, 2:optional i32 length, 3:optional i32 on_close) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	bool Blob_exists(1:string token, 2:string hash) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Blob_open(1:string token, 2:string hash, 3:optional string filename, 4:optional i32 on_close) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Judge {
	SubmitToCheck Judge_get_next(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Judge_set_partial_result(1:string token, 2:i64 test_result_id, 3:map<string,AnonymousAttribute> result) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Judge_set_result(1:string token, 2:i64 test_result_id, 3:map<string,AnonymousAttribute> result) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Machine extends Role {
	string Machine_authenticate(1:string token, 2:string login, 3:string password) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Machine_check_ip(1:string token, 2:MachineId _self, 3:string ip) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	MachineStruct Machine_create(1:string token, 2:MachineStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:InvalidLogin error7, 8:CannotSetField error8)
	list<MachineStruct> Machine_filter(1:string token, 2:optional MachineStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	MachineStruct Machine_get_struct(1:string token, 2:MachineId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	MachineStruct Machine_modify(1:string token, 2:MachineId _self, 3:MachineStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:InvalidLogin error8)
	void Machine_set_password(1:string token, 2:MachineId _self, 3:string new_password) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Contestant extends Role {
	void Contestant_add_member_user(1:string token, 2:ContestantId _self, 3:UserId user) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:AlreadyRegistered error7)
	string Contestant_authenticate(1:string token, 2:string login, 3:string password) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:LoginFailed error7)
	void Contestant_backup_add_list(1:string token, 2:ContestantId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contestant_backup_add_map(1:string token, 2:ContestantId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contestant_backup_delete(1:string token, 2:ContestantId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Contestant_backup_get(1:string token, 2:ContestantId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Contestant_backup_get_blob(1:string token, 2:ContestantId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Contestant_backup_get_blob_hash(1:string token, 2:ContestantId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Contestant_backup_get_list(1:string token, 2:ContestantId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Contestant_backup_get_map(1:string token, 2:ContestantId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Contestant_backup_get_str(1:string token, 2:ContestantId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Contestant_backup_set(1:string token, 2:ContestantId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contestant_backup_set_blob(1:string token, 2:ContestantId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Contestant_backup_set_blob_hash(1:string token, 2:ContestantId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contestant_backup_set_list(1:string token, 2:ContestantId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contestant_backup_set_map(1:string token, 2:ContestantId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Contestant_backup_set_str(1:string token, 2:ContestantId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Contestant_change_password(1:string token, 2:ContestantId _self, 3:string old_password, 4:string new_password) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:LoginFailed error7, 8:InvalidPassword error8)
	ContestantStruct Contestant_create(1:string token, 2:ContestantStruct fields, 3:list<UserId> user_list) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:AlreadyRegistered error7, 8:InvalidLogin error8, 9:InvalidPassword error9, 10:CannotSetField error10)
	void Contestant_delete(1:string token, 2:ContestantId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Contestant_delete_member_user(1:string token, 2:ContestantId _self, 3:UserId user) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<ContestantStruct> Contestant_filter(1:string token, 2:optional ContestantStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<UserStruct> Contestant_get_member_users(1:string token, 2:ContestantId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ContestantStruct Contestant_get_struct(1:string token, 2:ContestantId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ContestantStruct Contestant_modify(1:string token, 2:ContestantId _self, 3:ContestantStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:InvalidLogin error7, 8:InvalidPassword error8, 9:CannotSetField error9)
	void Contestant_set_password(1:string token, 2:ContestantId _self, 3:string new_password) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:InvalidPassword error7)
}
service SystemRole extends Role {
	list<SystemRoleStruct> SystemRole_filter(1:string token, 2:optional SystemRoleStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SystemRoleStruct SystemRole_get_struct(1:string token, 2:SystemRoleId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service User extends Role {
	void User_activate(1:string token, 2:string activation_code) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string User_authenticate(1:string token, 2:string login, 3:string password) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:LoginFailed error7)
	void User_change_password(1:string token, 2:UserId _self, 3:string old_password, 4:string new_password) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:LoginFailed error7, 8:InvalidPassword error8)
	UserStruct User_create(1:string token, 2:UserStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:InvalidLogin error7, 8:InvalidEmail error8, 9:CannotSetField error9)
	void User_delete(1:string token, 2:UserId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<UserStruct> User_filter(1:string token, 2:optional UserStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	UserStruct User_get_struct(1:string token, 2:UserId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	UserStruct User_modify(1:string token, 2:UserId _self, 3:UserStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7, 8:InvalidLogin error8, 9:InvalidEmail error9)
	void User_profile_add_list(1:string token, 2:UserId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void User_profile_add_map(1:string token, 2:UserId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void User_profile_delete(1:string token, 2:UserId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute User_profile_get(1:string token, 2:UserId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string User_profile_get_blob(1:string token, 2:UserId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string User_profile_get_blob_hash(1:string token, 2:UserId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> User_profile_get_list(1:string token, 2:UserId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> User_profile_get_map(1:string token, 2:UserId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string User_profile_get_str(1:string token, 2:UserId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void User_profile_set(1:string token, 2:UserId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void User_profile_set_blob(1:string token, 2:UserId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void User_profile_set_blob_hash(1:string token, 2:UserId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void User_profile_set_list(1:string token, 2:UserId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void User_profile_set_map(1:string token, 2:UserId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void User_profile_set_str(1:string token, 2:UserId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void User_register(1:string token, 2:UserStruct fields, 3:string password, 4:optional map<string,AnonymousAttribute> profile) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:InvalidLogin error7, 8:InvalidPassword error8, 9:InvalidEmail error9, 10:CannotSetField error10)
	void User_set_password(1:string token, 2:UserId _self, 3:string new_password) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:InvalidPassword error7)
}
service Group extends Role {
	void Group_add_member(1:string token, 2:GroupId _self, 3:RoleId member) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	GroupStruct Group_create(1:string token, 2:GroupStruct fields, 3:optional list<RoleId> children) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Group_delete(1:string token, 2:GroupId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	void Group_delete_member(1:string token, 2:GroupId _self, 3:RoleId member) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<GroupStruct> Group_filter(1:string token, 2:optional GroupStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<RoleStruct> Group_get_members(1:string token, 2:GroupId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	GroupStruct Group_get_struct(1:string token, 2:GroupId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	GroupStruct Group_modify(1:string token, 2:GroupId _self, 3:GroupStruct fields) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
}
service Submit extends Entity {
	SubmitStruct Submit_create(1:string token, 2:SubmitStruct fields, 3:binary content, 4:string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Submit_data_add_list(1:string token, 2:SubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_data_add_map(1:string token, 2:SubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_data_delete(1:string token, 2:SubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Submit_data_get(1:string token, 2:SubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Submit_data_get_blob(1:string token, 2:SubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Submit_data_get_blob_hash(1:string token, 2:SubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Submit_data_get_list(1:string token, 2:SubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Submit_data_get_map(1:string token, 2:SubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Submit_data_get_str(1:string token, 2:SubmitId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Submit_data_set(1:string token, 2:SubmitId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_data_set_blob(1:string token, 2:SubmitId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Submit_data_set_blob_hash(1:string token, 2:SubmitId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_data_set_list(1:string token, 2:SubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_data_set_map(1:string token, 2:SubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_data_set_str(1:string token, 2:SubmitId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Submit_delete(1:string token, 2:SubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<SubmitStruct> Submit_filter(1:string token, 2:optional SubmitStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SubmitStruct Submit_get_struct(1:string token, 2:SubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Submit_get_test_suite_report(1:string token, 2:SubmitId _self, 3:optional TestSuiteId test_suite) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Submit_get_test_suite_status(1:string token, 2:SubmitId _self, 3:optional TestSuiteId test_suite) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SubmitStruct Submit_inject(1:string token, 2:SubmitStruct fields, 3:binary content, 4:string filename, 5:map<TestId,map<string,AnonymousAttribute>> test_results) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void Submit_override(1:string token, 2:SubmitId _self, 3:map<string,AnonymousAttribute> overrides) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Submit_overrides_add_list(1:string token, 2:SubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_overrides_add_map(1:string token, 2:SubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_overrides_delete(1:string token, 2:SubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute Submit_overrides_get(1:string token, 2:SubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Submit_overrides_get_blob(1:string token, 2:SubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string Submit_overrides_get_blob_hash(1:string token, 2:SubmitId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> Submit_overrides_get_list(1:string token, 2:SubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> Submit_overrides_get_map(1:string token, 2:SubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string Submit_overrides_get_str(1:string token, 2:SubmitId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void Submit_overrides_set(1:string token, 2:SubmitId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_overrides_set_blob(1:string token, 2:SubmitId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Submit_overrides_set_blob_hash(1:string token, 2:SubmitId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_overrides_set_list(1:string token, 2:SubmitId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_overrides_set_map(1:string token, 2:SubmitId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void Submit_overrides_set_str(1:string token, 2:SubmitId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Submit_rejudge_test_results(1:string token, 2:SubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Submit_rejudge_test_suite_results(1:string token, 2:SubmitId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service PrintJob extends Entity {
	PrintJobStruct PrintJob_create(1:string token, 2:PrintJobStruct fields, 3:binary content, 4:string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotSetField error7)
	void PrintJob_data_add_list(1:string token, 2:PrintJobId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void PrintJob_data_add_map(1:string token, 2:PrintJobId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void PrintJob_data_delete(1:string token, 2:PrintJobId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	Attribute PrintJob_data_get(1:string token, 2:PrintJobId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string PrintJob_data_get_blob(1:string token, 2:PrintJobId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	string PrintJob_data_get_blob_hash(1:string token, 2:PrintJobId _self, 3:string name) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	list<Attribute> PrintJob_data_get_list(1:string token, 2:PrintJobId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,AnonymousAttribute> PrintJob_data_get_map(1:string token, 2:PrintJobId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	string PrintJob_data_get_str(1:string token, 2:PrintJobId _self, 3:string name, 4:optional string fallback) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:BadAttributeType error7)
	void PrintJob_data_set(1:string token, 2:PrintJobId _self, 3:Attribute value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void PrintJob_data_set_blob(1:string token, 2:PrintJobId _self, 3:string name, 4:optional i32 length, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void PrintJob_data_set_blob_hash(1:string token, 2:PrintJobId _self, 3:string name, 4:string value, 5:optional string filename) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void PrintJob_data_set_list(1:string token, 2:PrintJobId _self, 3:list<Attribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void PrintJob_data_set_map(1:string token, 2:PrintJobId _self, 3:map<string,AnonymousAttribute> attributes) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:MissingBlob error7)
	void PrintJob_data_set_str(1:string token, 2:PrintJobId _self, 3:string name, 4:string value) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void PrintJob_delete(1:string token, 2:PrintJobId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:CannotDeleteObject error7)
	list<PrintJobStruct> PrintJob_filter(1:string token, 2:optional PrintJobStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	PrintJobStruct PrintJob_get_struct(1:string token, 2:PrintJobId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void PrintJob_reprint(1:string token, 2:PrintJobId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Privilege {
	bool Privilege_demand(1:string token, 2:EntityId entity, 3:string right) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	PrivilegeTimes Privilege_get(1:string token, 2:RoleId role, 3:EntityId entity, 4:string right) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	bool Privilege_global_demand(1:string token, 2:string right) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	PrivilegeTimes Privilege_global_get(1:string token, 2:RoleId role, 3:string right) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Privilege_global_grant(1:string token, 2:RoleId role, 3:string right, 4:optional PrivilegeTimes times) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<RoleStruct,PrivilegeTimes> Privilege_global_list(1:string token, 2:string right) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Privilege_global_revoke(1:string token, 2:RoleId role, 3:string right) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Privilege_grant(1:string token, 2:RoleId role, 3:EntityId entity, 4:string right, 5:optional PrivilegeTimes times) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<RoleStruct,PrivilegeTimes> Privilege_list(1:string token, 2:EntityId entity, 3:string right) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	void Privilege_revoke(1:string token, 2:RoleId role, 3:EntityId entity, 4:string right) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service Security {
	RoleStruct Security_anonymous(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	RoleStruct Security_authenticated(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	RoleStruct Security_whoami(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	UserStruct Security_whoami_user(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
service ExternalIdentity extends Entity {
	void ExternalIdentity_add(1:string token, 2:string salt) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:ExternalIdentityFailed error7)
	list<ExternalIdentityStruct> ExternalIdentity_filter(1:string token, 2:optional ExternalIdentityStruct arg_struct) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ExternalIdentityResult ExternalIdentity_finish(1:string token, 2:string callback, 3:map<string,string> arg_map) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:InvalidExternalIdentityCallback error7, 8:ExternalIdentityFailed error8)
	list<ExternalIdentityStruct> ExternalIdentity_get_linked(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	map<string,ExternalIdentityStruct> ExternalIdentity_get_ready(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ExternalIdentityStruct ExternalIdentity_get_struct(1:string token, 2:ExternalIdentityId _self) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ExternalIdentityRedirect ExternalIdentity_start(1:string token, 2:string handler, 3:string provider, 4:string return_to) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6, 7:InvalidExternalIdentityProvider error7)
}
service Web {
	SizedContestantList Web_get_accepted_contestants(1:string token, 2:ContestId contest, 3:optional i32 limit, 4:optional i32 offset) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SizedContestantList Web_get_contest_admins(1:string token, 2:ContestId contest, 3:optional i32 limit, 4:optional i32 offset) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<ContestInfo> Web_get_contest_list(1:string token) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	PageInfo Web_get_page_info(1:string token, 2:optional ContestId contest) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SizedContestantList Web_get_pending_contestants(1:string token, 2:ContestId contest, 3:optional i32 limit, 4:optional i32 offset) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ProblemMappingInfo Web_get_problem_mapping_info(1:string token, 2:ProblemMappingId problem, 3:optional bool include_html) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<ProblemMappingInfo> Web_get_problem_mapping_list(1:string token, 2:ContestId contest) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	ResultInfo Web_get_result_details(1:string token, 2:SubmitId submit) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SizedResultList Web_get_results(1:string token, 2:ContestId contest, 3:optional ContestantId contestant, 4:optional ProblemMappingId problem, 5:optional i32 limit, 6:optional i32 offset, 7:optional bool detailed_tsr) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	SubpageInfo Web_get_subpage_info(1:string token, 2:SubpageId subpage) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<SubpageInfo> Web_get_subpage_list_for_contest(1:string token, 2:ContestId contest, 3:bool announcements) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
	list<SubpageInfo> Web_get_subpage_list_global(1:string token, 2:bool announcements) throws (1:TokenInvalid error1, 2:TokenExpired error2, 3:AccessDenied error3, 4:ArgumentNotFound error4, 5:CannotReturnObject error5, 6:InvalidArgument error6)
}
