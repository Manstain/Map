//
//  EarthquakeEntity.m
//  Earthquake
//
//  Created by Pavel on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EarthquakeEntity.h"

@implementation EarthquakeEntity


@synthesize _title;
@synthesize latitude;
@synthesize longtitude;
@synthesize depth;
@synthesize date;

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D _coordinate = CLLocationCoordinate2DMake(latitude, longtitude);
    
    return _coordinate;
}

- (NSString*)title
{
    
    return _title;
}

- (NSString*)subtitle
{
    NSString *subtitle = [NSString stringWithFormat:@"Depth: %@, %@",depth,date];
    
    return subtitle;
}

- (void)dealloc
{
    [_title release];
    [depth release];
    [date release];
    
    [super dealloc];
}

@end
