//
//  SYNavigationView.m
//  Foodie
//
//  Created by yunqi on 16/3/10.
//  Copyright © 2016年 SY. All rights reserved.
//

#import "SYNavigationItem.h"
#import "JZBasicSettings.h"
#import "UIView+xframe.h"

#define SY_NAVBAR_TITLE_FONT UIFontWithBoldSize(16) //标题
#define SY_NAVBAR_ITEM_FONT UIFontWithSize(15) //左右两边title
#define SY_NAVBAR_ITEM_DEFAULT_COLOR PEColor(288, 81, 81)//左右item.title 默认颜色
#define SY_NAVBAR_ITEM_HIGHLIGHTED_COLOR PEColor(198, 53, 53)//左右item.title 选中颜色
#define SY_NAVBAR_LINE_COLOR  PEColor(221, 221, 221) //线颜色

@interface SYNavigationItem()

@end
@implementation SYNavigationItem
- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
-(UILabel *)titleView
{
    if (_titleView==nil) {
        _titleView=[[UILabel alloc]init];
        _titleView.backgroundColor=[UIColor clearColor];
        _titleView.textColor=[UIColor blackColor];
        _titleView.textAlignment=NSTextAlignmentCenter;
        _titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH - 100 , 30);
        _titleView.font=SY_NAVBAR_TITLE_FONT;

    }
    return _titleView;
}
- (SYNavigationItemSubTitleView *)subTitleView{
	if (_subTitleView == nil) {
		_subTitleView = [[SYNavigationItemSubTitleView alloc] init];
		_subTitleView.frame = CGRectMake(0, 0, SCREEN_WIDTH - 100 , 20);

	}
	return _subTitleView;
}
-(UILabel *)titleLabel
{
    return [self titleView];
}
-(void)setShowController:(UIViewController *)showController
{
    _showController=showController;
    [self resetsubVaules];
}

-(UIImageView *)navBgView
{
    if ([self isTableviewController]) {
        return [self.showController.navigationController.navigationBar viewWithTag:105555];
    }
    //    为了与其他不是此子类的barview保持一致
    //    return [self.showController.navigationController.navigationBar viewWithTag:105555];
    return _backView;
    //    return self.showController.navigationController.navigationBar.overlay;
}
-(BOOL)isTableviewController
{
//    return NO;
    return [self.showController.class isSubclassOfClass:[UITableViewController class]];
}

-(void)resetsubVaules
{
    UIImageView *bgView=[self navBgView];
    if (!bgView){
        bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, SafeAreaTopHeight)];
		bgView.backgroundColor = [UIColor clearColor];
        bgView.contentMode=UIViewContentModeScaleAspectFill;
        bgView.userInteractionEnabled=YES;
        bgView.tag=105555;
        if ([self isTableviewController]) {
            [self.showController.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
            [self.showController.navigationController.navigationBar setShadowImage:[UIImage new]];
            self.showController.navigationController.navigationBar.tintColor = nil;
            [self.showController.navigationController.navigationBar insertSubview:bgView atIndex:0];
        }else
        {
            [self.showController.view addSubview:bgView];
        }
        _lineView=[[UIView alloc]init];
        _lineView.frame=CGRectMake(0, SafeAreaTopHeight-0.5, SCREEN_WIDTH, 0.5);
        _lineView.backgroundColor = SY_NAVBAR_LINE_COLOR;
        [bgView addSubview:_lineView];

    }
    self.backView=bgView;
}
- (void)addSubviewWithSuperView:(UIView *)superView subView:(UIView *)subView
{
    if (subView == nil) return;
    if (![subView isDescendantOfView:superView]) {
        [superView addSubview:subView];
    }
}

