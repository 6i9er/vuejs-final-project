<?php

namespace App\Http\Controllers;

use App\Traits\ArrayTraits;
use App\Traits\Returns;
use Illuminate\Http\Request;
use App\Models\Member;
use App\User;
use Illuminate\Support\Facades\Auth;

class MemberController extends Controller
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
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
//        return "AA";
        return User::all();
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
        $checkMember = User::where("email" , $request->email)->first();
        if(count($checkMember) > 0){
            return  $this->jsonReturn('this email already existe' , '1' );
        }else{
            if(strlen($request->name ) < 4){
                return  $this->jsonReturn('Name must be greater than 4 chars' , '2' );
            }
            if(strlen($request->password ) < 6){
                return  $this->jsonReturn('password must be greater than 6 chars' , '3' );
            }
            if($request->password != $request->confirmPassword){
                return  $this->jsonReturn('password and confirm password not match' , '4' );
            }

            $newUser = new User();
            $newUser->name = $request->name;
            $newUser->password = bcrypt($request->password);
            $newUser->email = $request->email;
            $newUser->save();
            return  $this->jsonReturn(Auth::user() , '200' );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        if(!$user){
            return "no user found with this data";
        }
        return $user;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        if(!$user){
            return "no user found with this data";
        }
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

        $user = User::where("id",$id)->first();
        if(!$user){
            return  $this->jsonReturn('this user is not existe' , '1' );
        }

        if($request->name == ''){
            return  $this->jsonReturn('please enter your name' , '2' );
        }
        if(strlen($request->name) < 4){
            return  $this->jsonReturn('Name must be greater than 4 chars' , '3' );
        }

        if(strlen($request->email) == ''){
            return  $this->jsonReturn('please enter your email' , '4' );
        }
        $checkEmail = User::where('email' , $request->email)->where("id" , "!=" , $id)->first();
        if(count($checkEmail) > 0){
            return  $this->jsonReturn('this email is already registered' , '5' );
        }

        if($request->oldPassword != 'undefined'){
            if($request->password != $request->confirmPassword){
                return  $this->jsonReturn('password and confirm password does\'t Match' , '6' );
            }
        }

        $user->name = $request->name;
        $user->password = bcrypt($request->password);
        $user->email = $request->email;
        $user->save();
        return  $this->jsonReturn('data Saved' , '200' );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::where("id",$id)->first();
        if(!$user){
            return "no user found with this data";
        }
        $user->delete();
        return "user deleted";
    }

    public function login(Request $request){

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
          return  $this->jsonReturn(Auth::user() , '200' );
//            return Auth::user();
        }else{
          return  $this->jsonReturn('this user is not existe' , '404' );
            return 'this user is not existe';
        }

        return $member = User::where("email" , $request->email)->where("password" , bcrypt($request->password))->first();
    }
}
