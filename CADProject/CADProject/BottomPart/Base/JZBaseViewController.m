//
//  JZBaseViewController.m
//
//  Created by JZ on 2023/2/27
//  
//
	

#import "JZBaseViewController.h"
#import "SYNavigationItemBtnView.h"
#import <objc/runtime.h>
@interface JZBaseViewController ()

@property (nonatomic, assign) BOOL isFirstLoading; // 是否在加载中
@end

@implementation JZBaseViewController
-(id)init{
	self=[super init];
	if (self) {
		[self initDefaultData];
	}
	return self;
}
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil{
	self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[self initDefaultData];
	}
	return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
	if (self = [super initWithCoder:coder]) {
		[self initDefaultData];
	}
	return self;
}

-(void)initDefaultData{
	_autoTextResponder=NO;
	_autoStatusBarStyle=YES;
	_navBarHidden=NO;
	_autoShowBack=YES;
	_canShowGoRoot=NO;
	_thisControllerCanGoRoot=NO;;
	_navClearColor=NO;
}

- (void)viewDidLoad {

	[super viewDidLoad];
	[self initNavigationView];
	if (self.navigationController.viewControllers.count>2&&self.autoShowBack) {
		[self SYShowBackButton:YES];
	}
	self.edgesForExtendedLayout =UIRectEdgeAll;
	[self initView];
	self.navBarItem.titleLabel.textColor = [UIColor blackColor];
	[self.navBarItem.backView setBackgroundColor:[UIColor C_baseGreen]];
	[self.navBarItem.backView setBackgroundColor:[UIColor C_baseGreen]];
	
	// Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor whiteColor];
	
}

- (void)initView{
	
	self.navBarItem.lineView.hidden = YES;
	self.view.backgroundColor = [UIColor whiteColor];
	[self SYLeftBtnWithImageName:@"GoBack" title:@""];
}
-(void)setAutoTextResponder:(BOOL)autoTextResponder{
	_autoTextResponder=autoTextResponder;
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	[self setNeedsStatusBarAppearanceUpdate];
	[self supportedInterfaceOrientations];
	[self preferredInterfaceOrientationForPresentation];
}
- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	self.navigationController.navigationBarHidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];

}


-(void)BaseControllerClickNavLeftButton:(UIButton *)btn{
	[self.navigationController popViewControllerAnimated:YES];
}
-(void)BaseControllerClickNavRightButton:(UIButton *)btn{
}

- (void)initNavigationView{
	if (!self.navBarItem ) {
		self.navBarItem = [[SYNavigationItem alloc]init];
		self.navBarItem.showController=self;
		self.navBarItem.backView.backgroundColor=[UIColor whiteColor];
	}
}
-(void)SYLeftBtnWithImageName:(NSString *)imageName  title:(NSString *)title{
	if (!SYStringisEmpty(imageName)||!SYStringisEmpty(title)) {

		[self.navBarItem showLeftButtonWithNomoralImage:imageName HighlightedImage:nil title:title];
		[self.navBarItem.navigationLeftBtn.goBackItem addTarget:self action:@selector(BaseControllerClickNavLeftButton:) forControlEvents:UIControlEventTouchUpInside];
		[self.navBarItem.navigationLeftBtn.goRootItem addTarget:self action:@selector(baseGotoRootController) forControlEvents:UIControlEventTouchUpInside];
		[self resetShowGotoRoot];
	}else{
		self.navBarItem.centerItemView=nil;
	}
}
-(void)SYRightBtnWithImageName:(NSString *)imageName  title:(NSString *)title{
	if (!SYStringisEmpty(imageName)||!SYStringisEmpty(title)) {
		[self.navBarItem showRightButtonWithNomoralImage:imageName HighlightedImage:nil title:title];
		[self.navBarItem.navigationRightBtn addTarget:self action:@selector(BaseControllerClickNavRightButton:) forControlEvents:UIControlEventTouchUpInside];
	}else
	{
		self.navBarItem.rigthItemView=nil;
	}
}
-(void)SYShowBackButton:(BOOL)showBack{
	if (showBack) {
		[self SYLeftBtnWithImageName:@"GoBack" title:@""];
	}else{
		[self SYLeftBtnWithImageName:nil title:nil];
	}
}

