//
//  MasterViewController.m
//  Airports-iOS
//
//  Created by Edwin on 13/10/14.
//  Copyright (c) 2014 Edwin Otten. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AirportList.h"
#import "Airport.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property NSMutableDictionary *airports;
@property NSArray *sectionTitles;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AirportList *airportList = [AirportList new];
    [airportList updateAirports];
    _airports = airportList.airports;
    _sectionTitles = airportList.sectionTitles;

//    
//    for (Airport *airport in airports) {
//        if (!self.objects) {
//            self.objects = [[NSMutableArray alloc] init];
//        }
//        [self.objects insertObject:airport.name atIndex:0];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        // Get reference to the destination view controller
        DetailViewController *vc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger rowcount = [self.tableView numberOfRowsInSection:indexPath.section];
        NSInteger selected = indexPath.row + 1;
        
        NSString *sectionKey = [_sectionTitles objectAtIndex:indexPath.section];
        NSMutableArray *airportSection = _airports[sectionKey];
        
        Airport *airport = [airportSection objectAtIndex:selected-1];
        [vc setAirport:airport];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_sectionTitles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_sectionTitles objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [_sectionTitles objectAtIndex:section];
    NSArray *sectionAirports = [_airports objectForKey:sectionTitle];
    return [sectionAirports count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [_sectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionAirports = [_airports objectForKey:sectionTitle];
    Airport *airport = [sectionAirports objectAtIndex:indexPath.row];
    cell.textLabel.text = airport.name;
    
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sectionTitles;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