- (void)layoutNavigationView
{

    CGFloat marginX = 15;

    CGFloat statusBarH = (IS_IPHONE && SCREEN_HEIGHT >= 812.0)? 44 : 20;
    if (_leftItemView != nil) {
        float lx=marginX;
        if ([_leftItemView isKindOfClass:[SYNavigationitemLeftView class]]) {
            lx=0;
        }
        _leftItemView.frame = CGRectMake(lx,0,_leftItemView.width,MIN(self.backView.height - 20, _leftItemView.height));
        _leftItemView.centerY=statusBarH+(self.backView.height-statusBarH)/2;
    }

    if (_rigthItemView != nil) {

        CGFloat marginRightX =  SCREEN_WIDTH - _rigthItemView.width- marginX;
        _rigthItemView.frame = CGRectMake(marginRightX,0,_rigthItemView.width,MIN(self.backView.height - 20, _rigthItemView.height));
        _rigthItemView.centerY=statusBarH+(self.backView.height-statusBarH)/2;
    }

    if (_centerItemView != nil) {
        CGFloat margin=0;
        CGFloat marginCX=_leftItemView?(_leftItemView.x+_leftItemView.width+margin):marginX;
        CGFloat marginCRX=_rigthItemView?(_rigthItemView.x-margin):(self.backView.width-margin);
        CGFloat centerWidth=MIN(marginCRX-marginCX, _backView.width);
		_titleView.size = CGSizeMake(centerWidth, 25);
		_subTitleView.size = CGSizeMake(centerWidth, 20);
		CGFloat cenH = self.titleView.height;
		if(!IS_STRING_NIL(self.subTitle)){
			_titleView.numberOfLines = 0;
			cenH = self.subTitleView.height + self.titleView.height + 8;
			self.subTitleView.y = self.titleView.height + 2;
		}else{
			_titleView.numberOfLines = 2;
			_titleView.size = [_titleView.text sizeWithTextFont:SY_NAVBAR_TITLE_FONT maxWidth:centerWidth];
			cenH = self.titleView.height;
		}
        _centerItemView.frame=CGRectMake(marginCX, 0, centerWidth, MIN(self.backView.height - 20,cenH));
        _centerItemView.centerY=statusBarH+(self.backView.height-statusBarH)/2;
        _centerItemView.centerX=self.backView.width/2;
		_titleView.centerX = _centerItemView.width/2;
    }
}


-(void)createNavLeftBtn
{
    if (!self.navigationLeftBtn) {
        self.navigationLeftBtn=[[SYNavigationitemLeftView alloc]init];
        self.navigationLeftBtn.goBackItem.titleLabel.font=SY_NAVBAR_ITEM_FONT;
        self.navigationLeftBtn.backgroundColor=[UIColor clearColor];
        [self.navigationLeftBtn.goBackItem setTitleColor:PEColor(51, 51, 51) forState:UIControlStateNormal];
        self.navigationLeftBtn.hidden=YES;
    }
    [self.navigationLeftBtn resetDefault];
}

