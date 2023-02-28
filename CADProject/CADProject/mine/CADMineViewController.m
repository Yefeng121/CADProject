//
//  CADMineViewController.m
//  CADProject
//
//  Created by Jacy on 2023/2/27.
//

#import "CADMineViewController.h"

@interface CADMineViewController ()

@end

@implementation CADMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	self.navBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	self.navBarHidden = NO;
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
