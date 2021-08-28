<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Questions extends Model 
{
	

	/**
     * The table associated with the model.
     *
     * @var string
     */
	protected $table = 'questions';
	

	/**
     * The table primary key field
     *
     * @var string
     */
	protected $primaryKey = 'id';
	

	/**
     * Table fillable fields
     *
     * @var array
     */
	protected $fillable = ["user_id","points","date","username"];
	

	/**
     * Set search query for the model
	 * @param \Illuminate\Database\Eloquent\Builder $query
	 * @param string $text
     */
	public static function search($query, $text){
		//search table record 
		$search_condition = '(
				username LIKE ?  OR 
				points LIKE ? 
		)';
		$search_params = [
			"%$text%","%$text%"
		];
		//setting search conditions
		$query->whereRaw($search_condition, $search_params);
	}
	

	/**
     * return list page fields of the model.
     * 
     * @return array
     */
	public static function listFields(){
		return [ 
			"id", 
			"username", 
			"points", 
			"date", 
			"user_id" 
		];
	}
	

	/**
     * return exportList page fields of the model.
     * 
     * @return array
     */
	public static function exportListFields(){
		return [ 
			"id", 
			"username", 
			"points", 
			"date", 
			"user_id" 
		];
	}
	

	/**
     * return view page fields of the model.
     * 
     * @return array
     */
	public static function viewFields(){
		return [ 
			"questions.id AS id", 
			"questions.user_id AS user_id", 
			"Users.username AS users_username", 
			"questions.points AS points", 
			"questions.date AS date", 
			"questions.username AS username" 
		];
	}
	

	/**
     * return exportView page fields of the model.
     * 
     * @return array
     */
	public static function exportViewFields(){
		return [ 
			"questions.id AS id", 
			"questions.user_id AS user_id", 
			"Users.username AS users_username", 
			"questions.points AS points", 
			"questions.date AS date", 
			"questions.username AS username" 
		];
	}
	

	/**
     * return edit page fields of the model.
     * 
     * @return array
     */
	public static function editFields(){
		return [ 
			"id", 
			"user_id", 
			"points", 
			"date", 
			"username" 
		];
	}
	

	/**
     * return quiz page fields of the model.
     * 
     * @return array
     */
	public static function quizFields(){
		return [ 
			"id", 
			"user_id", 
			"points", 
			"date", 
			"username" 
		];
	}
	

	/**
     * return exportQuiz page fields of the model.
     * 
     * @return array
     */
	public static function exportQuizFields(){
		return [ 
			"id", 
			"user_id", 
			"points", 
			"date", 
			"username" 
		];
	}
	

	/**
     * return major page fields of the model.
     * 
     * @return array
     */
	public static function majorFields(){
		return [ 
			"id", 
			"user_id", 
			"points", 
			"date", 
			"username" 
		];
	}
	

	/**
     * return exportMajor page fields of the model.
     * 
     * @return array
     */
	public static function exportMajorFields(){
		return [ 
			"id", 
			"user_id", 
			"points", 
			"date", 
			"username" 
		];
	}
	

	/**
     * return manageLeaderboard page fields of the model.
     * 
     * @return array
     */
	public static function manageLeaderboardFields(){
		return [ 
			"questions.id AS id", 
			"questions.user_id AS user_id", 
			"Users.username AS users_username", 
			"questions.points AS points", 
			"questions.date AS date", 
			"questions.username AS username" 
		];
	}
	

	/**
     * return exportManageLeaderboard page fields of the model.
     * 
     * @return array
     */
	public static function exportManageLeaderboardFields(){
		return [ 
			"questions.id AS id", 
			"questions.user_id AS user_id", 
			"Users.username AS users_username", 
			"questions.points AS points", 
			"questions.date AS date", 
			"questions.username AS username" 
		];
	}
	

	/**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
	public $timestamps = false;
}
