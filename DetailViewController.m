//
//  DetailViewController.m
//  Airports-iOS
//
//  Created by Edwin on 14/10/14.
//  Copyright (c) 2014 Edwin Otten. All rights reserved.
//

#import "DetailViewController.h"
#import "Airport.h"

@interface DetailViewController ()
@property NSMutableArray *cellObjects;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setAirport:(Airport *)object {
    self.navigationItem.title = airport.name;
    airport = object;
    
    if (!self.cellObjects) {
        self.cellObjects = [[NSMutableArray alloc] init];
    }
    
    NSArray *ident = @[@"ident",airport.ident];
    NSArray *type = @[@"type",airport.type];
    NSArray *name = @[@"name",airport.name];
    NSArray *elevation_ft = @[@"elevation_ft",airport.elevation_ft];
    NSArray *continent = @[@"continent",airport.continent];
    NSArray *iso_country = @[@"iso_country",airport.iso_country];
    NSArray *iso_region = @[@"iso_region",airport.iso_region];
    NSArray *municipality = @[@"municipality",airport.municipality];
    NSArray *scheduled_service = @[@"scheduled_service",airport.scheduled_service];
    NSArray *gps_code = @[@"gps_code",airport.gps_code];
    NSArray *iata_code = @[@"iata_code",airport.iata_code];
    NSArray *local_code = @[@"local_code",airport.local_code];
    NSArray *home_link = @[@"home_link",airport.home_link];
    NSArray *wikipedia_link = @[@"wikipedia_link",airport.wikipedia_link];
    NSArray *keywords = @[@"keywords",airport.keywords];
    
    NSArray *data = @[ident,type,name,elevation_ft,continent,iso_country,iso_region,municipality,scheduled_service,gps_code,iata_code,local_code,home_link,wikipedia_link,keywords];
    
    [self.cellObjects addObjectsFromArray:data];

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AirportDetailCell" forIndexPath:indexPath];
    
    NSArray *row = self.cellObjects[indexPath.row];
    cell.textLabel.text = row[0];
    cell.detailTextLabel.text = row[1];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
