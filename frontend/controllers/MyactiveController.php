<?php
namespace frontend\controllers;

use yii\filters\auth\HttpBearerAuth;
use yii\web\ForbiddenHttpException;

class MyactiveController extends \yii\rest\ActiveController {
    // @bedul overwrite behaviors
    public function behaviors() {
        $behavior = parent::behaviors();
        // $behavior['authenticator'] = [
        //     'class' => HttpBearerAuth::class,
        // ];
        $behavior['authenticator']['authMethods'] = [
            HttpBearerAuth::class,
        ];
        $behavior['authenticator']['only'] = ['create', 'update', 'delete'];
        return $behavior;
    }

    public function checkAccess($action, $model = null, $params = [])
    {
        if (in_array($action, ['update','delete'])) {
            if ($model->created_by != \Yii::$app->user->id) {
                throw new ForbiddenHttpException("You don't have permission to change this record");
            }
        }
    }
}
?>