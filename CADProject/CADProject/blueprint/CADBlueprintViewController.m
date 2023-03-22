//
//  CADBlueprintViewController.m
//  CADProject
//
//  Created by Jacy on 2023/2/27.
//

#import "CADBlueprintViewController.h"
#import "CADWIFIImportVController.h"

#import "CADBlueprintView.h"

@interface CADBlueprintViewController ()
@property (nonatomic, strong) CADBlueprintView *BlueprintView;
@end

@implementation CADBlueprintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMainView];
	
	NSArray *imageArray = [CADFileManagerTool getAllFileList:[CADFileManagerTool getDocumentPathCADFile]];
	NSLog(@"-------- %@",imageArray);
}
- (void)createMainView{
    PEWeak(self, weakSelf);
    self.BlueprintView = [[CADBlueprintView alloc] initWithFrame:self.view.bounds block:^(NSInteger index) {
        NSLog(@" --------- %ld",index);
		if (index == 100) {
			[weakSelf.navigationController pushViewController:[CADWIFIImportVController new] animated:YES];
		}else if(index == 101){
			[weakSelf getFile];
		}
    }];
    [self.view addSubview:self.BlueprintView];
}

- (void)getFile{
	[[JZDocumentPickerViewTool sharePhotosAblumTool] getPickerViewToolWith:self block:^(id  _Nonnull object) {
		NSURL *path = (NSURL *)object;
		
		NSData *data = [NSData dataWithContentsOfURL:path];
		UIImage *imageName = [UIImage imageWithData:data];
		NSURL *path1 = (NSURL *)object;
	}];
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
