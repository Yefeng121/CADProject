//
//  CADRequestModel.h
//  CADRequestModel
//
//  Created by Jacy on 2022/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CADRequestModel : NSObject
@property (nonatomic, copy) NSString *bundleId;
@property (nonatomic, copy) NSString *fullKey;
@property (nonatomic, copy) NSString *startKey;
@property (nonatomic, assign) NSInteger timeStamp;
@property (nonatomic, copy) NSString *uuid;

@end

NS_ASSUME_NONNULL_END
