//
//  ToDoItem.h
//  ToDoList
//
//  Created by Lorenzo on 12/01/15.
//  Copyright (c) 2015 Lorenzo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property NSString *detail;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
