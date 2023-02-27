//
//  JZBaseTableViewController.h
//
//  Created by JZ on 2023/2/27
//  
//
	

#import "JZBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JZBaseTableViewController : JZBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
/**
 MARK: 创建tableview
 */
- (void)createTableView;
- (void)refreshWithValue;
- (void)loadMoreWithValue;
- (void)endHeaderRefresh;
- (void)endFooterRefresh;

@end

NS_ASSUME_NONNULL_END
