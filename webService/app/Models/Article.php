<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Article extends Model
{
    use Notifiable;
    protected $table = 'articles';
    use SoftDeletes;
    protected $dates = ['deleted_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'content', 'author','member_id',
    ];

    public function categories(){
        return $this->hasMany('App\Models\Category_Article','article_id');
    }


}
