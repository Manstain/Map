//
//  myViewController.h
//  Earthquake
//
//  Created by Pavel on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "XMLParser.h"
#import <CoreLocation/CoreLocation.h>

#define EARTHQUAKEURL @"http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M5.xml"

@interface RootController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate,NSURLConnectionDataDelegate>
{
    IBOutlet MKMapView *map;
    CLLocationManager *locationManager;
    NSMutableArray *earthquakes;
    NSURLConnection *connection;
    NSURLRequest *request;
    NSMutableData *earthquakesData;
}

- (void)addAnnotations;

@end
