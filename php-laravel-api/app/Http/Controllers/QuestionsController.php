<?php 
namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Http\Requests\QuestionsAddRequest;
use App\Http\Requests\QuestionsEditRequest;
use App\Http\Requests\QuestionsattemptRequest;
use App\Models\Questions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Exception;
class QuestionsController extends Controller
{
	

	/**
     * List table records
	 * @param  \Illuminate\Http\Request
     * @param string $fieldname //filter records by a table field
     * @param string $fieldvalue //filter value
     * @return \Illuminate\View\View
     */
	function index(Request $request, $fieldname = null , $fieldvalue = null){
		$query = Questions::query();
		if($request->search){
			$search = trim($request->search);
			Questions::search($query, $search);
		}
		if($request->orderby){
			$orderby = $request->orderby;
			$ordertype = ($request->ordertype ? $request->ordertype : "desc");
			$query->orderBy($orderby, $ordertype);
		}
		else{
			$query->orderBy("questions.points", "DESC");
		}
		if($fieldname){
			$query->where($fieldname , $fieldvalue); //filter by a single field name
		}
		$records = $this->paginate($query, Questions::listFields());
		return $this->respond($records);
	}
	

	/**
     * Select table record by ID
	 * @param string $rec_id
     * @return \Illuminate\View\View
     */
	function view($rec_id = null){
		$query = Questions::query();
		$query->join("users", "questions.user_id", "=", "users.id");
		$record = $query->findOrFail($rec_id, Questions::viewFields());
		return $this->respond($record);
	}
	

	/**
     * Save form record to the table
     * @return \Illuminate\Http\Response
     */
	function add(QuestionsAddRequest $request){
		$modeldata = $request->validated();
		$this->beforeAdd($modeldata);
		
		//save Questions record
		$record = Questions::create($modeldata);
		$rec_id = $record->id;
		return $this->respond($record);
	}
    /**
     * Before create new record
     * @param array $modeldata // validated form data used to create new record
     */
    private function beforeAdd($modeldata){
        //enter statement here
        $user = DB::table('Questions')->where('user_id', $modeldata['user_id'])->first();
        if($user){
        DB::table('Questions')->where('user_id', $modeldata['user_id'])->update(['points' => $modeldata['points']]);
        exit;
    }
    }
	

	/**
     * Update table record with form data
	 * @param string $rec_id //select record by table primary key
     * @return \Illuminate\View\View;
     */
	function edit(QuestionsEditRequest $request, $rec_id = null){
		$query = Questions::query();
		$record = $query->findOrFail($rec_id, Questions::editFields());
		if ($request->isMethod('post')) {
			$modeldata = $request->validated();
			$record->update($modeldata);
		}
		return $this->respond($record);
	}
	

	/**
     * Delete record from the database
	 * Support multi delete by separating record id by comma.
	 * @param  \Illuminate\Http\Request
	 * @param string $rec_id //can be separated by comma 
     * @return \Illuminate\Http\Response
     */
	function delete(Request $request, $rec_id = null){
		$arr_id = explode(",", $rec_id);
		$query = Questions::query();
		$query->whereIn("id", $arr_id);
		$query->delete();
		return $this->respond($arr_id);
	}
	

	/**
     * List table records
	 * @param  \Illuminate\Http\Request
     * @param string $fieldname //filter records by a table field
     * @param string $fieldvalue //filter value
     * @return \Illuminate\View\View
     */
	function quiz(Request $request, $fieldname = null , $fieldvalue = null){
		$query = Questions::query();
		if($request->search){
			$search = trim($request->search);
			Questions::search($query, $search);
		}
		$orderby = $request->orderby ?? "questions.id";
		$ordertype = $request->ordertype ?? "desc";
		$query->orderBy($orderby, $ordertype);
		if($fieldname){
			$query->where($fieldname , $fieldvalue); //filter by a single field name
		}
		$records = $this->paginate($query, Questions::quizFields());
		return $this->respond($records);
	}
	

	/**
     * List table records
	 * @param  \Illuminate\Http\Request
     * @param string $fieldname //filter records by a table field
     * @param string $fieldvalue //filter value
     * @return \Illuminate\View\View
     */
	function major(Request $request, $fieldname = null , $fieldvalue = null){
		$query = Questions::query();
		if($request->search){
			$search = trim($request->search);
			Questions::search($query, $search);
		}
		$orderby = $request->orderby ?? "questions.id";
		$ordertype = $request->ordertype ?? "desc";
		$query->orderBy($orderby, $ordertype);
		if($fieldname){
			$query->where($fieldname , $fieldvalue); //filter by a single field name
		}
		$records = $this->paginate($query, Questions::majorFields());
		return $this->respond($records);
	}
	

	/**
     * Save form record to the table
     * @return \Illuminate\Http\Response
     */
	function attempt(QuestionsattemptRequest $request){
		$modeldata = $request->validated();
		
		//save Questions record
		$record = Questions::create($modeldata);
		$rec_id = $record->id;
		return $this->respond($record);
	}
	

	/**
     * List table records
	 * @param  \Illuminate\Http\Request
     * @param string $fieldname //filter records by a table field
     * @param string $fieldvalue //filter value
     * @return \Illuminate\View\View
     */
	function manage_leaderboard(Request $request, $fieldname = null , $fieldvalue = null){
		$query = Questions::query();
		if($request->search){
			$search = trim($request->search);
			Questions::search($query, $search);
		}
		$query->join("users", "questions.user_id", "=", "users.id");
		if($request->orderby){
			$orderby = $request->orderby;
			$ordertype = ($request->ordertype ? $request->ordertype : "desc");
			$query->orderBy($orderby, $ordertype);
		}
		else{
			$query->orderBy("questions.points", "DESC");
		}
		if($fieldname){
			$query->where($fieldname , $fieldvalue); //filter by a single field name
		}
		$records = $this->paginate($query, Questions::manageLeaderboardFields());
		return $this->respond($records);
	}
}
