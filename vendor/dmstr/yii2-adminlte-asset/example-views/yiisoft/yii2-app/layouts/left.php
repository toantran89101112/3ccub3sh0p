<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p><?=Yii::$app->user->identity->username;?></p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form 
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        search form -->
        <?php $items = [
                    ['label' => 'Main Menu', 'options' => ['class' => 'header']],
                    ['label' => 'Sản phẩm', 'icon' => 'fa fa-user-secret  text-red', 'url' => ['/products']],
                    ['label' => 'Chi tiết sản phẩm', 'icon' => 'fa fa-user-secret  text-red', 'url' => ['/productdetail']],
                    ['label' => 'Tài Khoản Hệ Thống', 'icon' => 'fa fa-user-secret  text-red', 'url' => ['/admin']],
                    ['label' => 'Quản Lý Key Thuộc Tính', 'icon' => 'fa fa-circle-o', 'url' => ['/mkeyconst']],
                    ['label' => 'Quản Lý Thiết Lập', 'icon' => 'fa fa-cog text-red', 'url' => ['/msetting']],
                ];
                ?>
        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu'],
                'items' => $items
            ]
        ) ?>

    </section>

</aside>
