//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Betty Fung on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"
#import "FISTrivium.h"

@implementation FISLocation

-(instancetype)init{
    self = [self initWithName:@"" latitude:0.0 longitude:0.0];
    return self;
}


-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    
    if (self){
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        
        _trivia = [[NSMutableArray alloc] init];
    }
    
    return self;
}


-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length{
    
    NSString *truncatedName = @"";
    
    if (length > [self.name length]) {
        truncatedName = [truncatedName stringByAppendingString:self.name];
    }
    else {
        truncatedName = [self.name substringToIndex:length];
    }
    
    return truncatedName;
}



-(BOOL)hasValidData{
    
    if([self.name length] == 0){
        return NO;
    }
    else if(self.latitude < -90.0 || self.latitude > 90.0){
        return NO;
    }
    else if(self.longitude <= -180.0 || self.longitude > 180.00){
        return NO;
    }
    
    // can essentially nest all these conditions into one big if()-statement but this set up makes it easier to read
    
    return YES;
}



-(FISTrivium *)triviumWithMostLikes{
    
    if([self.trivia count] > 0){
        
        NSSortDescriptor *getMostLikes = [[NSSortDescriptor alloc] initWithKey:@"likes" ascending:NO];
        [self.trivia sortUsingDescriptors:@[getMostLikes]];
        
        //get everything in descending order so the object with most likes is first
        return self.trivia[0];
    }
    
    //alternative method using for-in loops: 
    
    return nil;
}


@end
