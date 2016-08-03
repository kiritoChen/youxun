//
//  DataPath.h
//  CCBasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#ifndef DataPath_h
#define DataPath_h
// 所有英雄列表
#define kAllHeroPath @"http://lolbox.duowan.com/phone/apiHeroes.php?type=all&v=197&OSType=iOS9.3.1"
// 英雄头像(来自掌上英雄联盟)
#define kHeroIconPath @"http://down.qq.com/qqtalk/lolApp/img/champion/%@.png"
// 英雄详情
#define kHeroDetailPath @"http://lolbox.duowan.com/phone/apiHeroDetail.php?v=197&OSType=iOS9.3.1&heroName=%@"
// 英雄的技能地址
#define kHeroSkillPath @"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3"
// 周免英雄地址
#define kFreeHeroPath @"http://lolbox.duowan.com/phone/apiHeroes.php?type=free&v=197&OSType=iOS9.3.1"
// 召唤师查询
#define kSummonerSearch @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"

// 兔玩游戏
#define kTouTiaoPath @"http://cache.tuwan.com/app/?appid=1&classmore=indexpic&appid=1&appver=2.1&start=%ld"
#define kDuJiaPath @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=%@&appid=1&appver=2.1&start=%ld"
#define kAnHeiPath @"http://cache.tuwan.com/app/?appid=1&dtid=83623&classmore=indexpic&appid=1&appver=2.1&start=%ld"
#define kMoShouPath @"http://cache.tuwan.com/app/?appid=1&dtid=31537&classmore=indexpic&appid=1&appver=2.1&start=%ld"
#define kFengBaoPath @"http://cache.tuwan.com/app/?appid=1&dtid=31538&classmore=indexpic&appid=1&appver=2.1&start=%ld"
#define kLuShiPath @"http://cache.tuwan.com/app/?appid=1&dtid=31528&classmore=indexpic&appid=1&appver=2.1&start=%ld"
#define kXinJiPath @"http://cache.tuwan.com/app/?appid=1&dtid=91821&appid=1&appver=2.1&start=%ld"
#define kShouWangPath @"http://cache.tuwan.com/app/?appid=1&dtid=57067&appid=1&appver=2.1&start=%ld"
#define kTuPianPath @"http://cache.tuwan.com/app/?appid=1&type=pic&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld"
#define kShiPinPath @"http://cache.tuwan.com/app/?appid=1&type=video&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld"
#define kGongLuePath @"http://cache.tuwan.com/app/?appid=1&type=guide&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld"
#define kHuanHuaPath @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=%@&appid=1&appver=2.1&start=%ld"
#define kQuWenPath @"http://cache.tuwan.com/app/?appid=1&dtid=0&class=heronews&mod=%@&classmore=indexpic&appid=1&appver=2.1&start=%ld"
#define kCOSPath @"http://cache.tuwan.com/app/?appid=1&class=cos&mod=cos&classmore=indexpic&dtid=0&appid=1&appver=2.1&start=%ld"
#define kMeiNvPath @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=%@&classmore=indexpic&typechild=cos1&appid=1&appver=2.1&start=%ld"
// 视频播放
#define kVideoPath @"http://ow.tuwan.com/%@/"

// 多玩盒子
#define kDWTouTiao @"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=headlineNews&p=%ld&v=197&OSType=iOS9.3.1&versionName=3.2.0"
#define kDWShiPing @"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=newsVideo&p=%ld&v=197&OSType=iOS9.3.1&versionName=3.2.0"
#define kDWSaiShi @"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=upgradenews&p=%ld&v=197&OSType=iOS9.3.1&versionName=3.2.0"
#define kDWLiangZhao @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=beautifulWoman&p=%ld&v=197&OSType=iOS9.3.1&versionName=3.2.0"
#define kDWJionTu @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=jiongTu&p=%ld&v=197&OSType=iOS9.3.1&versionName=3.2.0"
#define kDWBiZhi @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=wallpaper&p=%ld&v=197&OSType=iOS9.3.1&versionName=3.2.0"

// 新闻详细地址
#define kNewsAddress @"http://webpd.mbox.duowan.com/index.php?r=zxweb/news&newsId=%@"
// 图片浏览
#define kPhotosPath @"http://box.dwstatic.com/apiAlbum.php?action=d&albumId=%@&v=197&OSType=iOS9.3.1&versionName=3.2.0"




#endif /* DataPath_h */
