<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\File;
use App\Traits\Returns;

class ArticlesController extends Controller
{
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


    public function mina(Request $request)
    {

        $photos = $request->file('image');
//        return count($photos);
        foreach($photos as $photo){
            $image_type     = $photo->getClientOriginalExtension();
            $image_name     = rand(99, 999999) . date('YmdHis') . "." . $image_type;
            $image_path     = public_path() . "/uploads"."/";
            $photo->move($image_path, $image_name);
        }
        return  $this->jsonReturn( "Done", '200' );
    }



}
