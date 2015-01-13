//
//  CustomCell.m
//  ToDoList
//
//  Created by Lorenzo on 13/01/15.
//  Copyright (c) 2015 Lorenzo. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)pulsantePremuto:(id)sender {
    NSLog(@"premuto");
}
@end
