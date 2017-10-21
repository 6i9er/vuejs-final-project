<?php
namespace App\Traits;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
trait ArrayTraits
{

    /**
     * Return object contain all data for user and null if the user not logged in
     * @param $request
     * @return null|object
     */
    public function removeElementFromArray($request = [] , $elements = [])
    {
        $returnArray = array();
        foreach ($request as $key=>$value){
            if(!in_array($key , $elements)){
               $returnArray[$key]  = $value;
            }
        }
        return $returnArray;
    }

}