-(NSInteger)viewControllersTotal{
	return self.navigationController.viewControllers.count;
}

-(BOOL)GoRootBtnCanShow{
	BOOL canShow=YES;
	for (UIViewController *controller in self.navigationController.viewControllers) {
		if ([controller isKindOfClass:[JZBaseViewController class]]) {
			if (((JZBaseViewController *)controller).thisControllerCanGoRoot==NO) {
				canShow=NO;
				break;
			}
		}
	}
	if (self.canShowGoRoot&&canShow&&self.viewControllersTotal>=3) {
		return YES;
	}
	return NO;
}

-(void)resetShowGotoRoot{

	if ([self GoRootBtnCanShow]) {
		self.navBarItem.navigationLeftBtn.goRootItem.hidden=NO;
	}else{
		self.navBarItem.navigationLeftBtn.goRootItem.hidden=YES;
	}
	UIImage *imageBackNormalW=ImageNamed(@"GoBack");//backArrowRichTextDetail_whiteNew
	UIImage *imageBackNormalB=ImageNamed(@"GoBack");
	if (self.navClearColor) {
		if ([self.navBarItem.navigationLeftBtn.goBackItem imageForState:UIControlStateNormal]) {
			if ([[self.navBarItem.navigationLeftBtn.goBackItem imageForState:UIControlStateNormal]isEqual:imageBackNormalW]||[[self.navBarItem.navigationLeftBtn.goBackItem imageForState:UIControlStateNormal]isEqual:imageBackNormalB]) {
				[self.navBarItem.navigationLeftBtn.goBackItem setImage:imageBackNormalW forState:UIControlStateNormal];
			}
		}
		if ([self.navBarItem.navigationLeftBtn.goRootItem imageForState:UIControlStateNormal]) {
			//sy_goRoot_h
			[self.navBarItem.navigationLeftBtn.goRootItem setImage:ImageNamed(@"sy_goRoot_h") forState:UIControlStateNormal];
		}
	}else{
		if ([self.navBarItem.navigationLeftBtn.goBackItem imageForState:UIControlStateNormal]) {
			if ([[self.navBarItem.navigationLeftBtn.goBackItem imageForState:UIControlStateNormal]isEqual:imageBackNormalW]||[[self.navBarItem.navigationLeftBtn.goBackItem imageForState:UIControlStateNormal]isEqual:imageBackNormalB]) {
				[self.navBarItem.navigationLeftBtn.goBackItem setImage:imageBackNormalB forState:UIControlStateNormal];
			}
		}
		if ([self.navBarItem.navigationLeftBtn.goRootItem imageForState:UIControlStateNormal]) {
			[self.navBarItem.navigationLeftBtn.goRootItem setImage:ImageNamed(@"sy_goRoot_h") forState:UIControlStateNormal];
		}
	}
	[self.navBarItem adjustContent];
}


#pragma mark set
-(void)setCanShowGoRoot:(BOOL)canShowGoRoot{
	_canShowGoRoot=canShowGoRoot;
	[self resetShowGotoRoot];
}
-(void)setAutoShowBack:(BOOL)autoShowBack{
	_autoShowBack=autoShowBack;
	[self SYShowBackButton:_autoShowBack];
}
-(void)setNavBarHidden:(BOOL)navBarHidden{
	_navBarHidden=navBarHidden;
	self.navBarItem.backView.hidden=navBarHidden;
}
-(void)setNavClearColor:(BOOL)navClearColor{
	_navClearColor=navClearColor;
	[self resetShowGotoRoot];
}
-(void)setThisControllerCanGoRoot:(BOOL)thisControllerCanGoRoot{
	_thisControllerCanGoRoot=thisControllerCanGoRoot;
}

-(void)setTitle:(NSString *)title{
	[super setTitle:title];
	self.navBarItem.title=title;
}


-(void)baseGotoRootController{
	[self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


- (UIStatusBarStyle)preferredStatusBarStyle{
	return UIStatusBarStyleDefault; //返回黑色
}


- (BOOL)shouldAutorotate{
	return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
	
	return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
	
	return UIInterfaceOrientationPortrait;
}
@end
