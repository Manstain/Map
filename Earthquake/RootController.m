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
    MKAnnotationView *annotationViev = [views objectAtIndex:0];
    id <MKAnnotation> ma = [annotationViev annotation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([ma coordinate], 250, 250);
    
    [mapView setRegion:region animated:YES];
    
    
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSXMLParser *doc = [[NSXMLParser alloc]initWithData:data];
    [doc setDelegate:self];
    [doc parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (!curCharacter)
    {
        [curCharacter appendFormat:string];
    }
}

@end
