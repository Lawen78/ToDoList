//
//  SitiTableViewController.m
//  ToDoList
//
//  Created by Lorenzo on 12/01/15.
//  Copyright (c) 2015 Lorenzo. All rights reserved.
//

#import "SitiTableViewController.h"
#import "ToDoItem.h"
#import "CustomCell.h"

@interface SitiTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation SitiTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"ListPrototypeCell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)loadInitialData{
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Buy milk";
    item1.detail = @"dettaglio 1";
    [self.toDoItems addObject:item1];
    
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Buy eggs";
    item2.detail = @"dettaglio 2";

    [self.toDoItems addObject:item2];
    
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"Buy a book";
    item3.detail = @"dettaglio 3";

    [self.toDoItems addObject:item3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Il sender in questa caso è un oggetto UISToryboardSegue con un identifier che ho impostato nell'attribute inspector nel unwind (vedi nell'interface builder i due pulsanti unwind sotto Exit della scena Aggiungi Sito
-(IBAction)unwindToSitiTable:(UIStoryboardSegue*)segue{
    NSLog(@"Identifier:%@",[segue identifier]);
    if([[segue identifier] isEqualToString:@"cancel"]){
        NSLog(@"Tasto Cancel");
    }else if([[segue identifier] isEqualToString:@"save"]){
        NSLog(@"Tasto Save");
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //NSLog(@"%lu",[self.toDoItems count]);
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    //NSLog(@"%ld",indexPath.row);
    //cell.textLabel.text = toDoItem.itemName;
    CustomCell *cella = ((CustomCell*) [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath]);
    
    cella.Titolo.text = toDoItem.itemName;
    cella.descrizione.text = toDoItem.detail;
    cella.immagine.image = [UIImage imageNamed:@"Icon.png"];
    
    //cell.detailTextLabel.text = toDoItem.detail;
    if(toDoItem.completed){
        cella.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cella.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cella;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"click:%ld",indexPath.row);
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
