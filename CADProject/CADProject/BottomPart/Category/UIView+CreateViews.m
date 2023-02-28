//
//  UIView+CreateViews.m
//  Foodie
//
//  Created by liyunqi on 16/3/14.
//  Copyright © 2016年 SY. All rights reserved.
//

#import "UIView+CreateViews.h"

@implementation UIView (CreateViews)
+(nonnull UILabel *)CreateDefalutLabelFont:(nullable UIFont *)font textColor:( nullable UIColor*)color textAlignment:(NSTextAlignment)textAlignment;
{
    UILabel *label=[[UILabel alloc]init];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=textAlignment;
    label.textColor=color;
    label.font=font;
    return label;
}
+(nonnull UIButton *)CreateDefaultBtnWithImageName:(NSString *)imageName Target:(nullable id)target  action:( SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor clearColor];
	[btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(nonnull UIButton *)CreateDefaultBtnWith:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor imageName:(NSString *)imageName Target:(nullable id)target  action:( SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor clearColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
	[btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(nonnull UIButton *)CreateDefaultBtnTarget:(nullable id)target  action:( SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor clearColor];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(nonnull UIView *)CreateDefaultView:(CGRect )rect
{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor clearColor];
    view.frame=rect;
    return view;
}
+(nullable UIView *)SYUIViewFromXibName:(nonnull NSString *)xibName
{
    NSArray *xibs = [[NSBundle mainBundle]loadNibNamed:xibName owner:nil options:nil];
    if (xibs.count) {
        return [xibs objectAtIndex:0];
    }
    return nil;
}

+(nonnull UITableView *)CreateDefalultTableView:(nullable id)delegate
{
    UITableView* tableView=[[UITableView alloc]init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.scrollsToTop=NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.separatorColor=[UIColor clearColor];
    return tableView;
}
+(nonnull UITableViewCell *)CreateDefalultCellView:(nonnull UITableView *)tableview identifier:(nonnull NSString *)identifier cellClass:(nullable Class)cellclass
{
    UITableViewCell *cell=[tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        if (cellclass&&[cellclass isSubclassOfClass:[UITableViewCell class]]) {
             cell=[[cellclass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    }
    return cell;
}
+(nonnull UIView *)CreateLineBackColor:(UIColor *)backColor{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = backColor;
    return view;
}
+(nonnull UIImageView *)CreateDefalultImageView
{
    UIImageView *imageView=[[UIImageView alloc]init];
    imageView.backgroundColor=[UIColor clearColor];
    return imageView;
}
+(nonnull UIImageView *)CreateDefalultImageViewWitiImage:(nullable UIImage *)image
{
    UIImageView *imageView=[self CreateDefalultImageView];
    imageView.image=image;
    return imageView;
}
+(nonnull UIImageView *)CreateDefalultImageViewWitiImageStr:(nullable NSString *)imagestr
{
    UIImageView *imageView=[self CreateDefalultImageView];
    imageView.image= [UIImage imageNamed:imagestr];
    return imageView;
}


+(nonnull UICollectionView *)CreateCollectionView:(nullable id)delegate layout:(nonnull UICollectionViewFlowLayout *)layout cellclass:( nonnull Class)cellClassName
{
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
     [collectionView setBackgroundColor:[UIColor clearColor]];
    collectionView.scrollsToTop = NO;
    collectionView.dataSource = delegate;
    collectionView.delegate = delegate;
    [collectionView registerClass:[cellClassName class] forCellWithReuseIdentifier:NSStringFromClass(cellClassName)];
    return collectionView;
}

-(void)addSuViewWithDescendant:(UIView *)view
{
    if (![view isDescendantOfView:self]) {
        [self addSubview:view];
    }
}
@end
