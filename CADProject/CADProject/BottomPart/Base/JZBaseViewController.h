//
//  JZBaseViewController.h
//
//  Created by JZ on 2023/2/27
//  
//
	

#import <UIKit/UIKit.h>
#import "SYNavigationItem.h"
//此基累处理一些公共ui的操作。
#define NavBarDefaultColor [UIColor syColorNavBarColor]
#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]

@interface JZBaseViewController : UIViewController
@property (nonatomic, assign) BOOL autoTextResponder;//是否自动响应键盘--textview,textfile自动上移动  no

@property (nonatomic, assign) BOOL autoShowBack;//default is YES 是否显示返回按钮
@property (nonatomic, assign) BOOL canShowGoRoot;//default YES  是否显示goRoot按钮

@property (nonatomic, assign) BOOL navClearColor;//Default NO

@property (nonatomic, assign) BOOL autoStatusBarStyle;//yes

@property (nonatomic, assign) BOOL thisControllerCanGoRoot;//当前controller能否直接被跳到rootController default YES  如果有一个为NO的 以后的所有controller都不会显示goRoot按钮

@property(nonatomic, copy) NSString *personDetID;

@property (nonatomic, strong) SYNavigationItem *navBarItem;
@property (nonatomic, assign) BOOL navBarHidden;
@property (nonatomic, strong) NSString *backTitle;

//神策统计页面title
@property (nonatomic, strong) NSString *pageName;

- (void)initView;

- (void)BaseControllerClickNavLeftButton:(UIButton *)btn;
- (void)BaseControllerClickNavRightButton:(UIButton *)btn;
- (void)baseGotoRootController;

	/// 右上角按钮
	/// @param imageName image
	/// @param title 名称
- (void)SYRightBtnWithImageName:(NSString *)imageName  title:(NSString *)title;

	/// 左上角按钮
	/// @param imageName image
	/// @param title 名称
- (void)SYLeftBtnWithImageName:(NSString *)imageName  title:(NSString *)title;


- (BOOL)GoRootBtnCanShow;

@end
