//
//  CADMineViewController.m
//  CADProject
//
//  Created by Jacy on 2023/2/27.
//

#import "CADMineViewController.h"
#import "CADMineView.h"
@interface CADMineViewController ()
@property (nonatomic, strong) CADMineView *tableHeaderView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation CADMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)initView{
	[self createTableView];
}
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.navBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	self.navBarHidden = NO;
}

- (void)createTableView{
	self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	
	UIImageView *backView = [UIView CreateDefalultImageViewWitiImageStr:@"backImg"];
	backView.frame = self.view.bounds;
	[self.view addSubview:backView];
	
	[super createTableView];
	self.tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 100);
	self.tableView.backgroundColor = [UIColor clearColor];
	
	self.tableHeaderView = [[CADMineView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, SCALE_WIDTH(180))];
	self.tableView.tableHeaderView = self.tableHeaderView;
	
	
	UIView *footerView = [UIView CreateLineBackColor:[UIColor whiteColor]];
	
	footerView.frame = CGRectMake(0, 0, self.view.width, SCALE_WIDTH(50));
	
	UIButton *btnFooter = [UIView CreateDefaultBtnWith:@"账号注销" font:UIFontWithSize(16) textColor:[UIColor ColorAlphaWithR:0 G:0 B:0 A:0.5] imageName:@"log_off" Target:self action:@selector(btnLogOff)];
	[footerView addSubview:btnFooter];
	[btnFooter setImagePosition:SYImagePositionLeft spacing:10.0];
	btnFooter.frame = CGRectMake(0, 0, SCALE_WIDTH(264), SCALE_WIDTH(50));
	btnFooter.center = CGPointMake(footerView.width/2, footerView.height/2);
	btnFooter.layer.cornerRadius = 10;
	btnFooter.layer.masksToBounds = YES;
	self.tableView.tableFooterView = footerView;
	
	
	[self createTableViewDataArray];
}
- (void)createTableViewDataArray{
	
	NSMutableArray *imgArray = [NSMutableArray arrayWithObjects:@"Policy",@"useRule",@"connectUS",@"versionInfo", nil];
	NSMutableArray *nameArray = [NSMutableArray arrayWithObjects:@"隐私政策",@"使用条款",@"联系我们",@"版本信息", nil];
	NSMutableArray *dataA = [NSMutableArray arrayWithCapacity:4];
	for (int index = 0; index < imgArray.count; index++) {
		NSString *nameStr = nameArray[index];
		NSString *imgStr = imgArray[index];
		
		CADMineCellModel *model = [[CADMineCellModel alloc] init];
		model.title = nameStr;
		model.img = imgStr;
		[dataA addObject:model];
	}
	self.dataArray = dataA;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	
	return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return SCALE_WIDTH(50);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	CADMineViewCell *cell = [CADMineViewCell createTableViewCellWith:tableView withModel:nil];
	CADMineCellModel *model = self.dataArray[indexPath.row];
	cell.textLabel.text = model.title;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.imageView.image = [UIImage imageNamed:model.img];
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)btnLogOff{
	
	NSLog(@"-------- btnLogOff");
}
@end
