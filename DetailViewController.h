//
//  DetailViewController.h
//  Airports-iOS
//
//  Created by Edwin on 14/10/14.
//  Copyright (c) 2014 Edwin Otten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Airport.h"

@interface DetailViewController : UITableViewController {
    Airport *airport;
}
- (void) setAirport:Airport;
@end
