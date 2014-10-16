//
//  DetailViewController.m
//  Airports-iOS
//
//  Created by Edwin on 14/10/14.
//  Copyright (c) 2014 Edwin Otten. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewController.h"
#import "Airport.h"
#import "AirportList.h"

@interface DetailViewController ()
@property NSMutableArray *cellObjects;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(viewMap)];
}

- (void)viewMap {
    [self performSegueWithIdentifier: @"mapViewSegue" sender: self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setAirport:(Airport *)object {
    airport = object;
    
    self.navigationItem.title = airport.name;
    
    if (!self.cellObjects) {
        self.cellObjects = [[NSMutableArray alloc] init];
    }
    
    NSArray *Id = @[@"ID", [NSString stringWithFormat: @"%ld", (long)airport.id]];
    NSArray *ident = @[@"Identifier",airport.ident];
    NSArray *type = @[@"Type",airport.type];
    NSArray *name = @[@"Name",airport.name];
    
    NSArray *latitude_deg = @[@"Lengtegraad", [NSString stringWithFormat:@"%f", airport.latitude_deg] ];
    NSArray *longitude_deg = @[@"Breedtegraad", [NSString stringWithFormat:@"%f", airport.longitude_deg] ];
    
    NSArray *elevation_ft = @[@"Hoogte in ft",airport.elevation_ft];
    NSArray *continent = @[@"Continent",airport.continent];
    NSArray *iso_country = @[@"ISO land",airport.iso_country];
    NSArray *iso_region = @[@"ISO regio",airport.iso_region];
    NSArray *municipality = @[@"Gemeente",airport.municipality];
    NSArray *scheduled_service = @[@"Geplande werkzaamheden",airport.scheduled_service];
    NSArray *gps_code = @[@"GPS code",airport.gps_code];
    NSArray *iata_code = @[@"iata_code",airport.iata_code];
    NSArray *local_code = @[@"local_code",airport.local_code];
    NSArray *home_link = @[@"Website",airport.home_link];
    NSArray *wikipedia_link = @[@"Wikipedia",airport.wikipedia_link];
    NSArray *keywords = @[@"Sleutelwoorden",airport.keywords];
    
    NSArray *data = @[Id,ident,type,name,latitude_deg,longitude_deg,elevation_ft,continent,iso_country,iso_region,municipality,scheduled_service,gps_code,iata_code,local_code,home_link,wikipedia_link,keywords];
    
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


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"mapViewSegue"])
    {
        // Get reference to the destination view controller
        MapViewController *vc = [segue destinationViewController];
        vc.destinationLocation = airport.location;
        AirportList *airportList = [AirportList new];
        Airport *schiphol = [airportList getAirportByICAO:"EHAM"];
        vc.departureLocation = schiphol.location;
    }
}

@end
