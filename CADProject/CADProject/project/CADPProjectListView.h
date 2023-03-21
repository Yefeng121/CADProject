//
/** Trifo license **/
//  CADPProjectListView.h
//  CADProject
//
//  Created by Jianzhong on 2023/3/21
//  
//
	

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CADPProjectListView : UIView

@end
@interface CADPProjectListCell : UITableViewCell
+ (CADPProjectListCell *)createTableViewCellWith:(UITableView *)tableView withModel:(id)model;
@end
NS_ASSUME_NONNULL_END
