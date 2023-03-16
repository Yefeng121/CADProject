//
//  JZBaseTableViewCell.m
//
//  Created by JZ on 2023/2/27
//  
//
	

#import "JZBaseTableViewCell.h"

@implementation JZBaseTableViewCell


+ (JZBaseTableViewCell *)createTableViewCellWith:(UITableView *)tableView withModel:(id)model{
	
	static NSString *cellID = @"JZBaseTableViewCell";
	
	JZBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	
	if (!cell) {
		cell = [[JZBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
	}
	
	[cell creatViewCellWithModel:model];
	return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		[self createTableViewCell];
	}
	
	return self;
}
- (void)createTableViewCell{
	
	
}

- (void)creatViewCellWithModel:(id)model{
	
}
- (void)createGetModel:(id)getModel{
	
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

}
@end
