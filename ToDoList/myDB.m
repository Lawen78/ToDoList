//
//  myDB.m
//  ToDoList
//
//  Created by Lorenzo on 13/01/15.
//  Copyright (c) 2015 Lorenzo. All rights reserved.
//

#import "myDB.h"


@implementation myDB

-(void)salvaContesto{
    NSError *erroreDB;
    if([self.contesto hasChanges] && ![self.contesto save:&erroreDB]){
        NSLog(@"Errori:%@ %@",erroreDB,[erroreDB userInfo]);
        abort();
    }
    
}

-(NSURL*)cartellaDocumentiApp{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(id)init{
    self = [super init];
    if(self){
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Eventi" withExtension:@"momd"];
        _modello = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        
        NSURL *storeURL= [[self cartellaDocumentiApp] URLByAppendingPathComponent:@"ToDoList.sqlite"];
        _coordinatore = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.modello];
        
        NSError *errore;
        
        if(![_coordinatore addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&errore]){
            NSLog(@"Errore: %@ %@",errore, [errore userInfo]);
            abort();
        }
        
        _contesto = [[NSManagedObjectContext alloc] init];
        
        [_contesto setPersistentStoreCoordinator:self.coordinatore];
    }
    
    return self;
}

@end
