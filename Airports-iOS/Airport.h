#import <Foundation/Foundation.h>

@interface Airport : NSObject{
    NSInteger id;
    NSString *ident;
    NSString *type;
    NSString *name;
    double latitude_deg;
    double longitude_deg;
    NSString *elevation_ft;
    NSString *continent;
    NSString *iso_country;
    NSString *iso_region; //Bensalem
    NSString *municipality;
    NSString *scheduled_service;
    NSString *gps_code;
    NSString *iata_code;
    NSString *local_code;
    NSString *home_link;
    NSString *wikipedia_link;
    NSString *keywords;
}

@property (nonatomic, assign)NSInteger id;
@property (nonatomic, retain)NSString *ident;
@property (nonatomic, retain)NSString *type;
@property (nonatomic, retain)NSString *name;
@property (nonatomic, assign)double *latitude_deg;
@property (nonatomic, assign)double *longitude_deg;
@property (nonatomic, retain)NSString *elevation_ft;
@property (nonatomic, retain)NSString *continent;
@property (nonatomic, retain)NSString *iso_country;
@property (nonatomic, retain)NSString *iso_region; //Bensalem
@property (nonatomic, retain)NSString *municipality;
@property (nonatomic, retain)NSString *scheduled_service;
@property (nonatomic, retain)NSString *gps_code;
@property (nonatomic, retain)NSString *iata_code;
@property (nonatomic, retain)NSString *local_code;
@property (nonatomic, retain)NSString *home_link;
@property (nonatomic, retain)NSString *wikipedia_link;
@property (nonatomic, retain)NSString *keywords;

//
//"id","ident","type","name","latitude_deg","longitude_deg","elevation_ft","continent","iso_country","iso_region","municipality","scheduled_service","gps_code","iata_code","local_code","home_link","wikipedia_link","keywords"
//6523,"00A","heliport","Total Rf Heliport",40.07080078125,-74.9336013793945,11,"NA","US","US-PA","Bensalem","no","00A",,"00A",,,

@end