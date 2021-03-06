#import "AirportList.h"
#import "Airport.h"


@interface AirportList ()

@end

@implementation AirportList
@synthesize airports;
@synthesize sectionTitles;

- (void) updateAirports{
    @try {
        airports = [[NSMutableDictionary alloc] init];
        sectionTitles = [[NSMutableArray alloc] init];
        db = [self getDB];
        const char *sql = "SELECT * FROM airports WHERE continent = 'EU' ORDER BY name";
        sqlite3_stmt *sqlStatement;
        if(sqlite3_prepare_v2(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
        {
            NSLog(@"Problem with prepare statement");
            NSLog(@"Error while creating update statement. '%s'", sqlite3_errmsg(db));
        }
        

        while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
            Airport *myAirport = [self mapStatementToAirport:sqlStatement];
            if (myAirport.name.length < 1) { break; }
            NSString *mySectionTitle = [myAirport.name substringToIndex:1];
            
            if ([airports objectForKey:mySectionTitle] == NULL){
                NSMutableArray *temp = [[NSMutableArray alloc] init];
                [airports setObject:temp forKey:mySectionTitle];
            }
            
            NSMutableArray *section = [airports objectForKey:mySectionTitle];
            [section insertObject:myAirport atIndex:section.count ];
            airports[mySectionTitle] = section;
            
            bool sectionTitleFound = NO;
            for (NSString *title in sectionTitles) {
                if ([title isEqualToString:mySectionTitle]) {
                    sectionTitleFound = YES;
                }
            }

            // if the sectiontitle is not known yet
            if (!sectionTitleFound) {
                [sectionTitles insertObject:mySectionTitle atIndex:sectionTitles.count ];
            }
            
        }
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    
}

- (Airport *) getAirportByICAO: (char *) icao{

    @try {
        db = [self getDB];
        NSString *select = [NSString stringWithFormat:@"SELECT * FROM airports WHERE ident =  '%s'", icao];
        const char *sql = [select cStringUsingEncoding:NSASCIIStringEncoding];
        sqlite3_stmt *sqlStatement;
        if(sqlite3_prepare_v2(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
        {
            NSLog(@"Problem with prepare statement");
            NSLog(@"Error while creating update statement. '%s'", sqlite3_errmsg(db));
        }
        
        while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
            return [self mapStatementToAirport:sqlStatement];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    
}

- (sqlite3 *) getDB {
    if (self->db == NULL) {
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
        return db;
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
        
    }
}

- (Airport *) mapStatementToAirport:(sqlite3_stmt *) sqlStatement{
    Airport *airport = [Airport new];
    
    airport.id =                  sqlite3_column_int(sqlStatement, 0);
    airport.ident =               [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
    airport.type =                [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
    airport.name =                [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
    airport.latitude_deg =        sqlite3_column_double(sqlStatement, 4);
    airport.longitude_deg =       sqlite3_column_double(sqlStatement, 5);
    airport.location =            [[CLLocation alloc] initWithLatitude:airport.latitude_deg longitude:airport.longitude_deg];
    airport.elevation_ft =        [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 6)];
    airport.continent =           [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 7)];
    airport.iso_country =         [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 8)];
    airport.iso_region =          [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 9)];
    airport.municipality =        [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 10)];
    airport.scheduled_service =   [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 11)];
    airport.gps_code =            [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 12)];
    airport.iata_code =           [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 13)];
    airport.local_code =          [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 14)];
    airport.home_link =           [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 15)];
    airport.wikipedia_link =      [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 16)];
    airport.keywords =            [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 17)];
    
    return airport;
}



@end