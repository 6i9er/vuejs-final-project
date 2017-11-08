<?php

namespace App\Http\Controllers;

use App\Models\Category_Article;
use Illuminate\Http\Request;
use App\Models\Member;
use App\User;
use App\Models\Article;
use App\Traits\ArrayTraits;
class UserController extends Controller
{
    use ArrayTraits;

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

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return "A";
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

// return "AAAAA";
        $arrayRequest = $request->toArray();
        $finalRequest = $this->removeElementFromArray($arrayRequest,array("categories"));
//         return count($arrayRequest['categories']);

        // return $finalRequest;
         $article = Article::create($finalRequest);
//         return $article->id;
        if($arrayRequest['categories'] != ''){
            for ($i=0; $i<count($arrayRequest['categories']);$i++){
//            foreach ($arrayRequest['categories'] as $value){
                $newCateory = new Category_Article();
                $newCateory->article_id = $article->id;
                $newCateory->category_id = $arrayRequest['categories'][$i];
                $newCateory->save();
            }
        }
        return "new Article Saved";
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
            return "no user found with this data";
        }
        $returnArray['article'] = $user;
//            $returnArray['article']['categories'] = $user->categories;
//        return $user->categories;
//        $returnArray['article']['categories'] = array();

        for($i=0;$i < count($user->categories) ; $i++){
            $categoryArray = array();
             $categoryArray['id'] = $user->categories[$i]->category_id;
            $categoryArray['name'] = $user->categories[$i]->category->name;
            $returnArray['article']['categories'][$i] = $categoryArray;
//            array_push($returnArray['article']['categories'] , $categoryArray);
        }
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
            return "no user found with this data";
        }
        $returnArray['article'] = $user;
        $returnArray['article']['categories'] = $user->categories;
        return $user;
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
            return "no article found with this data";
        }
        $arrayRequest = $request->toArray();
        $finalRequest = $this->removeElementFromArray($arrayRequest,array("categories" , "_method"));
        $article = Article::where("id" , $id)->update($finalRequest);
        Category_Article::where("article_id" , $id)->delete();
        if($arrayRequest['categories'] != ''){
            $categoruArray=explode("," , $arrayRequest['categories']);
            foreach ($categoruArray as $value){
                $newCateory = new Category_Article();
                $newCateory->article_id = $id;
                $newCateory->category_id = $value;
                $newCateory->save();
            }
        }
        return " Article Saved";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = Article::find($id);
        if(!$user){
            return "no user found with this data";
        }
        Category_Article::where("article_id" , $id)->delete();
        $user->delete();
        return "user deleted";
    }





}
