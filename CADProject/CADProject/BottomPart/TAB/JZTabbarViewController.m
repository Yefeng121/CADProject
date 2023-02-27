//
//  JZTabbarViewController.m
//  CADProject
//
//  Created by Jacy on 2023/2/27.
//

#import "JZTabbarViewController.h"
#import "CADBlueprintViewController.h"
#import "CADProjectViewController.h"
#import "CADAddViewController.h"
#import "CADCloudViewController.h"
#import "CADMineViewController.h"

@interface JZTabbarViewController ()

@end

@implementation JZTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //装载子视图控制器
    
    [self loadBViewControllers];
    
}
-(void)loadBViewControllers{
    
        // 通过appearance统一设置UITabbarItem的文字属性
//    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14.0];  // 设置文字大小
//    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];  // 设置文字的前景色
//
//    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
//    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
//    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
//
//    UITabBarItem * item = [UITabBarItem appearance];  // 设置appearance
//    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
//    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    NSArray *titleArr = @[@"图纸",@"工程验收",@"",@"云盘",@"我的"];
    NSArray *norImageArr= @[@"TAB_Blueprint_N",@"TAB_Project_N",@"TAB_Add",@"TAB_Cloud_N",@"TAB_Mine_N"];
    NSArray *selectImageArr = @[@"TAB_Blueprint_S",@"TAB_Project_S",@"TAB_Add",@"TAB_Cloud_S",@"TAB_Mine_S"];

    
    // 图纸
    CADBlueprintViewController *BHomeVC = [[CADBlueprintViewController alloc] init];
    BHomeVC.navBarHidden = YES;
    [self customTabBarView:BHomeVC withTitle:titleArr[0] NormalImageName:norImageArr[0] SelectImageName:selectImageArr[0] Tag:0];
    JZNavigationController *navBHomeVC= [[JZNavigationController alloc] initWithRootViewController:BHomeVC];
    [self addChildViewController:navBHomeVC];
    
    // 工程验收
    CADProjectViewController *BCareChoseVC = [[CADProjectViewController alloc] init];
    BCareChoseVC.navBarHidden = YES;
    [self customTabBarView:BCareChoseVC withTitle:titleArr[1] NormalImageName:norImageArr[1] SelectImageName:selectImageArr[1] Tag:1];
    JZNavigationController *navBCareChoseVC= [[JZNavigationController alloc] initWithRootViewController:BCareChoseVC];
    [self addChildViewController:navBCareChoseVC];
    
    // 添加
    CADAddViewController *BFindVC = [[CADAddViewController alloc] init];
    BFindVC.navBarHidden = YES;
    [self customTabBarView:BFindVC withTitle:titleArr[2] NormalImageName:norImageArr[2] SelectImageName:selectImageArr[2] Tag:2];
    JZNavigationController *navBFindVC = [[JZNavigationController alloc] initWithRootViewController:BFindVC];

    [self addChildViewController:navBFindVC];
    
    //分享
    CADCloudViewController *BShareVC = [[CADCloudViewController alloc] init];
    BShareVC.navBarHidden = YES;
    [self customTabBarView:BShareVC withTitle:titleArr[3] NormalImageName:norImageArr[3] SelectImageName:selectImageArr[3] Tag:3];
    JZNavigationController *navBShareVC = [[JZNavigationController alloc] initWithRootViewController:BShareVC];
    [self addChildViewController:navBShareVC];
    
    //我的
    CADMineViewController *BMyVC = [[CADMineViewController alloc] init];
    BMyVC.navBarHidden = YES;
    [self customTabBarView:BMyVC withTitle:titleArr[4] NormalImageName:norImageArr[4] SelectImageName:selectImageArr[4] Tag:4];
    
    JZNavigationController *navBMyVC = [[JZNavigationController alloc] initWithRootViewController:BMyVC];
    [self addChildViewController:navBMyVC];

}

#pragma mark - 创建UITabBarItem

/**
 创建UITabBarItem
 
 @param ItemController tapController
 @param title tap标题
 @param imageName 默认显示图片
 @param seletImage 选中图片
 */
- (void)customTabBarView:(UIViewController *)ItemController withTitle:(NSString *)title NormalImageName:(NSString *)imageName SelectImageName:(NSString *)seletImage Tag:(NSInteger )tag{
    
    UITabBarItem *listItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:tag];
        // 通过appearance统一设置UITabbarItem的文字属性
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [listItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];

    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    [listItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    listItem.selectedImage = (seletImage.length)?[[UIImage imageNamed:seletImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]:nil;
    
    ItemController.tabBarItem = listItem;
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
  
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
