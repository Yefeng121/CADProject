//
//  JZBaseTableViewCell.m
//
//  Created by JZ on 2023/2/27
//  
//
	

#import "JZBaseTableViewCell.h"

@implementation JZBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
//		self.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	return self;
}
//在自定义cell中实现，两种方法都可行，一个是改颜色，一个是用图片

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
//
	[super setHighlighted:highlighted animated:animated];
	
}
@end
