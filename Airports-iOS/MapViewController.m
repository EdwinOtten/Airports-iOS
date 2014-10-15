//
//  MapViewController.m
//  Airports-iOS
//
//  Created by Edwin on 15/10/14.
//  Copyright (c) 2014 Edwin Otten. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@property CLLocation* userLocation;

@end

@implementation MapViewController
@synthesize destination;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    [self updateMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:
(MKUserLocation *)userLocation
{
    _userLocation = userLocation.location;
}

- (void)updateMap {
//    CLLocationDistance d = [destination distanceFromLocation:_userLocation];
//    MKCoordinateRegion r = MKCoordinateRegionMakeWithDistance(destination.coordinate, 2*d, 2*d);
    CLLocationCoordinate2D *user = (__bridge CLLocationCoordinate2D *)([[CLLocation alloc] initWithLatitude:41.784401 longitude:123.496002]);
    CLLocationDistance d = [destination distanceFromLocation:(__bridge const CLLocation *)(user)];
    MKCoordinateRegion r = MKCoordinateRegionMakeWithDistance(destination.coordinate, 2*d, 2*d);
    [_mapView setRegion:r animated:YES];
}

@end
