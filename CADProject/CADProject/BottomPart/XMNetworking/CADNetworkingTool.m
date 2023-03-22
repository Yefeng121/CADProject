//
//  CADNetworkingTool.m
//  CADNetworkingTool
//
//  Created by Keven on 2022/2/23.
//

#import "CADNetworkingTool.h"
static  NSString * releaseDeafultURL = @"https://cadsjktapp.com/apiroute/";
static  NSString * applePayURL = @"https://cadsjktapp.com/apiroute/apple/notice";
static  NSString * cadWebURL = @"https://cadsjktapp.com/web/view.html";

static  NSString * appKey = @"10008";
static  NSString * appSecurity = @"d0rl3ZiVXH2PD2KycR639Zt4xdHE19fr";

@interface CADNetworkingTool()
@end

@implementation CADNetworkingTool
static CADNetworkingTool *toolInstance;
+ (instancetype)shareNetworkingTool{
    static dispatch_once_t once_t;
    
    dispatch_once(&once_t, ^{
        toolInstance = [[CADNetworkingTool alloc] init];
    });
    
    return toolInstance;
}
- (instancetype)init{
    
    if (self = [super init]) {
        
    }
    return self;
}
- (void)createGeneralConfig{
    [XMCenter setupConfig:^(XMConfig *config) {
        config.generalServer = releaseDeafultURL;
        NSDictionary *appversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];

        
        NSString *dest = @"";
        config.generalHeaders = @{@"Timestamp":[self getNowTimeTimestamp].integerValue,
                                  @"Nonce": appversion,
                                  @"Appversion": appversion,
                                  @"sign": dest
                            };
        config.generalUserInfo = nil;
        config.callbackQueue = dispatch_get_main_queue();
        config.engine = [XMEngine sharedEngine];
    }];
}
- (void) sendRequestGETBlock:(NetworkingToolBlock)block{
    _toolBlock = block;
    [self createGeneralConfig];
    [XMCenter sendRequest:^(XMRequest *request) {
        request.api = @"apps/config/v1";
        request.httpMethod = kXMHTTPMethodGET;
    } onSuccess:^(id responseObject) {
        if (block) {
            block(YES,responseObject);
        }
    } onFailure:^(NSError *error) {
        NSLog(@"onFailure: %@", error);
        if (block) {
            block(NO,error);
        }
    }];
}
- (void)sendRequestWithType:(XMHTTPMethodType)method api:(NSString *)api param:(NSDictionary *)param Block:(NetworkingToolBlock)block{
    _toolBlock = block;
    [self createGeneralConfig];
    [XMCenter sendRequest:^(XMRequest *request) {
        request.api = api;
        request.httpMethod = method;
        request.parameters = param;
    } onSuccess:^(id responseObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (block) {
                block(YES,responseObject);
            }
        });
    } onFailure:^(NSError *error) {
        NSLog(@"onFailure: %@", error);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (block) {
                block(NO,error);
            }
        });
    }];
}

//获取当前时间戳 （以毫秒为单位）
-(NSString *)getNowTimeTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    return timeSp;
}
//- (void)createSignTimestamp:(NSInte) Int, nonce: String, appVersion: String) -> String {
//         let signDic: [String : Any] = ["AppKey": TEConst.AppKey,
//                        "Timestamp": timestamp,
//                        "Nonce": nonce,
//                        "Appversion": appVersion]
//         let signArray = signDic.keys.sorted()
//         var sortedSign = ""
//         for item in signArray {
//             if let itemStr = signDic[item] {
//                 sortedSign = sortedSign + "\(item)\(itemStr)"
//             }
//         }
//         let signString = sortedSign + TEConst.SecurityKey
//         return signString.md5_String
//     }
- (void)sortArrayForASCIIWithDic:(NSDictionary *)dic{
    NSArray *keyArray = [dic allKeys]; // 将dic中的全部key取出，并放到数组
    
    // 根据ASCII码,将参数key从小到大排序（升序）
    NSStringCompareOptions comparisonOptions  = NSCaseInsensitiveSearch | NSNumericSearch | NSWidthInsensitiveSearch | NSForcedOrderingSearch;
    
    NSComparator sort = ^(NSString *obj1, NSString *obj2) {
        NSRange range = NSMakeRange(0, obj1.length);
        return [obj1 compare:obj2 options:comparisonOptions range:range];
    };
    NSArray *resultArr = [keyArray sortedArrayUsingComparator:sort];
    
    NSMutableArray *paramValueArr = [NSMutableArray arrayWithCapacity:resultArr.count];
    
    for (NSString *str in resultArr) {
        // 将key对应的value，存到数组
        NSString *tokenStr = [dic objectForKey:[NSString stringWithFormat:@"%@", str]];
        if (tokenStr.length > 0) {
            [paramValueArr addObject:tokenStr];
        }
    }
    
    NSString *token = [paramValueArr componentsJoinedByString:appSecurity];
    token = token.md5; // MD5加密
}
@end
