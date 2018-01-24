//
//  NSDate+Extensions.m
//  TechCodeApp
//
//  Created by Mac on 24/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

-(NSDate*) dateAtMidnight
{
    NSCalendar *calendar= [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    
    NSDate* date = [calendar startOfDayForDate:self];
    
    return date;
}

@end
