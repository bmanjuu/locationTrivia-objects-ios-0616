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
    
    CGFloat latLowerLimit = latitude - margin;
    CGFloat latUpperLimit = latitude + margin;
    CGFloat longLowerLimit = longitude - margin;
    CGFloat longUpperLimit = longitude + margin;
    
    for(FISLocation *location in self.locations){
        // everything nested within the if()-statement is connected by an && because if it is within the margin, it is both greater than or equal to the lower limit AND less than or equal to the upper limit. 
        if(location.latitude >= latLowerLimit && location.latitude <= latUpperLimit && location.longitude >= longLowerLimit && location.longitude <= longUpperLimit){
            [locationsWithinMargin addObject:location];
        }
    }

    return locationsWithinMargin;
}

@end
