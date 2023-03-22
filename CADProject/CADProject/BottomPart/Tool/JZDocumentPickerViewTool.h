//
/** Trifo license **/
//  JZDocumentPickerViewTool.h
//  CADProject
//
//  Created by Jianzhong on 2023/3/22
//  
//
	

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^JZDocumentPickerViewToolBlock)(id object);

@interface JZDocumentPickerViewTool : NSObject
+ (instancetype)sharePhotosAblumTool;
@property (nonatomic, copy) JZDocumentPickerViewToolBlock ToolBlock;
- (void)getPickerViewToolWith:(UIViewController *)targetVC block:(JZDocumentPickerViewToolBlock)block;
@end

NS_ASSUME_NONNULL_END
