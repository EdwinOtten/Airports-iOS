#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Airport.h"

@interface AirportList : NSObject{
    sqlite3 *db;
}

- (void) updateAirports;
- (Airport *) getAirportByICAO: (char *) icao;
@property NSMutableDictionary *airports;
@property NSMutableArray *sectionTitles;
@end