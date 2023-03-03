//
//  CADWIFIImportVController.m
//  CADProject
//
//  Created by Jacy on 2023/3/2.
//

#import "CADWIFIImportVController.h"

@interface CADWIFIImportVController ()

@end

@implementation CADWIFIImportVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WIFI导入";
	[self createWifiView];
}

- (void)createWifiView{
	
	UIView *backView = [UIView CreateLineBackColor:[UIColor C_F0FAF6]];
	backView.layer.cornerRadius = 15;
	backView.layer.masksToBounds = YES;
	backView.frame = CGRectMake(15, SafeAreaTopHeight + 10, self.view.width - 30, 154);
	[self.view addSubview:backView];
	
	UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone"]];
	UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"transfer"]];
	UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TV"]];
	
	imageView2.frame = CGRectMake(CGRectGetMaxX(imageView1.frame) + 50, 0, imageView2.width, imageView2.height);
	imageView1.frame = CGRectMake(48, 0, imageView1.width, imageView1.height);
	imageView3.frame = CGRectMake(CGRectGetMaxX(imageView2.frame) + 35, 0, imageView3.width, imageView3.height);
	imageView2.center = CGPointMake(backView.width/2, backView.height/2);
	imageView1.centerY = imageView3.centerY = backView.height/2;
	imageView1.x = imageView2.x - 50 - imageView1.width;
	imageView3.x = CGRectGetMaxX(imageView2.frame) + 35;
	[backView addSubview:imageView1];
	[backView addSubview:imageView2];
	[backView addSubview:imageView3];
	
	UIButton *btn = [UIView CreateDefaultBtnWith:@"请确保手机和电脑处于同一WIFI中，传输过程中请勿关闭传输页面。" font:UIFontWithSize(14) textColor:[UIColor blackColor] imageName:@"attention" Target:self action:nil];
	btn.titleLabel.numberOfLines = 0;
	btn.size = [@"请确保手机和电脑处于同一WIFI中，传输过程中请勿关闭传输页面。" sizeWithTextFont:UIFontWithSize(14) maxWidth:self.view.width - 40];
	btn.frame = CGRectMake(15, backView.bottom + 16, btn.width, btn.height);
	[self.view addSubview:btn];
	  
	UIView *line = [UIView CreateLineBackColor:[UIColor C_F0FAF6]];
	line.frame = CGRectMake(0, btn.bottom + 30, self.view.width, 10);
	[self.view addSubview:line];
	
	
	UILabel *labelTitle = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(16) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
	labelTitle.text = @"传输地址";
	[labelTitle sizeToFit];
	labelTitle.frame = CGRectMake(15, line.bottom + 18, labelTitle.width, labelTitle.height);
	[self.view addSubview:labelTitle];
	
	UILabel *labelContent = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(20) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
	labelContent.text = @"www.baidu.com";
	labelContent.numberOfLines = 0;
	labelContent.size = [labelContent.text sizeWithTextFont:UIFontWithBoldSize(20) maxWidth:self.view.width - 80];
	labelContent.frame = CGRectMake(15, labelTitle.bottom + 25, labelContent.width, labelContent.height);
	labelContent.centerX = self.view.width/2;
	[self.view addSubview:labelContent];
	
	UIButton *btnCopy = [UIView CreateDefaultBtnWithImageName:@"copy" Target:self action:@selector(btnCopy)];
	[btnCopy sizeToFit];
	btnCopy.frame = CGRectMake(CGRectGetMaxX(labelContent.frame) + 5, 0, btnCopy.width, btnCopy.height);
	[self.view addSubview:btnCopy];
	btnCopy.centerY = labelContent.centerY;
	
}

- (void)btnCopy{
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	pasteboard.string = @"www.baidu.com";
	
	[self.view showMessage:@"复制成功"];
}
@end
