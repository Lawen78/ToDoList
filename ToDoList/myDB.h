//
//  myDB.h
//  ToDoList
//
//  Created by Lorenzo on 13/01/15.
//  Copyright (c) 2015 Lorenzo. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface myDB : NSObject

@property (nonatomic, strong, readonly) NSManagedObjectModel *modello;
@property (nonatomic, strong, readonly) NSManagedObjectContext *contesto;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *coordinatore;

-(void)salvaContesto;
-(NSURL*)cartellaDocumentiApp;

@end
