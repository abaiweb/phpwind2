<!doctype html>
<html>
<head>
<meta charset="<?php echo htmlspecialchars(Wekit::V('charset'), ENT_QUOTES, 'UTF-8');?>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','c','name'), ENT_QUOTES, 'UTF-8');?></title>
<link href="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','css'), ENT_QUOTES, 'UTF-8');?>/admin_style.css?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
<script>
//全局变量，是Global Variables不是Gay Video喔
var GV = {
	JS_ROOT : "<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','res'), ENT_QUOTES, 'UTF-8');?>/js/dev/",																									//js目录
	JS_VERSION : "<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>",																										//js版本号
	TOKEN : '<?php echo htmlspecialchars(Wind::getComponent('windToken')->saveToken('csrf_token'), ENT_QUOTES, 'UTF-8');?>',	//token ajax全局
	REGION_CONFIG : {},
	SCHOOL_CONFIG : {},
	URL : {
		LOGIN : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','loginUrl'), ENT_QUOTES, 'UTF-8');?>',																													//后台登录地址
		IMAGE_RES: '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>',																										//图片目录
		REGION : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=misc&c=webData&a=area'; ?>',					//地区
		SCHOOL : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','index.php?m=misc&c=webData&a=school'; ?>'				//学校
	}
};
</script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/wind.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/jquery.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>

</head>
<body>
<div class="wrap">
	<div class="nav">
		<div class="return"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=u&c=manage'; ?>">返回上一级</a></div>
		<ul class="cc">
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?uid=', rawurlencode($uid),'&m=u&c=manage&a=edit'; ?>">用户信息</a></li>
			<li class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?uid=', rawurlencode($uid),'&m=u&c=manage&a=editCredit'; ?>">积分</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?uid=', rawurlencode($uid),'&m=u&c=manage&a=editGroup'; ?>">用户组</a></li>
		</ul>
	</div>
<!--====================用户编辑开始====================-->
<!--积分-->
<div class="h_a">编辑用户积分</div>
<form class="J_ajaxForm" data-role="list" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=u&c=manage&a=doEditCredit'; ?>" method="post">
<div class="table_full">
	<table width="100%">
		<col class="th" />
		<col />
		<thead>
		<tr>
			<th>用户名</th>
			<td><span class="mr10"><?php echo htmlspecialchars($username, ENT_QUOTES, 'UTF-8');?></span> (UID：<?php echo htmlspecialchars($uid, ENT_QUOTES, 'UTF-8');?>)
			<input type="hidden" name="uid" value="<?php echo htmlspecialchars($uid, ENT_QUOTES, 'UTF-8');?>">
			</td>
		</tr>
		</thead>
		<?php foreach($credits as $key => $credit){ ?>
		<tr>
			<th><?php echo htmlspecialchars($credit['name'], ENT_QUOTES, 'UTF-8');?></th>
			<td><input name="credit[<?php echo htmlspecialchars($key, ENT_QUOTES, 'UTF-8');?>]" type="text" class="input length_5" value="<?php echo htmlspecialchars($credit['num'], ENT_QUOTES, 'UTF-8');?>"></td>
		</tr>
		<?php  } ?>
	</table>
</div>
	<div class="btn_wrap">
		 <div class="btn_wrap_pd">
				<button type="submit" class="btn btn_submit J_ajax_submit_btn">提交</button>
		 </div>
	</div>
<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>

</div>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/pages/admin/common/common.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
</body>
</html>