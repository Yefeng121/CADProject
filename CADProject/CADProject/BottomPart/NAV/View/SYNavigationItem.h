//
//  SYNavigationView.h
//  Foodie
//
//  Created by yunqi on 16/3/10.
//  Copyright © 2016年 SY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYNavigationItemBtnView.h"
#import "SYNavigationitemLeftView.h"
@class SYNavigationItemSubTitleView;
@interface SYNavigationItem : NSObject
@property (nonatomic, strong) UIView *leftItemView;
@property (nonatomic, strong) UIView *rigthItemView;
@property (nonatomic, strong) UIView *centerItemView;
@property (nonatomic, strong) UILabel *titleView;
@property (nonatomic, strong) SYNavigationItemSubTitleView *subTitleView;
@property (nonatomic, strong) UIImageView *subImageView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, weak)   UIImageView *backView;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, weak) UIViewController *showController;
//默认的两个leftbtn rigthbtn
@property (nonatomic, strong) SYNavigationitemLeftView *navigationLeftBtn;
@property (nonatomic, strong)  SYNavigationItemBtnView *navigationRightBtn;
@property (nonatomic, strong) UILabel *titleLabel;
- (void)layoutNavigationView;
-(void)showLeftButtonWithNomoralImage:(NSString *)strNomoralImage HighlightedImage:(NSString *)HighlightedImage title:(NSString *)title;
-(void)showRightButtonWithNomoralImage:(NSString *)strNomoralImage HighlightedImage:(NSString *)HighlightedImage title:(NSString *)title;
-(void)showBackBtn:(NSString *)title imageStr:(NSString *)strImage;

	/// 显示小标题
	/// - Parameters:
	///   - subTitle: 小标题
	///   - imageName: 图片
- (void)setSubTitle:(NSString *)subTitle image:(NSString *)imageName;
// 纯文字按钮，可自定义颜色和字体
- (void)showRightButtonWithTitle:(NSAttributedString *)title;

-(void)adjustContent;
@end
@interface SYNavigationItemSubTitleView : UIView
	/// 创建subTitleView
	/// - Parameters:
	///   - subTitle: subTitle description
	///   - subImage: subImage description
- (void)createSubTitleViewWithTitle:(NSString *)subTitle image:(NSString *)subImage;
@end
