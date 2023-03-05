//
//  CADProjectManagerVController.m
//  CADProject
//
//  Created by Jacy on 2023/3/4.
//

#import "CADProjectManagerVController.h"
#import "CADBlueprintView.h"
#import "CADBlueprintModel.h"
@interface CADProjectManagerVController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UILabel *labelNums;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation CADProjectManagerVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"项目管理";
    [self createManagerView];
}

- (void)createManagerView{
    
    UIButton *btnTeam = [UIView CreateDefaultBtnWith:@" 团队人数" font:UIFontWithBoldSize(14) textColor:[UIColor C_101D34] imageName:@"team" Target:self action:nil];
    [btnTeam sizeToFit];
    btnTeam.frame = CGRectMake(15, 92, btnTeam.width, btnTeam.height);
    [self.view addSubview:btnTeam];
    
    UILabel *labelNums = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(14) textColor:[UIColor C_101D34] textAlignment:NSTextAlignmentRight];
    labelNums.text = @"5人 >";
    [labelNums sizeToFit];
    labelNums.frame = CGRectMake(self.view.width - 15 - labelNums.width, 92, labelNums.width, labelNums.height);
    self.labelNums = labelNums;
    self.labelNums.centerY = btnTeam.centerY;
    [self.view addSubview:self.labelNums];
    
    [self createTableView];
    [self.tableView reloadData];
    
    
    UIImageView *imageViewShan = [UIView CreateDefalultImageViewWitiImageStr:@"cameraBack"];
    [imageViewShan sizeToFit];
    imageViewShan.frame = CGRectMake(self.view.width - 20 - imageViewShan.width, self.view.height - 180 - imageViewShan.height, imageViewShan.width, imageViewShan.height);
    imageViewShan.transform = CGAffineTransformMakeRotation(-M_PI/4);
    [self.view addSubview:imageViewShan];
    
    UIButton *btnAdd = [UIView CreateDefaultBtnWithImageName:@"Tab_turn" Target:self action:@selector(btnAddTouched)];
    [btnAdd sizeToFit];
    btnAdd.frame = CGRectMake(self.view.width - 10 - btnAdd.width, self.view.height - 140 - btnAdd.height, btnAdd.width, btnAdd.height);
    [self.view addSubview:btnAdd];
    
    [self createBtnWithTitle:@"拍照" imagename:@"camera" frame:CGRectMake(self.view.width - 42 - 20, btnAdd.y - 50, 50, 50) Tag:101];
    [self createBtnWithTitle:@"上传" imagename:@"upload" frame:CGRectMake(btnAdd.x - 50, btnAdd.y, 50, 50) Tag:102];
    
    UIButton *btnYan = [UIView CreateDefaultBtnWith:@"验收合格" font:UIFontWithSize(14) textColor:[UIColor C_585858] imageName:@"" Target:self action:nil];
    [btnYan setBackgroundImage:[UIImage imageNamed:@"btnBack"] forState:UIControlStateNormal];
    btnYan.frame = CGRectMake(0, self.view.height - 60 - 44, 290, 44);
    btnYan.centerX = self.view.width/2;
    [self.view addSubview:btnYan];
//
    UIButton *btnAttention = [UIView CreateDefaultBtnWith:@"验收合格后团队自动解散，验收文件仅发起人留档" font:UIFontWithSize(14) textColor:[UIColor C_585858] imageName:@"care" Target:self action:nil];

    btnAttention.titleLabel.numberOfLines = 2;
    btnAttention.size = [btnAttention.titleLabel.text sizeWithTextFont:UIFontWithSize(14) maxWidth:self.view.width - 50];
    btnAttention.frame = CGRectMake(15, btnYan.y - 10 - btnAttention.height, btnAttention.width, btnAttention.height);
    
    [self.view addSubview:btnAttention];
}

-(void)createBtnWithTitle:(NSString *)title imagename:(NSString *)imageName frame:(CGRect)frame Tag:(NSInteger)tag{
    
    UIButton *btnBack = [UIView CreateDefaultBtnWithImageName:imageName Target:self action:@selector(btnTouched:)];
    btnBack.frame = frame;
    UIButton *btnImage = [UIView CreateDefaultBtnWithImageName:imageName Target:self action:@selector(btnTouched:)];
    [btnImage sizeToFit];
    btnImage.frame = CGRectMake(0, 5, btnImage.width, btnImage.height);
    btnImage.centerX = btnBack.width/2;
    [btnBack addSubview:btnImage];
    
    UIButton *btnTitle = [UIView CreateDefaultBtnWith:title font:UIFontWithBoldSize(13) textColor:[UIColor C_101D34] imageName:@"" Target:self action:@selector(btnTouched:)];
    [btnTitle sizeToFit];
    btnTitle.frame = CGRectMake(0, btnImage.bottom + 5, btnTitle.width, btnTitle.height);
    btnTitle.centerX = btnBack.width/2;
    [btnBack addSubview:btnTitle];
    
}


/**
 MARK: 创建tableview
 */
-(void)createTableView{

    
    if (!self.tableView) {
        UIView *viewBack = [UIView CreateLineBackColor:[UIColor C_F0FAF6]];
        
        viewBack.frame = CGRectMake(15, self.labelNums.bottom + 11, self.view.width - 30, self.view.height - self.labelNums.bottom - 160);
        
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

- (void)btnAddTouched{
    
}
- (void)btnTouched:(UIButton *)btn{
    
}

@end
