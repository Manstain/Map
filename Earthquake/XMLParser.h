//
//  XMLParser.h
//  Earthquake
//
//  Created by Pavel on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EarthquakeEntity.h"

@interface XMLParser : NSObject <NSXMLParserDelegate>
{
    NSString *currentKey;
    NSMutableString *currentStringValue;
    EarthquakeEntity *earthquake;
}

@property(nonatomic, retain) NSMutableArray *earthquaData;


@end
