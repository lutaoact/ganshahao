<?php
require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

$smarty = new MySmarty();
if ($_POST) {
    var_dump($_POST);
    $user = array(
        id          => $_POST[user_id         ],
        nick_name   => $_POST[user_nick_name  ],
        email       => $_POST[user_email      ],
        real_name   => $_POST[user_real_name  ],
        mobile      => $_POST[user_mobile     ],
        description => $_POST[user_description],
        zipcode     => $_POST[user_zipcode    ],
        is_veteran  => $_POST[user_is_veteran ],
    );
} else {
    $user = array(
        id          => 1989,
        nick_name   => 'lutaoact',
        user_picture=> '***',
        email       => 'lutaoact@139.com',
        real_name   => '路涛',
        mobile      => 13800000000,
        description => '我还是很牛逼的，做网页杠杠的',
        zipcode     => '200001',
        is_veteran  => 1,
    );
}
$smarty->assign('user', $user);
$smarty->display('user/settings.tpl');
?>
