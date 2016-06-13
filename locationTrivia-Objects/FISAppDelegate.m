//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)allLocationNames{
    
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    
    for(FISLocation *location in self.locations){
        [locationNames addObject:location.name];
    }
    
    return locationNames;
}



-(FISLocation *)locationNamed:(NSString *)name{
    
    for(FISLocation *location in self.locations){
        if([location.name isEqualToString:name]){
            return location;
        }
    }
    
    return nil;
}



-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin{
    
    NSMutableArray *locationsWithinMargin = [[NSMutableArray alloc] init];
    
    NSRange marginForRange = NSMakeRange(0, 25);
    
    for(FISLocation *location in self.locations){
        BOOL latitudeInRange = NSLocationInRange(location.latitude, marginForRange);
        BOOL longitudeInRange = NSLocationInRange(location.longitude, marginForRange);
        if(latitudeInRange && longitudeInRange){
            [locationsWithinMargin addObject:location];
        }
    }
    
    return locationsWithinMargin;
}

@end
