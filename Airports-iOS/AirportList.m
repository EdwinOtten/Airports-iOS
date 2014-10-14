#import "AirportList.h"
#import "Airport.h"

@implementation AirportList

- (NSMutableArray *) getMyAirports{
    NSMutableArray *wineArray = [[NSMutableArray alloc] init];
    @try {
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"airports2.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        if(!success)
        {
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
        {
            NSLog(@"An error has occured.");
        }
        const char *sql = "SELECT * FROM airports";
        sqlite3_stmt *sqlStatement;
        if(sqlite3_prepare_v2(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
        {
            NSLog(@"Problem with prepare statement");
            NSLog(@"Error while creating update statement. '%s'", sqlite3_errmsg(db));
        }
        
        //
        int i = 0;
        int max = 40;
        while (sqlite3_step(sqlStatement)==SQLITE_ROW && i<max) {
            Airport *myAirport = [[Airport alloc]init];
            
            myAirport.id =      sqlite3_column_int(sqlStatement, 0);
            myAirport.ident =               [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
            myAirport.type =                [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
            myAirport.name =                [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
//            myAirport.latitude_deg =        sqlite3_column_double(sqlStatement, 4);
//            myAirport.longitude_deg =       sqlite3_column_double(sqlStatement, 5);
            myAirport.elevation_ft =        [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 6)];
            myAirport.continent =           [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 7)];
            myAirport.iso_country =         [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 8)];
            myAirport.iso_region =          [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 9)];
            myAirport.municipality =        [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 10)];
            myAirport.scheduled_service =   [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 11)];
            myAirport.gps_code =            [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 12)];
            myAirport.iata_code =           [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 13)];
            myAirport.local_code =          [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 14)];
            myAirport.home_link =           [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 15)];
            myAirport.wikipedia_link =      [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 16)];
            myAirport.keywords =            [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 17)];

            [wineArray addObject:myAirport];
            i++;
        }
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        return wineArray;
    }
    
}


@end