-(void)createNavRigthBtn
{
    if (!self.navigationRightBtn) {
        self.navigationRightBtn=[[SYNavigationItemBtnView alloc]init];
        self.navigationRightBtn.backgroundColor=[UIColor clearColor];
        self.navigationRightBtn.titleLabel.font=SY_NAVBAR_ITEM_FONT;
        self.navigationRightBtn.titleLabel.numberOfLines=0;
        [self.navigationRightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

//        [self.navigationRightBtn setTitleColor:FNColor(198, 53, 53)  forState:UIControlStateHighlighted];
        self.navigationRightBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
        self.navigationRightBtn.hidden=YES;
    }
//    [self.navigationRightBtn setBackgroundImage:nil forState:UIControlStateNormal];
//    [self.navigationRightBtn setImage:nil forState:UIControlStateNormal];
//    [self.navigationRightBtn setImage:nil forState:UIControlStateHighlighted];
//    [self.navigationRightBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
//    self.navigationRightBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;

}
-(void)setLeftItemView:(UIView *)leftItemView
{
    if (_leftItemView) {
        [_leftItemView removeFromSuperview];
    }
    _leftItemView=leftItemView;
    if ([self isTableviewController]) {
        if (leftItemView) {
//            [self.showController.navigationItem setItemWithCustomView:leftItemView itemType:left];
        }else
        {
            self.showController.navigationItem.leftBarButtonItem=nil;
        }
    }else
    {
        [self addSubviewWithSuperView:_backView subView:_leftItemView];
        [self layoutNavigationView];
    }
}
-(void)setRigthItemView:(UIView *)rigthItemView
{
    if (_rigthItemView) {
        [_rigthItemView removeFromSuperview];
    }
    _rigthItemView=rigthItemView;
    if ([self isTableviewController]) {
        if (_rigthItemView) {
//            [self.showController.navigationItem setItemWithCustomView:rigthItemView itemType:right];
        }else
        {
            self.showController.navigationItem.rightBarButtonItem=nil;
        }
    }else
    {
        [self addSubviewWithSuperView:_backView subView:_rigthItemView];
        [self layoutNavigationView];
    }

}

-(void)setCenterItemView:(UIView *)centerItemView{

    _centerItemView=centerItemView;
    if ([self isTableviewController]) {
//        [self.showController.navigationItem setItemWithCustomView:_centerItemView itemType:center];
    }else
    {
        [self addSubviewWithSuperView:_backView subView:_centerItemView];
        [self layoutNavigationView];
    }
}
- (void)createCenterItemView{

	if (self.centerItemView == nil){
		self.centerItemView = [[UIView alloc] init];
		[self.centerItemView addSubview: self.titleView];
	}
}
-(void)setTitle:(NSString *)title{
//    if (self.centerItemView&&![self.centerItemView isEqual:[self titleView]]) {
//
//		_titleView.text=title;
//        return;
//    }
    [self titleView];
	[self createCenterItemView];
	
    _titleView.text=title;
	[self layoutNavigationView];
}
- (void)setSubTitle:(NSString *)subTitle image:(NSString *)imageName{
	self.subTitle = subTitle;
	[self.subTitleView createSubTitleViewWithTitle:subTitle image:imageName];

	[self.centerItemView addSubview:self.subTitleView];
	[self layoutNavigationView];
}
- (void)setSubTitle:(NSString *)subTitle{
	_subTitle = subTitle;
}
-(void)showLeftButtonWithNomoralImage:(NSString *)strNomoralImage HighlightedImage:(NSString *)HighlightedImage title:(NSString *)title
{
    [self createNavLeftBtn];
    self.navigationLeftBtn.hidden=NO;
    if (!SYStringisEmpty(strNomoralImage)) {
        [self.navigationLeftBtn.goBackItem setImage:[UIImage imageNamed:strNomoralImage] forState:UIControlStateNormal];
    }
	if (!SYStringisEmpty(HighlightedImage)) {
        [self.navigationLeftBtn.goBackItem setImage:[UIImage imageNamed:HighlightedImage] forState:UIControlStateHighlighted];
    }
    [self.navigationLeftBtn showBackBtn:title imageStr:strNomoralImage];
    self.leftItemView = self.navigationLeftBtn;
}
-(void)showRightButtonWithNomoralImage:(NSString *)strNomoralImage HighlightedImage:(NSString *)HighlightedImage title:(NSString *)title
{
    [self createNavRigthBtn];
    self.navigationRightBtn.hidden=NO;
    if (!SYStringisEmpty(strNomoralImage)) {
        [self.navigationRightBtn setImage:[UIImage imageNamed:strNomoralImage] forState:UIControlStateNormal];
    }
    if (!SYStringisEmpty(HighlightedImage)) {
        [self.navigationRightBtn setImage:[UIImage imageNamed:HighlightedImage] forState:UIControlStateHighlighted];
    }
    CGSize imageSize=self.navigationRightBtn.currentImage.size;
    self.navigationRightBtn.frame=CGRectMake(0, 0, imageSize.width+10, 44);
    if (!SYStringisEmpty(title)) {
        [self.navigationRightBtn setTitle:title forState:UIControlStateNormal];
        self.navigationRightBtn.backgroundColor=[UIColor clearColor];
        self.navigationRightBtn.titleLabel.size = [self.navigationRightBtn.titleLabel.text sizeWithTextFont:[UIFont systemFontOfSize:15] maxWidth:80];
        self.navigationRightBtn.frame=CGRectMake(0, 0, self.navigationRightBtn.titleLabel.frame.size.width, self.navigationRightBtn.titleLabel.frame.size.height);
    }
    self.rigthItemView=self.navigationRightBtn;
	[self layoutNavigationView];
}
-(void)showBackBtn:(NSString *)title imageStr:(NSString *)strImage
{
    [self createNavLeftBtn];
    self.navigationLeftBtn.hidden=NO;
    [self.navigationLeftBtn showBackBtn:title imageStr:strImage];
    self.leftItemView = self.navigationLeftBtn;
}
-(void)adjustContent
{
    CGSize size=self.navigationLeftBtn.size;
    if (self.navigationLeftBtn.goRootItem.hidden) {
        self.navigationLeftBtn.width=self.navigationLeftBtn.goBackItem.width;
    }else
    {
        self.navigationLeftBtn.width=self.navigationLeftBtn.goBackItem.width+self.navigationLeftBtn.goRootItem.width;
    }
    if (!CGSizeEqualToSize(size, self.navigationLeftBtn.frame.size)) {
        [self layoutNavigationView];
    }
}
-(void)dealloc
{
    NSLog(@"%s___from:%s",__FUNCTION__,object_getClassName(self));
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 纯文字按钮，可自定义颜色和字体
- (void)showRightButtonWithTitle:(NSAttributedString *)title {
    if (SYStringisEmpty(title.string))
        return;

    [self createNavRigthBtn];
    self.navigationRightBtn.hidden = NO;
    self.navigationRightBtn.frame=CGRectMake(0, 0, 80, 44);
    [self.navigationRightBtn setTitle:title.string forState:UIControlStateNormal];
    self.navigationRightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    self.navigationRightBtn.extendedHitArea = CGRectMake(0, 15, 15, 0);

    //字体颜色
    UIColor *color = [UIColor blackColor];
    if (color) {
        [self.navigationRightBtn setTitleColor:color forState:UIControlStateNormal];
        [self.navigationRightBtn setTitleColor:[color colorWithAlphaComponent:0.3] forState:UIControlStateHighlighted];
    }

    // 字体大小
    UIFont *font = [UIFont systemFontOfSize:15];
    if (font) {
        self.navigationRightBtn.titleLabel.font = font;
    }

    self.rigthItemView=self.navigationRightBtn;
    [self layoutNavigationView];
}

@end


@interface SYNavigationItemSubTitleView ()

PROPERTY_STRONG UILabel *subTitleView;
PROPERTY_STRONG UIImageView *subImageView;
@end

@implementation SYNavigationItemSubTitleView
- (instancetype)init{

	if (self = [super init]) {

		[self createView];
	}
	return self;
}
- (void)createView{

}

- (UIImageView *)subImageView{

	if (_subImageView == nil){
		_subImageView = [[UIImageView alloc] init];

		[self addSubview:_subImageView];
	}
	return _subImageView;
}
- (UILabel *)subTitleView{

	if (_subTitleView == nil){
		_subTitleView = [[UILabel alloc] init];
		_subTitleView.backgroundColor=[UIColor clearColor];
		_subTitleView.textColor=[UIColor blackColor];
		_subTitleView.textAlignment=NSTextAlignmentLeft;
		_subTitleView.numberOfLines = 1;
		_subTitleView.font=[UIFont systemFontOfSize:12];
		[self addSubview:_subTitleView];
	}
	return _subTitleView;
}

	/// 创建subTitleView
	/// - Parameters:
	///   - subTitle: subTitle description
	///   - subImage: subImage description
- (void)createSubTitleViewWithTitle:(NSString *)subTitle image:(NSString *)subImage{
	self.subImageView.image = [UIImage imageNamed:subImage];
	[self.subImageView sizeToFit];
	self.subTitleView.text = subTitle;
	[self.subTitleView sizeToFit];
//	self.subTitleView.size = [self.subTitleView.text sizeWithTextFont:[UIFont fs_12] maxWidth:self.width - 40];
//	self.subTitleView.size = [self.subTitleView.text sizeWithTextFont:[UIFont fs_12] maxWidth:self.width - 40];
	[self setNeedsLayout];
}

- (void)layoutSubviews{

	CGFloat viewW = self.subImageView.width + self.subTitleView.width + 4;
	self.subImageView.frame = CGRectMake(self.width/2 - viewW/2, 0, self.subImageView.width, self.subImageView.height);

	self.subTitleView.frame = CGRectMake(CGRectGetMaxX(self.subImageView.frame) + 4, 0, self.subTitleView.width, self.subTitleView.height);
	self.subImageView.centerY = self.subTitleView.centerY;
	if(self.subImageView.width == 0){
		self.subTitleView.centerX = self.width/2;
	}
}
@end
