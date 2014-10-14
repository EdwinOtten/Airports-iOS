#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface AirportList : NSObject{
    sqlite3 *db;
}

- (NSMutableArray *) getMyAirports;

@end