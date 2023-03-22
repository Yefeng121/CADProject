//
/** Trifo license **/
//  CADFileManagerTool.h
//  CADProject
//
//  Created by Jianzhong on 2023/3/22
//  
//
	

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CADFileManagerTool : NSObject
	///获取Document路径CADFile
+(NSString *)getDocumentPathCADFile;
	///获取Document路径
+(NSString *)getDocumentPath;
	///获取Caches路径
+(NSString *)getCachesPath;
	///获取Library路径
+(NSString *)getLibraryPath;
	///创建文件夹
+(BOOL)creatDir:(NSString *)path;
	///创建文件
+(BOOL)creatFile:(NSString*)filePath;
	///写数据
+(BOOL)writeToFile:(NSString*)filePath contents:(NSData *)data;
	///追加写数据
+(BOOL)appendData:(NSData*)data withPath:(NSString *)filePath;
	///读文件数据
+(NSData*)readFileData:(NSString *)path;
	///获取文件夹下所有的文件列表
+(NSArray*)getFileList:(NSString*)path;
	///获取文件夹下所有文件(深度遍历)
+(NSArray*)getAllFileList:(NSString*)path;
	///复制文件
+(BOOL)copyFile:(NSString *)fromPath toPath:(NSString *)toPath;
	///移动文件
+(BOOL)moveFile:(NSString *)fromPath toPath:(NSString *)toPath toPathIsDir:(BOOL)dir;
	///删除文件
+(BOOL)moveItemAtPath:(NSString*)fromPath toPath:(NSString*)toPath;
	///删除文件夹
+(BOOL)removeDir:(NSString*)path;
	///删除某些后缀的文件
+(void)removeFileSuffixList:(NSArray<NSString*>*)suffixList filePath:(NSString*)path deep:(BOOL)deep;
	///获取文件大小
+(long long)getFileSize:(NSString*)path;

@end

NS_ASSUME_NONNULL_END
