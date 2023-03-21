//
/** Trifo license **/
//  CADTeamMembersView.h
//  CADProject
//
//  Created by Jianzhong on 2023/3/21
//  
//
	

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CADTeamMembersCell;
@interface CADTeamMembersView : UIView

@end
@interface CADTeamMembersCell : UITableViewCell

+ (CADTeamMembersCell *)createTableViewCellWith:(UITableView *)tableView withModel:(id)model;
@end
NS_ASSUME_NONNULL_END
