<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Category_Article;
use App\Traits\Returns;
use Illuminate\Http\Request;
use App\Models\Member;
use App\User;
use App\Models\Article;
use App\Traits\ArrayTraits;
use Illuminate\Support\Facades\Auth;

class ArticleController extends Controller
{
    use ArrayTraits;
    use Returns;

     public function __construct(){

if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');    // cache for 1 day
}

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");         

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers:        {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

    exit(0);
}

     // header("Access-Control-Allow-Origin: *");

    }
// 
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

//        return "AA";
        return Article::all();
        //
    }


    public function createpost(Request $request){
        $id = ($request->id) ? $request->id : 0;
        $member = User::find($id);
        $categories = Category::select("name" , "id")->get();
        $arr['member'] = $member;
        $arr['categories'] = $categories;
        return  $this->jsonReturn( $arr, '200' );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return Auth::user();
        return $id;
        $member = User::find($id);
       $categories = Category::select("name" , "id")->get();
       $arr['member'] = $member;
       $arr['categories'] = $categories;
        return  $this->jsonReturn( $arr, '200' );
    }

    /**
     * Store a newly created resource in storage.
     *Create New User
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

//        return $request;
// return "AAAAA";
        $arrayRequest = $request->toArray();
        $finalRequest = $this->removeElementFromArray($arrayRequest,array("categories"));
//         return count($arrayRequest['categories']);

        // return $finalRequest;
         $article = Article::create($finalRequest);
//         return $article->id;
        if(isset($arrayRequest['categories']) ){
            for ($i=0; $i<count($arrayRequest['categories']);$i++){
//            foreach ($arrayRequest['categories'] as $value){
                $newCateory = new Category_Article();
                $newCateory->article_id = $article->id;
                $newCateory->category_id = $arrayRequest['categories'][$i];
                $newCateory->save();
            }
        }
        return  $this->jsonReturn( "data saved Successfull", '200' );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $returnArray = array();
        $user = Article::find($id);
        if(!$user){
            return  $this->jsonReturn( "no user found with this data", '404' );
            return "no user found with this data";
        }
        $returnArray['article'] = $user;
        $returnArray['article']->date = date("Y-m-d" , strtotime($returnArray['article']->created_at));
        for($i=0;$i < count($user->categories) ; $i++){
            $categoryArray = array();
             $categoryArray['id'] = $user->categories[$i]->category_id;
            $categoryArray['name'] = $user->categories[$i]->category->name;
            $returnArray['article']['categories'][$i] = $categoryArray;
//            array_push($returnArray['article']['categories'] , $categoryArray);
        }
        return  $this->jsonReturn( $returnArray, '200' );

        return $returnArray;
//        return $returnArray;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $returnArray = array();
        $user = Article::find($id);
        if(!$user){
            return  $this->jsonReturn( "no Articles found with this data", '200' );

        }
        $returnArray['article'] = $user;
        $catIds=array();
        $catNames=array();
        foreach ($user->categories as $category){
            array_push($catIds,$category->category_id);
            array_push($catNames,$category->category->name);
        }
        $categories = Category::all();
        $returnArray['categoriesIds'] = $catIds;
        $returnArray['categories'] = $categories;
        $returnArray['categoriesNames'] = $catNames;
        return  $this->jsonReturn( $returnArray, '200' );

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = Article::find($id);
        if(!$user){
            return  $this->jsonReturn( "no Articles found with this data", '1' );
        }
        if($user->member_id != $request->member_id){
            return  $this->jsonReturn( "this Articles is not yours", '2' );
        }
        $arrayRequest = $request->toArray();
        $finalRequest = $this->removeElementFromArray($arrayRequest,array("categories" , "_method"));
        $article = Article::where("id" , $id)->update($finalRequest);
        Category_Article::where("article_id" , $id)->delete();
        if(isset($arrayRequest['categories'] )){
//            $categoruArray=explode("," , $arrayRequest['categories']);
            foreach ($arrayRequest['categories']as $value){
                $newCateory = new Category_Article();
                $newCateory->article_id = $id;
                $newCateory->category_id = $value;
                $newCateory->save();
            }
        }
        return  $this->jsonReturn( "articles updated", '200' );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request , $id)
    {
//        return $request->member_id;
        $article = Article::find($id);
        if(!$article){
            return  $this->jsonReturn( "no Articles found with this data", '1' );
        }
        if($article->member_id != $request->member_id){
            return  $this->jsonReturn( "this article is not yours", '2' );
        }
        Category_Article::where("article_id" , $id)->delete();
        $article->delete();
        return  $this->jsonReturn( "article Deleted Successfully", '200' );

    }

    public function getArticles(Request $request){
        $start = ($request->start) ? $request->start : 0 ;
        $count = ($request->count) ? $request->count : 2  ;
        $articlesCount = Article::count();
        $pages = round ( $articlesCount/$count , 0 , PHP_ROUND_HALF_DOWN  ) ;
        $articles = Article::orderBy("id" , "DESC")->skip($start * $count)->take($count)->get();
        $arr['totalPages'] = $pages ;
        $arr['articles'] = $articles;
        return  $this->jsonReturn( $arr, '1' );
    }

    public function getArticlesForSearch(Request $request){
        $start = ($request->start) ? $request->start : 0 ;
        $count = ($request->count) ? $request->count : 2  ;
        $id = ($request->id) ? $request->id : 0  ;
        $categories = Category_Article::where("category_id" , $request->id)->pluck("article_id");
        $articles = Article::whereIn("id" ,$categories)->get();
        if(count($articles) > 0){
            return  $this->jsonReturn( $articles, '200' );
        }
        return  $this->jsonReturn( "no data found", '404' );
    }
    public function getArticlesForUser(Request $request){
        $id = ($request->member_id) ? $request->member_id : 0  ;
        $articles = Article::where("member_id" ,$id)->get();
        if(count($articles) > 0){
            return  $this->jsonReturn( $articles, '200' );
        }
        return  $this->jsonReturn( "no data found", '404' );
    }


}
