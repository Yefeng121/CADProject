//
//  CADBlueprintView.h
//  CADProject
//
//  Created by Jacy on 2023/2/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CADBlueprintBtnView,CADBlueprintProjectView,CADBlueprintView,CADBlueprintModel;

typedef void(^CADBlueprintViewBlock)(NSInteger index);
@interface CADBlueprintView : UIView
@property (nonatomic, copy) CADBlueprintViewBlock BlueprintViewBlock;
- (instancetype)initWithFrame:(CGRect)frame block:(CADBlueprintViewBlock)block;
@end

typedef void(^CADBlueprintBtnViewBlock)(NSInteger index);
@interface CADBlueprintBtnView : UIView
@property (nonatomic, copy) CADBlueprintBtnViewBlock btnViewBlock;
- (instancetype)initWithFrame:(CGRect)frame block:(CADBlueprintBtnViewBlock)block;
@end

typedef void(^CADBlueprintProjectViewBlock)(NSInteger index);
@interface CADBlueprintProjectView : UIControl
@property (nonatomic, copy) CADBlueprintProjectViewBlock ProjectViewBlock;
- (instancetype)initWithFrame:(CGRect)frame block:(CADBlueprintProjectViewBlock)block;
@end

typedef void(^CADBlueprintCellViewBlock)(NSInteger index);
@interface CADBlueprintCellView : UIView
@property (nonatomic, copy) CADBlueprintCellViewBlock cellViewBlock;
- (instancetype)initWithFrame:(CGRect)frame block:(CADBlueprintCellViewBlock)block;
@end

@interface CADBlueprintFileCell : UITableViewCell
+ (CADBlueprintFileCell *)createTableViewCellWith:(UITableView *)tableView withModel:(id)model;
@end
NS_ASSUME_NONNULL_END
