//
//  CADBlueprintView.m
//  CADProject
//
//  Created by Jacy on 2023/2/28.
//

#import "CADBlueprintView.h"
#import "CADBlueprintModel.h"

@interface CADBlueprintView ()

@property (nonatomic, strong) UIButton *btnCAD;
@property (nonatomic, strong) UIButton *btnVip;

@property (nonatomic, strong) CADBlueprintBtnView *btnView;
@property (nonatomic, strong) CADBlueprintProjectView *proView;
@property (nonatomic, strong) CADBlueprintCellView *cellView;
@end

@implementation CADBlueprintView

- (instancetype)initWithFrame:(CGRect)frame block:(CADBlueprintViewBlock)block{
    
    if(self = [super initWithFrame:frame]){
        self.BlueprintViewBlock = block;
        [self createView];
    }
    return self;
}

- (void)createView{
    
    self.btnCAD = [UIView CreateDefaultBtnWithImageName:@"LOGO" Target:self action:@selector(btnTouched:)];
    self.btnCAD.tag = 90;
    [self.btnCAD sizeToFit];
    self.btnCAD.frame = CGRectMake(15.5, 56, self.btnCAD.width, self.btnCAD.height);
    [self addSubview:self.btnCAD];
    
    self.btnVip = [UIView CreateDefaultBtnWithImageName:@"VIP" Target:self action:@selector(btnTouched:)];
    self.btnVip.tag = 91;
    [self.btnVip sizeToFit];
    self.btnVip.frame = CGRectMake(self.width - 27.5 - self.btnVip.width, 49, self.btnVip.width, self.btnVip.height);
    [self addSubview:self.btnVip];
    self.btnCAD.centerY = self.btnVip.centerY;
    
    PEWeak(self, weakSelf);
    CGFloat cellH = (self.width - 21*2 - 15*3)/4;
    self.btnView = [[CADBlueprintBtnView alloc] initWithFrame:CGRectMake(0, self.btnCAD.bottom + 27, self.width, cellH) block:^(NSInteger index) {
        if(weakSelf.BlueprintViewBlock) weakSelf.BlueprintViewBlock(index);
    }];
    
    [self addSubview:self.btnView];
    
    CGFloat proViewH = 66;
    self.proView = [[CADBlueprintProjectView alloc] initWithFrame:CGRectMake(21, self.btnView.bottom + 15, self.width - 42, proViewH) block:^(NSInteger index) {
        
    }];
    [self addSubview:self.proView];
    
    self.cellView = [[CADBlueprintCellView alloc] initWithFrame:CGRectMake(21, self.proView.bottom + 15, self.width - 42, self.height - self.proView.bottom - 140) block:^(NSInteger index) {
        
    }];
    [self addSubview:self.cellView];
	
	
}
- (void)btnTouched:(UIButton *)btn{
    if(self.BlueprintViewBlock) self.BlueprintViewBlock(btn.tag);
}

@end

// MARK: -------- 四个按钮 WiFi导入...

@interface CADBlueprintBtnView ()
@end

@implementation CADBlueprintBtnView

- (instancetype)initWithFrame:(CGRect)frame block:(CADBlueprintViewBlock)block{
    
    if(self = [super initWithFrame:frame]){
        self.btnViewBlock = block;
        [self createView];
    }
    return self;
}

- (void)createView{
    
    CGFloat cellW = (self.width - 21*2 - 15*3)/4;
    
    [self createBtnViewWithTitle:@"WIFI导入" imageName:@"Download" frame:CGRectMake(21, 0, cellW, cellW) tag:100];
    [self createBtnViewWithTitle:@"项目管理" imageName:@"yjsy" frame:CGRectMake(21 + cellW + 15, 0, cellW, cellW) tag:101];
    [self createBtnViewWithTitle:@"DWG 转PDF" imageName:@"tzsm" frame:CGRectMake(21 + (cellW + 15) * 2, 0, cellW, cellW) tag:102];
    [self createBtnViewWithTitle:@"DWG 转图片" imageName:@"turnImage" frame:CGRectMake(21 + (cellW + 15) * 3, 0, cellW, cellW) tag:103];
}

