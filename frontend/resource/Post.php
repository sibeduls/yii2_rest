<?php
namespace frontend\resource;

class Post extends \common\models\Post {
    public function fields() 
    {
        // @bedul 18 apr 2020, overwrite function fields
        // gak harus buat folder dan file ini, taruh di \common\models\Post juga bisa
        // tapi supaya rapih saja, jadi ketahuan model mana aja yg di pilih fields nya
        // 'comments' disini dari relation di models/Post.php
        return ['id', 'title', 'body', 'created_at', 'created_by'];
        // return ['id', 'title', 'body', 'created_at', 'created_by', 'comments'];
    }

    public function extraFields() {
        return ['updated_at', 'comments'];
    }

    public function getComments()
    {
        //overwrite supaya, baca table Comment nya disini yg dipakai. yg di models/post tidak lagi dibaca
        return $this->hasMany(Comment::class, ['post_id' => 'id']);
    }
}
?>