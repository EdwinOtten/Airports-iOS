#import <Foundation/Foundation.h>

@interface Airport : NSObject

@property (nonatomic, assign)NSInteger id;
@property (nonatomic, retain)NSString *ident;
@property (nonatomic, retain)NSString *type;
@property (nonatomic, retain)NSString *name;
@property (nonatomic, assign)double latitude_deg;
@property (nonatomic, assign)double longitude_deg;
@property (nonatomic, retain)NSString *elevation_ft;
@property (nonatomic, retain)NSString *continent;
@property (nonatomic, retain)NSString *iso_country;
@property (nonatomic, retain)NSString *iso_region;
@property (nonatomic, retain)NSString *municipality;
@property (nonatomic, retain)NSString *scheduled_service;
@property (nonatomic, retain)NSString *gps_code;
@property (nonatomic, retain)NSString *iata_code;
@property (nonatomic, retain)NSString *local_code;
@property (nonatomic, retain)NSString *home_link;
@property (nonatomic, retain)NSString *wikipedia_link;
@property (nonatomic, retain)NSString *keywords;


@end