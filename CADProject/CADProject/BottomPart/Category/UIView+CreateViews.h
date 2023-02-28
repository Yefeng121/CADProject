//
//  UIView+CreateViews.h
//  Foodie
//
//  Created by liyunqi on 16/3/14.
//  Copyright © 2016年 SY. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (CreateViews)

/**
 创建 label

 @param font font
 @param color color
 @param textAlignment textAlignment description
 @return return value description
 */
+(nonnull UILabel *)CreateDefalutLabelFont:(nullable UIFont *)font textColor:( nullable UIColor*)color textAlignment:(NSTextAlignment)textAlignment;

/**
 创建btn

 @param title title description
 @param font font description
 @param textColor textColor description
 @param imageName imageName description
 @param target target description
 @param action action description
 @return return value description
 */
+(nonnull UIButton *)CreateDefaultBtnWith:(NSString *_Nullable)title font:(UIFont *_Nullable)font textColor:(UIColor *_Nullable)textColor imageName:(NSString *_Nullable)imageName Target:(nullable id)target  action:( SEL _Nullable )action;
+(nonnull UIButton *)CreateDefaultBtnTarget:(nullable id)target  action:( nullable SEL)action;
+(nonnull UIButton *)CreateDefaultBtnWithImageName:(NSString *_Nullable)imageName Target:(nullable id)target  action:( SEL _Nullable )action;

+(nonnull UIView *)CreateDefaultView:(CGRect )rect;
+(nullable UIView *)SYUIViewFromXibName:(nonnull NSString *)xibName;


/**
 TableView

 @param delegate delegate description
 @return return value description
 */
+(nonnull UITableView *)CreateDefalultTableView:(nullable id)delegate;
+(nonnull UITableViewCell *)CreateDefalultCellView:(nonnull UITableView *)tableview identifier:(nonnull NSString *)identifier cellClass:(nullable Class)cellclass;

/**
 创建Line

 @param backColor backgroundColor
 @return lineView
 */
+(nonnull UIView *)CreateLineBackColor:(UIColor *_Nullable)backColor;
/**
 ImageView

 @return ImageView
 */
+(nonnull UIImageView *)CreateDefalultImageView;
+(nonnull UIImageView *)CreateDefalultImageViewWitiImage:(nullable UIImage *)image;
+(nonnull UIImageView *)CreateDefalultImageViewWitiImageStr:(nullable NSString *)imagestr;
+(nonnull UIImageView *)CreateDefalultImageViewWitiImageUrl:(nullable NSString *)imageUrl;

+(nonnull UICollectionView *)CreateCollectionView:(nullable id)delegate layout:(nonnull UICollectionViewFlowLayout *)layout cellclass:( nonnull Class)cellClassName;


-(void)addSuViewWithDescendant:(nullable UIView *)view;
@end
