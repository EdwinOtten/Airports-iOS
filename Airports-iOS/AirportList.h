#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Airport.h"

@interface AirportList : NSObject{
    sqlite3 *db;
}

+ (NSMutableArray *) getMyAirports;
+ (Airport *) getAirportByICAO: (char *) icao;

@end