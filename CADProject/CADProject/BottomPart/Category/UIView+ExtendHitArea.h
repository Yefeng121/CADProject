//
//  UIView+ExtendHitArea.h
//  Ironpie
//
//  Created by Jin on 2022/6/7.
//  Copyright © 2022 Keven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ExtendHitArea)

/*!
 @property
 @abstract 要扩展的区域
 @如左上右下扩展20的可点击区域 extendedHitArea = {20,20,20,20};
 */
@property(nonatomic, assign) CGRect extendedHitArea;
// or
- (void)extendHitAreaTop:(CGFloat)top
                    left:(CGFloat)left
                  bottom:(CGFloat)bottom
                   right:(CGFloat)right;


@end
