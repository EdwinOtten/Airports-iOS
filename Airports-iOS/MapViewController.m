//
//  MapViewController.m
//  Airports-iOS
//
//  Created by Edwin on 15/10/14.
//  Copyright (c) 2014 Edwin Otten. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mapView.showsUserLocation = NO;
    _mapView.delegate = self;
    [self updateMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateMap {
    MKPointAnnotation *departurePoint = [MKPointAnnotation new];
    [departurePoint setCoordinate:_departureLocation.coordinate];

    MKPointAnnotation *destinationPoint = [MKPointAnnotation new];
    [destinationPoint setCoordinate:_destinationLocation.coordinate];
    
    [_mapView addAnnotations:@[departurePoint,destinationPoint]];
    
    [_mapView showAnnotations: _mapView.annotations animated:YES];
//    _mapView.camera.altitude = 1.4;
    
    CLLocationCoordinate2D coordinates[2] =
    {_departureLocation.coordinate, _destinationLocation.coordinate};
    
    MKPolyline *polyline =
    [MKPolyline polylineWithCoordinates:coordinates
                                          count:2];
    
    MKGeodesicPolyline *geodesicPolyline =
    [MKGeodesicPolyline polylineWithCoordinates:coordinates
                                          count:2];
    
    [_mapView addOverlay:polyline];
    [_mapView addOverlay:geodesicPolyline];
}

#pragma mark - MKMapViewDelegate

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
            rendererForOverlay:(id <MKOverlay>)overlay
{
    if (![overlay isKindOfClass:[MKPolyline class]]) {
        return nil;
    }
    
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithPolyline:(MKPolyline *)overlay];
    renderer.lineWidth = 3.0f;
    renderer.strokeColor = [UIColor redColor];
    renderer.alpha = 0.5;
    
    if ([overlay isKindOfClass:[MKGeodesicPolyline class]]) {
        renderer.strokeColor = [UIColor blueColor];
    }
    
    return renderer;
}

@end
