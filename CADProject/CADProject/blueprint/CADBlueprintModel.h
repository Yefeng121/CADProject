//
//  CADBlueprintModel.h
//  CADProject
//
//  Created by Jacy on 2023/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CADBlueprintModel : NSObject
@property (nonatomic, copy) NSString *fileID;
@property (nonatomic, copy) NSString *fileType;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *fileTime;
@end

NS_ASSUME_NONNULL_END
