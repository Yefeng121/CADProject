//
//  JZBaseTableViewController.m
//  Created by JZ on 2023/2/27
//  
//
	

#import "JZBaseTableViewController.h"

@interface JZBaseTableViewController ()

@end

@implementation JZBaseTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}
/**
 MARK: 创建tableview
 */
-(void)createTableView{

	if (!self.tableView) {

		self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SafeAreaHeight) style:UITableViewStyleGrouped];
		[self.view addSubview:self.tableView];
	}
	self.tableView.dataSource=self;
	self.tableView.delegate=self;
	self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
	self.tableView.scrollEnabled=YES;
	self.tableView.backgroundColor = [UIColor whiteColor];
	self.tableView.contentInsetAdjustmentBehavior = NO;
	
//	PEWeak(self, weakSelf);
//	self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//
//		[weakSelf refreshWithValue];
//		[weakSelf endHeaderRefresh];
//		NSLog(@"-------- 下拉刷新");
//	}];
//	self.tableView.mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:^{
//		[weakSelf loadMoreWithValue];
//		NSLog(@"-------- 加载更多");
//		[weakSelf endFooterRefresh];
//	}];
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
}
- (void)refreshWithValue{
}
- (void)loadMoreWithValue{
}
-(void)endHeaderRefresh{
	NSLog(@"走了下拉刷新结束");
		//   [self.tableView.mj_header endRefreshing];
}
-(void)endFooterRefresh{
	NSLog(@"上拉加载结束");
		//   [self.tableView.mj_footer endRefreshing];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
}
*/

@end
