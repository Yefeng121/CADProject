//
//  JZBaseTableViewCell.h
//
//  Created by JZ on 2023/2/27
//  
//
	

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JZBaseTableViewCell : UITableViewCell

+ (JZBaseTableViewCell *)createTableViewCellWith:(UITableView *)tableView withModel:(id)model;
- (void)createCellModel:(id)getModel;
- (void)createTableViewCell;
- (void)creatViewCellWithModel:(id)model;
@end

NS_ASSUME_NONNULL_END