- (void)createBtnViewWithTitle:(NSString *)title imageName:(NSString *)imageName frame:(CGRect)frame tag:(NSInteger)tag{
    
    UIControl *control = [[UIControl alloc] initWithFrame:frame];
    control.backgroundColor = [UIColor C_F0FAF6];
    control.layer.cornerRadius = 10;
    control.layer.masksToBounds = YES;
    control.tag = tag;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageView.frame = CGRectMake(0, 12, imageView.width, imageView.height);
    [control addSubview:imageView];
    imageView.centerX = control.width/2.0;
    
    UILabel *labelT = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(12) textColor:[UIColor C_101D34] textAlignment:NSTextAlignmentCenter];
    
    labelT.text = title;
    labelT.numberOfLines = 2;
    labelT.size = [title sizeWithTextFont:UIFontWithBoldSize(12) maxWidth:control.width - 20];
    labelT.frame = CGRectMake(10, imageView.bottom + 5, control.width - 20, 36);
    [control addSubview:labelT];
    [self addSubview:control];
    
    [control addTarget:self action:@selector(viewTouched:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewTouched:(UIControl *)con{
    
    if(self.btnViewBlock) self.btnViewBlock(con.tag);
}
@end

@interface CADBlueprintProjectView ()
@end

@implementation CADBlueprintProjectView

- (instancetype)initWithFrame:(CGRect)frame block:(CADBlueprintViewBlock)block{
    
    if(self = [super initWithFrame:frame]){
        self.ProjectViewBlock = block;
        [self createView];
    }
    return self;
}

- (void)createView{
    
    
    UIButton *btnBack = [UIView CreateDefaultBtnWithImageName:@"" Target:self action:@selector(viewTouched:)];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"ProjectBack"] forState:UIControlStateNormal];
    btnBack.frame = CGRectMake(0, 0, self.width, self.height);
    [self addSubview:btnBack];
    
    UILabel *labelTitle = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(14) textColor:[UIColor C_101D34] textAlignment:NSTextAlignmentLeft];
    labelTitle.text = @"导入教程";
    [labelTitle sizeToFit];
    labelTitle.frame = CGRectMake(24, 17, labelTitle.width, labelTitle.height);
    [self addSubview:labelTitle];
    
    UILabel *labelContent = [UIView CreateDefalutLabelFont:UIFontWithSize(12) textColor:[UIColor C_101D34] textAlignment:NSTextAlignmentLeft];
    labelContent.text = @"点击查看教程详情";
    [labelContent sizeToFit];
    labelContent.frame = CGRectMake(24, labelTitle.bottom + 7, labelContent.width, labelContent.height);
    [self addSubview:labelContent];
    
    UIImageView *imageView = [UIView CreateDefalultImageViewWitiImageStr:@"gszh"];
    [imageView sizeToFit];
    imageView.frame = CGRectMake(self.width - 26 - imageView.width, 0, imageView.width, imageView.height);
    imageView.centerY = self.height/2;
    [self addSubview:imageView];
    
    
    
}

- (void)viewTouched:(UIButton *)btn{
    
    if(self.ProjectViewBlock) self.ProjectViewBlock(btn.tag);
}
@end
// MARK: -------- 最近文件/验收文件

@interface CADBlueprintCellView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIButton *btnSelected;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArrayNow;
@property (nonatomic, strong) NSMutableArray *dataArrayYan;

@end

@implementation CADBlueprintCellView

- (instancetype)initWithFrame:(CGRect)frame block:(CADBlueprintCellViewBlock)block{
    
    if(self = [super initWithFrame:frame]){
        self.cellViewBlock = block;
        [self createView];
    }
    return self;
}

- (void)createView{
    
    self.backgroundColor = [UIColor C_F0FAF6];
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    
    UIButton *btnNow = [UIView CreateDefaultBtnWith:@"最近文件" font:UIFontWithBoldSize(17) textColor:[UIColor C_8195A5] imageName:@"" Target:self action:@selector(btnTouched:)];
    [btnNow setTitleColor:[UIColor C_101D34] forState:UIControlStateSelected];
    btnNow.tag = 200;
    btnNow.size = [@"最近文件" sizeWithTextFont:UIFontWithBoldSize(17)  maxWidth:200];
    btnNow.frame = CGRectMake(15, 20, btnNow.width, btnNow.height);
    [self addSubview:btnNow];
    btnNow.selected = YES;
    self.btnSelected = btnNow;
    
    UIButton *btnYan = [UIView CreateDefaultBtnWith:@"验收文件" font:UIFontWithSize(17) textColor:[UIColor C_8195A5] imageName:@"" Target:self action:@selector(btnTouched:)];
    btnYan.tag = 201;
    [btnYan setTitleColor:[UIColor C_101D34] forState:UIControlStateSelected];
    btnYan.size = [@"验收文件" sizeWithTextFont:UIFontWithBoldSize(17)  maxWidth:200];
    btnYan.frame = CGRectMake(CGRectGetMaxX(btnNow.frame) + 20, 0, btnYan.width, btnYan.height);
    [self addSubview:btnYan];
    btnYan.centerY = btnNow.centerY;
    
    [self createTableView];
    [self.tableView reloadData];
}
- (NSMutableArray *)dataArrayNow{
    if(!_dataArrayNow){
        _dataArrayNow = [NSMutableArray arrayWithCapacity:10];
        
        for (NSInteger index = 0; index < 5; index++) {
            CADBlueprintModel *model = [[CADBlueprintModel  alloc] init];
            model.fileID = NSStringFromInt(index);
            model.fileType = NSStringFromInt(index);
            model.fileName = @"文件名称";
            model.fileTime = @"2023-02-28";
            
            [_dataArrayNow addObject:model];
        }
    }
    return _dataArrayNow;
}

