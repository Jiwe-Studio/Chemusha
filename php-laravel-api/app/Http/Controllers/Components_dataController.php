<?php 
namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
/**
 * Components Data Contoller
 * Use for getting values from the database for page components
 * Support raw query builder
 * @category Controller
 */
class Components_dataController extends Controller{
	public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['users_username_exist','users_email_exist']]);
    }
	/**
     * check if username value already exist in Users
	 * @param string $value
     * @return bool
     */
	function users_username_exist(Request $request, $value){
		$exist = DB::table('users')->where('username', $value)->value('username');   
		if($exist){
			return "true";
		}
		return "false";
	}
	/**
     * check if email value already exist in Users
	 * @param string $value
     * @return bool
     */
	function users_email_exist(Request $request, $value){
		$exist = DB::table('users')->where('email', $value)->value('email');   
		if($exist){
			return "true";
		}
		return "false";
	}
	/**
     * post_option_list Model Action
     * @return array
     */
	function post_option_list(Request $request){
		$sqltext = "SELECT  DISTINCT id AS value,username AS label FROM users ORDER BY id";
		$query_params = [];
		$arr = DB::select(DB::raw($sqltext), $query_params);
		return $arr;
	}
}
