//
//  PercetIn
//
//  Created by Keven on 2018/7/18.
//  Copyright © 2018年 Keven. All rights reserved.
//

#import "JZNavigationController.h"

@interface JZNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation JZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
//    self.delegate = self;
    
    // Do any additional setup after loading the view.
	self.navigationBarHidden = YES;
	
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    self.interactivePopGestureRecognizer.enabled = NO;
    return  [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
//    if( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] ) {
//        self.interactivePopGestureRecognizer.enabled = NO;
//    }
    return [super popToViewController:viewController animated:animated];
    
}

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animate {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ( gestureRecognizer ==self.interactivePopGestureRecognizer ) {
        if ( self.viewControllers.count ==1 || self.visibleViewController == [self.viewControllers objectAtIndex:0] )
        {
            return NO;
        }
    }
    return YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//	[super pushViewController:viewController animated:animated];
    
//    self.interactivePopGestureRecognizer.enabled = NO;
//
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

	/// MARK: --------旋转相关
- (BOOL)shouldAutorotate{
	return self.topViewController.shouldAutorotate;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
	return [self.topViewController supportedInterfaceOrientations];
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
	return [self.topViewController preferredInterfaceOrientationForPresentation];
}
@end
