//
//  YFVNetworkingTool.h
//  YFVideoProject
//
//  Created by Keven on 2022/2/23.
//

#import <Foundation/Foundation.h>

#import <XMNetworking/XMNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^NetworkingToolBlock)(BOOL isSuccess,id responseObject);

@interface CADNetworkingTool : NSObject
+ (instancetype)shareNetworkingTool;
@property (nonatomic, copy) NetworkingToolBlock toolBlock;
- (void)sendRequestGETBlock:(NetworkingToolBlock)block;
- (void)sendRequestWithType:(XMHTTPMethodType)method api:(NSString *)api param:(NSDictionary *)param Block:(NetworkingToolBlock)block;
@end

NS_ASSUME_NONNULL_END
