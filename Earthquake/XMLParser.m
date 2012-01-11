//
//  XMLParser.m
//  Earthquake
//
//  Created by Pavel on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

@synthesize earthquaData;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentKey = nil;
    [currentStringValue release];
    currentStringValue = nil;
    
    if([elementName isEqualToString:@"item"])
    {
        if (!self.earthquaData)
        {
            self.earthquaData = [[NSMutableArray alloc]init];
        }
        
        earthquake = [[EarthquakeEntity alloc]init];
        return;
    }
        
        if([elementName isEqualToString:@"title"])
        {
            currentKey = @"title";
            return;
        }
        
        if([elementName isEqualToString:@"description"])
        {
            currentKey = @"description";
            return;
        }

        
        if([elementName isEqualToString:@"geo:lat"])
        {
            currentKey = @"geo:lat";
            return;
        }
        
        if([elementName isEqualToString:@"geo:long"])
        {
            currentKey = @"geo:long";
            return;
        }
        
        if([elementName isEqualToString:@"dc:subject"])
        {
            currentKey = @"dc:subject";
            return;
        }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"])
    {
        [earthquaData addObject:earthquake];
       // NSLog(@"%@",earthquaData.count);
        [earthquake release];
        earthquake = nil;
        return;
    }
        
        if([elementName isEqualToString:@"title"])
        {
            earthquake._title = currentStringValue;
            return;
        }
        
        if([elementName isEqualToString:@"description"])
        {
            earthquake.date = currentStringValue;
            return;
        }
        
        
        if([elementName isEqualToString:@"geo:lat"])
        {
            earthquake.latitude = [currentStringValue floatValue];
            return;
        }
        
        if([elementName isEqualToString:@"geo:long"])
        {
            earthquake.longtitude = [currentStringValue floatValue];
            return;
        }
        
        if([elementName isEqualToString:@"dc:subject"])
        {
            earthquake.depth = currentStringValue;            
            return;
        }

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(currentKey)
    {
        if(!currentStringValue)
        {
            currentStringValue = [[NSMutableString alloc] initWithCapacity:200];
        }
        
        [currentStringValue appendString:string];
    }
}
- (void)dealloc 
{
    [self.earthquaData release];
    
    [currentKey release];
    [currentStringValue release];
    [super dealloc];
}


@end
