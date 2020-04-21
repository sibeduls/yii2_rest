<?php
namespace frontend\controllers;

// use yii\rest\ActiveController;
// use common\models\Post;
use frontend\controllers\MyactiveController;
use frontend\resource\Post;
// use yii\filters\auth\HttpBearerAuth;
// use yii\web\ForbiddenHttpException;

// class PostController extends ActiveController {
class PostController extends MyactiveController {
    public $modelClass = Post::class;

    // // @bedul overwrite behaviors
    // // gak dipakai disini lagi, sudah di extend dari MyactiveController
    // public function behaviors() {
    //     $behavior = parent::behaviors();
    //     // $behavior['authenticator'] = [
    //     //     'class' => HttpBearerAuth::class,
    //     // ];
    //     $behavior['authenticator']['authMethods'] = [
    //         HttpBearerAuth::class,
    //     ];
    //     $behavior['authenticator']['only'] = ['create', 'update', 'delete'];
    //     return $behavior;
    // }

    // public function checkAccess($action, $model = null, $params = [])
    // {
    //     if (in_array($action, ['update','delete'])) {
    //         if ($model->created_by != \Yii::$app->user->id) {
    //             throw new ForbiddenHttpException("You don't have permission to change this record");
    //         }
    //     }
    // }
}
?>