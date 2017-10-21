<?php
namespace App\Traits;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
trait Returns
{

    /**
     * Return object contain all data for user and null if the user not logged in
     * @param $request
     * @return null|object
     */
    public function jsonReturn($data  , $status)
    {
        return response()->json(['status' =>$status , 'data' => $data]);
    }

}
