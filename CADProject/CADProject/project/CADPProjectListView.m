//
/** Trifo license **/
//  CADPProjectListView.m
//  CADProject
//
//  Created by Jianzhong on 2023/3/21
//  
//
	

#import "CADPProjectListView.h"
#import "CADMembersModel.h"
@interface CADPProjectListView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CADPProjectListView

- (instancetype)initWithFrame:(CGRect)frame {
	
	if(self = [super initWithFrame:frame]){
		[self createView];
	}
	return self;
}

- (void)createView{
	
	self.backgroundColor = [UIColor C_F0FAF6];
	self.layer.cornerRadius = 15;
	self.layer.masksToBounds = YES;
	
	
	[self createTableView];
	[self.tableView reloadData];
}
- (NSMutableArray *)dataArray{
	if(!_dataArray){
		_dataArray = [NSMutableArray arrayWithCapacity:10];
		
		CADMembersModel *model = [[CADMembersModel  alloc] init];
		model.img = NSStringFromInt(index);
		model.name = [@"用户" stringByAppendingString:NSStringFromInt(index)];
		model.phoneNum = @"911";
		[_dataArray addObject:model];
	}
	return _dataArray;
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
	
	return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 63;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	CADMembersModel *model = self.dataArray[indexPath.section];
	CADPProjectListCell *cell = [CADPProjectListCell createTableViewCellWith:tableView withModel:model];
	
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

@end

// MARK: -------- FileCel

@interface CADPProjectListCell ()
@property (nonatomic, strong) UIImageView *imageViewPoint;
@property (nonatomic, strong) UIImageView *imageType;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelDetail;
@end

@implementation CADPProjectListCell


+ (CADPProjectListCell *)createTableViewCellWith:(UITableView *)tableView withModel:(id)model{
	
	static NSString *cellID = @"DeviceListTableViewCell";
	
	CADPProjectListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	
	if (!cell) {
		cell = [[CADPProjectListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
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
	CADMembersModel *bmodel = (CADMembersModel *)model;
	[self.imageType sd_setImageWithURL:[NSURL URLWithString:bmodel.img] placeholderImage:[UIImage imageNamed:@""]];
	self.labelTitle.text = bmodel.name;
	self.labelDetail.text = bmodel.phoneNum;
	self.labelTitle.size = [bmodel.name sizeWithTextFont:self.labelTitle.font maxWidth:300];
	self.labelDetail.size = [bmodel.phoneNum sizeWithTextFont:self.labelDetail.font maxWidth:300];
}

@end
