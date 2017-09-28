//
//  TableVC.m
//  SWTable
//
//  Created by Mac on 9/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TableVC.h"
#import "Networking.h"
#import "ViewController.h"
#import "MyCell.h"

@interface TableVC () {
    NSMutableArray * tableData; //sw names
    NSMutableDictionary * images;
}
@end

@implementation TableVC



//@synthesize tableData = [NSMutableArray array
- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [NSMutableArray array];
    images = [NSMutableDictionary dictionary];
    
    [[self tableView] reloadData];
    
    for (int i = 1; i <= 9; i++){
        [Networking callApi:i thenBlock:^(NSDictionary * jsonObject) {
            dispatch_sync(dispatch_get_main_queue(),^{
                NSArray *results;
                
                if ([[jsonObject objectForKey:@"results"] isKindOfClass:[NSArray class]])
                {
                    results = [jsonObject objectForKey:@"results"];
                    for (int i = 0; i < results.count; i++) {
                        NSDictionary * item = results[i];
                        NSString * name = [item objectForKey:@"name"];
                        [self->tableData addObject:[NSString stringWithFormat:@"%@", name]];
                    }
                }
                [[self tableView] reloadData];
            });
        }];
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailedView"]) {
        ViewController *vc = (ViewController *) segue.destinationViewController;
        
        NSString * name = [sender name];
        vc.name = name;
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    MyCell *cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    NSString * name = tableData[indexPath.row];
    [cell fillCell:name];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
