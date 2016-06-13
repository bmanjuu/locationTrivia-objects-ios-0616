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
    
    for(FISLocation *location in self.locations){
//        if((NSLocationInRange(location.latitude, NSMakeRange(latitude, margin))) || (NSLocationInRange(location.longitude, NSMakeRange(longitude, margin)))){
//            [locationsWithinMargin addObject:location]; 
//        }
        NSLog(@"\n\n\n\n\n\n\n\n\n\n\nlatitude: %f", latitude);
        NSLog(@"margin: %f", margin);
        NSLog(@"latitude+margin: %f", latitude+margin);
        if((location.latitude >= latitude+margin || location.latitude <= latitude-margin) && (location.longitude >= longitude+margin || location.longitude <= longitude-margin)){
            [locationsWithinMargin addObject:location];
        }
    }
    
    return locationsWithinMargin;
}

@end
