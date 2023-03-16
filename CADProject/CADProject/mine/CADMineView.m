//
/** Trifo license **/
//  CADMineView.m
//  CADProject
//
//  Created by Jianzhong on 2023/3/16
//  
//
	

#import "CADMineView.h"

@interface CADMineView ()

@property (nonatomic, strong) UIImageView *imageHeader;
@property (nonatomic, strong) UILabel *labelTitle;

@property (nonatomic, strong) UIButton *btnVipBack;
@property (nonatomic, strong) UIButton *btnVip;
@property (nonatomic, strong) UIButton *btnActivate;

@end

@implementation CADMineView

- (instancetype)initWithFrame:(CGRect)frame{
	
	if (self = [super initWithFrame:frame]) {
		
		[self createView];
	}
	return self;
}
- (void)createView{
	
	self.backgroundColor = [UIColor clearColor];
	
	self.imageHeader = [UIView CreateDefalultImageView];
	[self.imageHeader sizeToFit];
	[self addSubview:self.imageHeader];
	
	self.labelTitle = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(17) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
	[self addSubview:self.labelTitle];
	
	self.btnVipBack = [UIView CreateDefaultBtnWithImageName:@"" Target:self action:@selector(btnTopuched:)];
	[self.btnVipBack setBackgroundImage:[UIImage imageNamed:@"vipBack"] forState:UIControlStateNormal];
	[self addSubview:self.btnVipBack];
	
	self.btnVip = [UIView CreateDefaultBtnWith:@"开通会员尊享全部权益" font:UIFontWithBoldSize(15) textColor:[UIColor C_7E613E] imageName:@"vipMaoz" Target:self action:@selector(btnTopuched:)];
	[self.btnVipBack addSubview:self.btnVip];
	
	self.btnActivate = [UIView CreateDefaultBtnWith:@"立即开通" font:UIFontWithBoldSize(13) textColor:[UIColor C_7E613E] imageName:@"arrowRight" Target:self action:@selector(btnTopuched:)];
	[self.btnActivate setImagePosition:SYImagePositionRight spacing:5.0];
	[self.btnVipBack addSubview:self.btnActivate];
	
	[self createHeaderWith:nil];
	[self setNeedsLayout];
}

- (void)createHeaderWith:(id)model{
	
	CADMineModel *mineModel = (CADMineModel *)model;
	
	[self.imageHeader sd_setImageWithURL:mineModel.user_img placeholderImage:[UIImage imageNamed:@"headerPlace"]];
	
	self.labelTitle.text = mineModel.user_name;
	
	[self setNeedsLayout];
	
}

- (void)layoutSubviews{
	
	self.imageHeader.frame = CGRectMake(SCALE_WIDTH(20), SCALE_WIDTH(30), SCALE_WIDTH(60), SCALE_WIDTH(60));
	
	self.labelTitle.frame = CGRectMake(CGRectGetMaxX(self.imageHeader.frame) + 10, 0, self.width - CGRectGetMaxX(self.imageHeader.frame) - SCALE_WIDTH(30), SCALE_WIDTH(30));
	
	self.labelTitle.centerY = self.imageHeader.centerY;
	
	self.btnVipBack.frame = CGRectMake(SCALE_WIDTH(20), self.imageHeader.bottom + SCALE_WIDTH(16), self.width - SCALE_WIDTH(40), SCALE_WIDTH(53));
	
	self.btnVip.frame = CGRectMake(SCALE_WIDTH(17), 0, SCALE_WIDTH(200), SCALE_WIDTH(30));
	
	self.btnActivate.frame = CGRectMake(self.btnVipBack.width - SCALE_WIDTH(20) - SCALE_WIDTH(70), 0, SCALE_WIDTH(70), SCALE_WIDTH(30));
	
	self.btnActivate.centerY = self.btnVip.centerY = self.btnVipBack.height/2;
}

- (void)btnTopuched:(UIButton *)btn{
	
}

@end

@interface CADMineViewCell ()

@end

@implementation CADMineViewCell


@end
