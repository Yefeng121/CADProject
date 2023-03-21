//
/** Trifo license **/
//  CADAddProjectViewController.m
//  CADProject
//
//  Created by Jianzhong on 2023/3/21
//  
//
	

#import "CADAddProjectViewController.h"

@interface CADAddProjectViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textFieldName;
@property (nonatomic, strong) UITextField *textFieldNum;
@end

@implementation CADAddProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.title = @"加入项目";
	[self createProjectView];
}
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
}

- (void)createProjectView{
	
	UILabel *labelTitle = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(13) textColor:[UIColor C_222222] textAlignment:NSTextAlignmentLeft];
	labelTitle.text = @"项目名称";
	labelTitle.frame = CGRectMake(30, 30, self.view.width - 60, 30);
	[self.view addSubview:labelTitle];

		//项目名称
	self.textFieldName=[[UITextField alloc] initWithFrame:CGRectMake(30, labelTitle.bottom + 10, self.view.width - 60,SCALE_WIDTH(45))];
	self.textFieldName.placeholder=@"请输入项目名称";
	self.textFieldName.font=[UIFont systemFontOfSize:15];
	self.textFieldName.textColor=[UIColor C_222222];
	self.textFieldName.delegate=self;
	[self.textFieldName addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
	[self.view addSubview:self.textFieldName];
	
	UILabel *labelTitle1 = [UIView CreateDefalutLabelFont:UIFontWithBoldSize(13) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
	labelTitle1.text = @"自动编号";
	labelTitle1.frame = CGRectMake(30, self.textFieldName.bottom + 20, self.view.width - 60, 30);
	[self.view addSubview:labelTitle1];
	
		//自动编号
	self.textFieldNum=[[UITextField alloc] initWithFrame:CGRectMake(30, labelTitle1.bottom + 10, self.view.width - 60,SCALE_WIDTH(45))];

	self.textFieldNum.placeholder=@"请输入编号号码";
	self.textFieldNum.font=[UIFont systemFontOfSize:15];
	self.textFieldNum.delegate=self;
	[self.textFieldNum addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
	[self.view addSubview:self.textFieldNum];
	
	UIButton *btnAdd = [UIView CreateDefaultBtnWith:@"加入项目" font:UIFontWithSize(18) textColor:[UIColor C_222222] imageName:@"" Target:self action:@selector(btnAddTouched:)];
	btnAdd.backgroundColor = [UIColor C_42BB92];
	
	btnAdd.frame = CGRectMake(43, self.view.height - 108, self.view.width - 43 * 2, 40);
	btnAdd.layer.cornerRadius = btnAdd.height/2;
	btnAdd.layer.masksToBounds = YES;
	[self.view addSubview:btnAdd];
}

- (void)btnAddTouched:(UIButton *)btn{
	
}
-(void)textFieldDidChange:(UITextField *)textField {
	
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
