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
@property NSMutableArray *objects;

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
    
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    [self.objects insertObject:airport.ident atIndex:0];
    [self.objects insertObject:airport.type atIndex:1];
    [self.objects insertObject:airport.name atIndex:2];
    [self.objects insertObject:airport.elevation_ft atIndex:3];
    [self.objects insertObject:airport.continent atIndex:4];
    [self.objects insertObject:airport.iso_country atIndex:5];
    [self.objects insertObject:airport.iso_region atIndex:6];
    [self.objects insertObject:airport.municipality atIndex:7];
    [self.objects insertObject:airport.scheduled_service atIndex:8];
    [self.objects insertObject:airport.gps_code atIndex:9];
    [self.objects insertObject:airport.iata_code atIndex:10];
    [self.objects insertObject:airport.local_code atIndex:11];
    [self.objects insertObject:airport.home_link atIndex:12];
    [self.objects insertObject:airport.wikipedia_link atIndex:13];
    [self.objects insertObject:airport.keywords atIndex:14];

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AirportDetailCell" forIndexPath:indexPath];
    
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    cell.detailTextLabel.text = [object description];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView addCell:(NSMutableArray *)strings {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AirportDetailCell" forIndexPath:0];
    cell.textLabel.text = strings[0];
    cell.detailTextLabel.text = strings[1];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
