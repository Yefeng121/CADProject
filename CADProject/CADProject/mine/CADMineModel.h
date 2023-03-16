//
/** Trifo license **/
//  CADMineModel.h
//  CADProject
//
//  Created by Jianzhong on 2023/3/16
//  
//
	

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CADMineModel : NSObject

@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *user_img;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *user_Open;

@end
@interface CADMineCellModel : NSObject

@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *arrowImage;

@end

NS_ASSUME_NONNULL_END
