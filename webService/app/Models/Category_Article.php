<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Category_Article extends Model
{
    use Notifiable;
    protected $table = 'categories_articles';
    use SoftDeletes;
    protected $dates = ['deleted_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'article_id','category_id','deleted_at'
    ];

    public function article(){
        return $this->belongsTo('App\Models\Article','article_id');
    }

    public function category(){
        return $this->belongsTo('App\Models\Category','category_id');
    }


}
