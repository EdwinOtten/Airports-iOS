//
//  DetailViewController.h
//  Airports-iOS
//
//  Created by Edwin on 13/10/14.
//  Copyright (c) 2014 Edwin Otten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
