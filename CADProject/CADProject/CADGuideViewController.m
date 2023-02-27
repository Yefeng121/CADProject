//
//  CADGuideViewController.m
//  CADProject
//
//  Created by Jacy on 2023/2/24.
//

#import "CADGuideViewController.h"
#import "AppDelegate.h"
#import "JZTabbarViewController.h"
@interface CADGuideViewController ()

@end

@implementation CADGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    AppDelegate *appDelegate=[[AppDelegate alloc]init];
    JZTabbarViewController *tabbarVC = [[JZTabbarViewController alloc] init];
    appDelegate.window.rootViewController = tabbarVC;
    [self.navigationController pushViewController:tabbarVC animated:NO];
}



@end
