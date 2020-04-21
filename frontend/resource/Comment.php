<?php
namespace frontend\resource;

class Comment extends \common\models\Comment {
    public function fields() 
    {
        // @bedul 18 apr 2020, overwrite function fields
        // gak harus buat folder dan file ini, taruh di \common\models\Post juga bisa
        // tapi supaya rapih saja, jadi ketahuan model mana aja yg di pilih fields nya
        return ['id', 'title', 'body', 'post_id'];
    }

    public function extraFields() {
        //relasi ke table post, tambahkan extra fields di model ini
        return ['post'];
    }
}
?>