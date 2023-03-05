//
//  CADProjectViewController.m
//  CADProject
//
//  Created by Jacy on 2023/2/27.
//

#import "CADProjectViewController.h"
#import "CADProjectManagerVController.h"
@interface CADProjectViewController ()

@end

@implementation CADProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CADProjectManagerVController *vc = [[CADProjectManagerVController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
