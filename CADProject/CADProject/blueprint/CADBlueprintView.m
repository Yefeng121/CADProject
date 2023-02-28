//
//  CADBlueprintView.m
//  CADProject
//
//  Created by Jacy on 2023/2/28.
//

#import "CADBlueprintView.h"

@interface CADBlueprintView ()

@property (nonatomic, strong) UIButton *btnCAD;
@property (nonatomic, strong) UIButton *btnVip;

@property (nonatomic, strong) CADBlueprintBtnView *btnView;

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
    CGFloat cellW = (self.width - 21*2 - 15*3)/4;
    self.btnView = [[CADBlueprintBtnView alloc] initWithFrame:CGRectMake(0, self.btnCAD.bottom + 27, self.width, cellW) block:^(NSInteger index) {
        if(weakSelf.BlueprintViewBlock) weakSelf.BlueprintViewBlock(index);
    }];
    
    [self addSubview:self.btnView];
    
    self.cellView = [[CADBlueprintCellView alloc] initWithFrame:CGRectMake(15, self.btnView.bottom + 15, self.btnView.width - 30, self.height - 320) block:^(NSInteger index) {
        
    }];
    [self addSubview:self.cellView];
}
- (void)btnTouched:(UIButton *)btn{
    if(self.BlueprintViewBlock) self.BlueprintViewBlock(btn.tag);
}

@end
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
    [self createBtnViewWithTitle:@"导入教程" imageName:@"gszh" frame:CGRectMake(21, 0, cellW, cellW) tag:100];
    [self createBtnViewWithTitle:@"WIFI导入" imageName:@"Download" frame:CGRectMake(21 + cellW + 15, 0, cellW, cellW) tag:101];
    [self createBtnViewWithTitle:@"项目管理" imageName:@"yjsy" frame:CGRectMake(21 + (cellW + 15) * 2, 0, cellW, cellW) tag:102];
    [self createBtnViewWithTitle:@"DWG 转PDF" imageName:@"tzsm" frame:CGRectMake(21 + (cellW + 15) * 3, 0, cellW, cellW) tag:103];
    
}

- (void)createBtnViewWithTitle:(NSString *)title imageName:(NSString *)imageName frame:(CGRect)frame tag:(NSInteger)tag{
    
    UIControl *control = [[UIControl alloc] initWithFrame:frame];
    control.backgroundColor = [UIColor C_F1F5F8];
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
@interface CADBlueprintCellView ()
@property (nonatomic, strong) UIButton *btnSelected;
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
    
    self.backgroundColor = [UIColor C_F1F5F8];
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
    
}

- (void)btnTouched:(UIButton *)btn{
    if(btn.selected) return;
    btn.selected = !btn.selected;
    btn.titleLabel.font = UIFontWithBoldSize(17);
    self.btnSelected.titleLabel.font = UIFontWithSize(17);
    self.btnSelected.selected = !self.btnSelected.selected;
    self.btnSelected = btn;
    
    if(self.cellViewBlock) self.cellViewBlock(btn.tag);
}
@end
