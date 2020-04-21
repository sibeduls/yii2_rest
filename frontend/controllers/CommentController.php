<?php
namespace frontend\controllers;

// use yii\rest\ActiveController;
use frontend\controllers\MyactiveController;
use yii\data\ActiveDataProvider;
use frontend\resource\Comment;

class CommentController extends MyactiveController {
    public $modelClass = Comment::class;

    // public function behaviors() {
    //     $behavior = parent::behaviors();
    //     $behavior['authenticator']['authMethods'] = [
    //         HttpBearerAuth::class,
    //     ];
    //     $behavior['authenticator']['only'] = ['create', 'update', 'delete'];

    //     return $behavior;
    // }

    public function actions() {
        $action = parent::actions();
        $action['index']['prepareDataProvider'] = [$this, 'prepareDataProvider'];
        return $action;
    }

    public function prepareDataProvider() {
        return new ActiveDataProvider(
            [
                // 'query' => Comment::find()->andWhere(['post_id' => \Yii::$app->request->get('postId')])
                'query' => $this->modelClass::find()->andWhere(['post_id' => \Yii::$app->request->get('postId')])
            ]
        );
    }
}
?>