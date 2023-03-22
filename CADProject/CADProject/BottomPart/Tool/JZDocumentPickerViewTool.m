//
/** Trifo license **/
//  JZDocumentPickerViewTool.m
//  CADProject
//
//  Created by Jianzhong on 2023/3/22
//  
//
	

#import "JZDocumentPickerViewTool.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface JZDocumentPickerViewTool ()<UIDocumentPickerDelegate>{
	
}
@property (nonatomic, strong) UIViewController *targetVC;

@end

@implementation JZDocumentPickerViewTool
static JZDocumentPickerViewTool *pickerViewTool = nil;
+ (instancetype)sharePhotosAblumTool{
	static dispatch_once_t onceToken;
		// dispatch_once  无论使用多线程还是单线程，都只执行一次
	dispatch_once(&onceToken, ^{
		pickerViewTool = [[JZDocumentPickerViewTool alloc] init];
	});
	return pickerViewTool;
}

- (void)getPickerViewToolWith:(UIViewController *)targetVC block:(JZDocumentPickerViewToolBlock)block{
	_targetVC = targetVC;
	_ToolBlock = block;
	

	UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc]
													  initWithDocumentTypes:@[@"public.image"] inMode:UIDocumentPickerModeOpen];
	documentPicker.delegate = self;
	documentPicker.modalPresentationStyle = UIModalPresentationFormSheet;
	[targetVC presentViewController:documentPicker animated:YES completion:nil];
	
}

#pragma mark - UIDocumentPickerDelegate

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
	
	PEWeak(self, weakSelf);
	if (controller.documentPickerMode == UIDocumentPickerModeOpen) {
		dispatch_async(dispatch_get_main_queue(), ^{
			
				//获取授权
			BOOL fileUrlAuthozied = [urls.firstObject startAccessingSecurityScopedResource];
			if (fileUrlAuthozied) {
					//通过文件协调工具来得到新的文件地址，以此得到文件保护功能
				NSFileCoordinator *fileCoordinator = [[NSFileCoordinator alloc] init];
				NSError *error;
				
				[fileCoordinator coordinateReadingItemAtURL:urls.firstObject options:0 error:&error byAccessor:^(NSURL *newURL) {
						//读取文件
					NSString *fileName = [newURL lastPathComponent];
					NSError *error = nil;
					NSData *fileData = [NSData dataWithContentsOfURL:newURL options:NSDataReadingMappedIfSafe error:&error];
					if (error) {
							//读取出错
					} else {
						NSLog(@"上传===%@",fileName);
							//上传
							//                [self uploadingWithFileData:fileData fileName:fileName fileURL:newURL];
					}
					
					[self.targetVC dismissViewControllerAnimated:YES completion:NULL];
				}];
				[urls.firstObject stopAccessingSecurityScopedResource];
			} else {
				
			}
//			NSString *toPath = [[CADFileManagerTool getDocumentPath] stringByAppendingString:@"/CADFile"];
//			if([CADFileManagerTool creatDir:toPath]){
//				NSData *fileData = [NSData dataWithContentsOfURL:[urls firstObject]];
//				[CADFileManagerTool writeToFile:toPath contents:fileData];
//				if(self.ToolBlock){
//					self.ToolBlock([urls lastObject]);
//				}
//			}

		});
	}
	
}


@end
