//
//  MapViewController.h
//  Airports-iOS
//
//  Created by Edwin on 15/10/14.
//  Copyright (c) 2014 Edwin Otten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Airport.h"

@interface MapViewController : UIViewController
<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocation *destinationLocation;
@property (nonatomic) CLLocation *departureLocation;
@end