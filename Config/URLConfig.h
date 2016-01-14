//
//  URLConfig.h
//  pudding
//
//  Created by 千锋 on 16/1/7.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#ifndef pudding_URLConfig_h
#define pudding_URLConfig_h

/**
 *  必传参数
 */
#define kTureParam @"apiKey=yuki_android&deviceKey=00000000-3103-e415-3b2f-eb111d56cb82&version=2.8.1&brand=Huawei&model=H60-L02&osv=4.4.2&os=Android&cpuArch=armv7l&timestamp=1451461027&channelId=huawei&auth1=138919df50d4fd149917daecbbf0a3f0&currentUserId=556059efe597fa91338b4ec2&auth2=1b21d7b348dcb77815de9e98def5d779"
/**
 *  新番横幅链接
 */
#define kNew_banner_URL @"http://pudding.cc/api/v1/config?fields=featured_banner&"

#define kNew_AllXinFan_URL @"http://pudding.cc/api/v1/onair_anime?offset=0&limit=20&"

/**
 *  推荐横幅链接
 */
#define kRecommend_banner_URL @"http://pudding.cc/api/v1/config?fields=recommend_banner&"

/**
 *  推荐新番链接
 */
#define kRecommend_XinFan_URL @"http://pudding.cc/api/v1/onair_anime?offset=0&limit=8&"

/**
 *  推荐分区视频链接
 */
#define kRecommend_FenQu_URL @"http://pudding.cc/api/v1/channel/recommended_ep?epLimit=4&"

/**
 *  分区链接
 */
#define kClassify_URL @"http://pudding.cc/api/v2/ep_category?"

#define kAnimation_Detaile_URL @"http://pudding.cc/api/v1/user_anime/%@?%@"

#endif
