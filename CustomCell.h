//
//  CustomCell.h
//  ToDoList
//
//  Created by Lorenzo on 13/01/15.
//  Copyright (c) 2015 Lorenzo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *Titolo;
@property (strong, nonatomic) IBOutlet UILabel *descrizione;
@property (strong, nonatomic) IBOutlet UIImageView *immagine;
- (IBAction)pulsantePremuto:(id)sender;
@end
