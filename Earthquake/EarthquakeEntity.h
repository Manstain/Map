//
//  EarthquakeEntity.h
//  Earthquake
//
//  Created by Pavel on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface EarthquakeEntity : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic,retain)    NSString *_title;
@property(nonatomic,retain)    NSString *date;
@property(nonatomic)    CGFloat latitude;
@property(nonatomic)    CGFloat longtitude;
@property(nonatomic,retain)    NSString *depth;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;




@end
