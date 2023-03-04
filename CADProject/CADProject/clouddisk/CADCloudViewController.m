//
//  CADCloudViewController.m
//  CADProject
//
//  Created by Jacy on 2023/2/27.
//

#import "CADCloudViewController.h"
#import "CADBlueprintView.h"
#import "CADBlueprintModel.h"

@interface CADCloudViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *labelMin;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation CADCloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"云盘";
    self.navBarItem.leftItemView.hidden = YES;
    [self createCloudView];
}
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
}
- (void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
}

- (void)createCloudView{
    UIButton *btn = [UIView CreateDefaultBtnWith:@"  私人空间" font:UIFontWithSize(14) textColor:[UIColor blackColor] imageName:@"cloud_Icon" Target:self action:nil];
    [btn sizeToFit];
    
    btn.frame = CGRectMake(13.5, 88, btn.width, btn.height);
    [self.view addSubview:btn];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(15, btn.bottom + 10, self.view.width - 30, 8)];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    slider.thumbTintColor = [UIColor clearColor];
    slider.tintColor = [UIColor C_42BB92];
    [self.view addSubview:slider];
    self.slider = slider;
    
    UILabel *labelMin = [UIView CreateDefalutLabelFont:UIFontWithSize(12) textColor:[UIColor C_42BB92] textAlignment:NSTextAlignmentLeft];
    labelMin.text = [NSString stringWithFormat:@"已用：%.0fG",slider.value];
    [labelMin sizeToFit];
    labelMin.frame = CGRectMake(15, self.slider.bottom + 3, labelMin.width, labelMin.height);
    [self.view addSubview:labelMin];
    self.labelMin = labelMin;
    
    UILabel *labelMax = [UIView CreateDefalutLabelFont:UIFontWithSize(13) textColor:[UIColor C_8195A5] textAlignment:NSTextAlignmentLeft];
    labelMax.text = @"100G";
    [labelMax sizeToFit];
    labelMax.frame = CGRectMake(self.view.width - 15 - labelMax.width, self.slider.bottom + 3, labelMax.width, labelMax.height);
    [self.view addSubview:labelMax];
    
    [self createTableView];
    [self.tableView reloadData];
}

/**
 MARK: 创建tableview
 */
-(void)createTableView{

    
    if (!self.tableView) {
        UIView *viewBack = [UIView CreateLineBackColor:[UIColor C_F0FAF6]];
        
        viewBack.frame = CGRectMake(15, self.slider.bottom + 35, self.view.width - 30, self.view.height - self.slider.bottom - 150);
        
        viewBack.layer.cornerRadius = 15;
        viewBack.layer.masksToBounds = YES;
        [self.view addSubview:viewBack];

        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, viewBack.width, viewBack.height - 40) style:UITableViewStyleInsetGrouped];
        [viewBack addSubview:self.tableView];
    }
    self.tableView.sectionHeaderHeight = 1;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled=YES;
    self.tableView.contentInsetAdjustmentBehavior = NO;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, 1)];
    self.tableView.backgroundColor = [UIColor C_F0FAF6];
}
- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray arrayWithCapacity:10];
        for (NSInteger index = 0; index < 5; index++) {
            CADBlueprintModel *model = [[CADBlueprintModel  alloc] init];
            model.fileID = NSStringFromInt(index);
            model.fileType = NSStringFromInt(index);
            model.fileName = @"文件名称";
            model.fileTime = @"2023-02-28";
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 63;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CADBlueprintModel *model = self.dataArray[indexPath.section];
    CADBlueprintFileCell *cell = [CADBlueprintFileCell createTableViewCellWith:tableView withModel:model];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
@end