- (NSMutableArray *)dataArrayYan{
    if(!_dataArrayYan){
        _dataArrayYan = [NSMutableArray arrayWithCapacity:10];
        for (NSInteger index = 0; index < 5; index++) {
            CADBlueprintModel *model = [[CADBlueprintModel  alloc] init];
            model.fileID = NSStringFromInt(index);
            model.fileType = NSStringFromInt(index);
            model.fileName = @"文件名称";
            model.fileTime = @"2023-02-28";
            [_dataArrayYan addObject:model];
        }
    }
    return _dataArrayYan;
}

/**
 MARK: 创建tableview
 */
-(void)createTableView{

	if (!self.tableView) {

		self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 58, self.width, self.height - 58) style:UITableViewStyleInsetGrouped];
		[self addSubview:self.tableView];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(self.btnSelected.tag == 200){
        return self.dataArrayNow.count;
    }else if (self.btnSelected.tag == 201){
        return self.dataArrayYan.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 63;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CADBlueprintModel *model;
    if(self.btnSelected.tag == 200){
        model = self.dataArrayNow[indexPath.section];
    }else if (self.btnSelected.tag == 201){
        model = self.dataArrayYan[indexPath.section];
    }
	CADBlueprintFileCell *cell = [CADBlueprintFileCell createTableViewCellWith:tableView withModel:model];
    
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

- (void)btnTouched:(UIButton *)btn{
    if(btn.selected) return;
    btn.selected = !btn.selected;
    btn.titleLabel.font = UIFontWithBoldSize(17);
    self.btnSelected.titleLabel.font = UIFontWithSize(17);
    self.btnSelected.selected = !self.btnSelected.selected;
    self.btnSelected = btn;
    [self.tableView reloadData];
    if(self.cellViewBlock) self.cellViewBlock(btn.tag);
}
@end

// MARK: -------- FileCel

@interface CADBlueprintFileCell ()
@property (nonatomic, strong) UIImageView *imageViewPoint;
@property (nonatomic, strong) UIImageView *imageType;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelDetail;
@end

@implementation CADBlueprintFileCell


+ (CADBlueprintFileCell *)createTableViewCellWith:(UITableView *)tableView withModel:(id)model{
	
	static NSString *cellID = @"DeviceListTableViewCell";
	
	CADBlueprintFileCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	
	if (!cell) {
		cell = [[CADBlueprintFileCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
	}
	
	[cell creatViewCellWithModel:model];
	return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

		[self createTableViewCell];
	}

	return self;
}
- (void)createTableViewCell{
	if (_imageViewPoint) {
		return;
	}
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.imageType = [UIView CreateDefalultImageViewWitiImageStr:@""];
    [self.imageType sizeToFit];
    [self.contentView addSubview:self.imageType];
    
    
    self.labelTitle = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(16) textColor:[UIColor C_333333] textAlignment:NSTextAlignmentLeft];
    self.labelTitle.numberOfLines = 2;
    [self.contentView addSubview:self.labelTitle];
    
    self.labelDetail = [UIView CreateDefalutLabelFont:UIFontWithSize(12) textColor:[UIColor C_8195A5] textAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.labelDetail];
    
	self.imageViewPoint = [UIView CreateDefalultImageViewWitiImageStr:@"3Point"];
	[self.imageViewPoint sizeToFit];
	[self.contentView addSubview:self.imageViewPoint];
    
    [self setNeedsLayout];
}
- (void)layoutSubviews{
	
    self.imageType.frame = CGRectMake(10,10, self.height - 20, self.height - 20);
    self.labelTitle.frame = CGRectMake(CGRectGetMaxX(self.imageType.frame) + 10, 10, self.labelTitle.width, self.labelTitle.height);
    self.labelDetail.frame = CGRectMake(CGRectGetMaxX(self.imageType.frame) + 10, self.labelTitle.bottom + 5, self.labelDetail.width, self.labelDetail.height);
    
	self.imageViewPoint.frame = CGRectMake(self.width - 15 - self.imageViewPoint.width, 0, self.imageViewPoint.width, self.imageViewPoint.height);
	self.imageViewPoint.centerY = self.height/2;

}

- (void)creatViewCellWithModel:(id)model{
    CADBlueprintModel *bmodel = (CADBlueprintModel *)model;
    NSMutableArray *imageNameArray = [NSMutableArray arrayWithObjects:@"DWG",@"PDF",@"PNG", nil];
    self.imageType.image = [UIImage imageNamed:imageNameArray[bmodel.fileType.intValue%3]];
    self.labelTitle.text = bmodel.fileName;
    self.labelDetail.text = bmodel.fileTime;
    self.labelTitle.size = [bmodel.fileName sizeWithTextFont:self.labelTitle.font maxWidth:300];
    self.labelDetail.size = [bmodel.fileTime sizeWithTextFont:self.labelDetail.font maxWidth:300];
}

@end
