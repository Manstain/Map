//
//  myViewController.m
//  Earthquake
//
//  Created by Pavel on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootController.h"

@implementation RootController


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate =self;
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [map setShowsUserLocation:YES];
    
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:EARTHQUAKEURL]];
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
//    MKAnnotationView *annotationViev = [views objectAtIndex:0];
//    id <MKAnnotation> ma = [annotationViev annotation];
//    
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([ma coordinate], 250, 250);
//    
//    [mapView setRegion:region animated:YES];
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[EarthquakeEntity class]])
    {
        static NSString *AnnotationIdentifier = @"AnnotationIdentifier";
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
        
        if (!pinView)
        {
            pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier] autorelease];
            pinView.canShowCallout = YES;
        }
        else
        {
            pinView.annotation = annotation;
        }
        
        pinView.image = [UIImage imageNamed:@"earthquake.png"];
        
        return pinView;
    }
    
    return nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    earthquakesData = [[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSXMLParser *doc = [[NSXMLParser alloc]initWithData:earthquakesData];
    XMLParser *parser = [[XMLParser alloc]init];
    [doc setDelegate:parser];
    [doc parse];
    
    earthquakes = [parser.earthquaData retain];

    [self addAnnotations];
    
    [doc release];
    [parser release];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [earthquakesData appendData:data];
}

- (void)addAnnotations
{
    for (EarthquakeEntity *curEarthquake in earthquakes)
    {
        [map addAnnotation:curEarthquake];
    }
}

- (void)dealloc
{
    [earthquakesData release];
    [earthquakes release];
    [super dealloc];
}

@end
