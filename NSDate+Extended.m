//
//  NSDate+Extended.m
//  Created by Jared Moskowitz on 6/11/14.
    // This program is free software: you can redistribute it and/or modify
    // it under the terms of the GNU General Public License as published by
    // the Free Software Foundation, either version 3 of the License, or
    // (at your option) any later version.

    // This program is distributed in the hope that it will be useful,
    // but WITHOUT ANY WARRANTY; without even the implied warranty of
    // MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    // GNU General Public License for more details.
//
//Category created to extend the NSDate class with some useful methods

#import "NSDate+Extended.h"

@implementation NSDate (Extended)


//returns YES if first date is chronologically before second date
//
//NOTE
//if first date is nil then return NO
//if second date is nil then return YES
+(BOOL)date:(NSDate *)date1 isBefore:(NSDate *)date2
{
    if (!date1) {
        return YES;
    } else if(!date2) {
        return NO;
    } else {
        return [date1 compare:date2] == NSOrderedAscending;
    }
}


//Incrementing a NSDate by a given amount of days
+(NSDate *)incrementDay:(NSDate *)day by:(NSUInteger)daysToAdd
{
    return [day dateByAddingTimeInterval:60*60*24*daysToAdd];
}


//Getting the start of a day
+(NSDate *)startOfDay:(NSDate *)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:day];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    return [calendar dateFromComponents:components];
}


//Get yesterday's date
+(NSDate *)yesterday
{
    NSDate *startOfDay = [self startOfDay:[NSDate date]];
    return [startOfDay dateByAddingTimeInterval:-(60.0f*60.0f*24.0f)];
}



//Getting a formatted string with the time from an NSDate e.g. 06:42 PM
+(NSString *)timeFormattedString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mma"];
    return [dateFormatter stringFromDate:date];
}


//Getting a formatted string with the time from a start
//NSDate and an end NSDate e.g. 06:42PM - 07:00PM
+(NSString *)timeFormattedStringForStartDate:(NSDate *)startDate EndDate:(NSDate *)endDate
{
    NSString *startTime = [NSDate timeFormattedString:startDate];
    NSString *endTime = [NSDate timeFormattedString:endDate];
    if (endTime) {
        NSString *composite = [startTime stringByAppendingString:@" - "];
        return [composite stringByAppendingString:endTime];
    } else {
        return startTime;
    }
    
}


//Getting a formatted string with the date from an NSDate e.g. Tue, 09/06/14
+(NSString *)dateFormattedString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, MM/dd/yy"];
    return [dateFormatter stringFromDate:date];
}


//Getting a formatted string with the date from an NSDate e.g. Tue, 09/06/14
+(NSString *)dateFormattedStringForStartDate:(NSDate *)startDate EndDate:(NSDate *)endDate
{
    NSString *startTime = [NSDate dateFormattedString:startDate];
    NSString *endTime = [NSDate dateFormattedString:endDate];
    NSString *composite = [startTime stringByAppendingString:@" - "];
    return [composite stringByAppendingString:endTime];
}



//Getting a formatted string with the date and time from
//an NSDate e.g. Tue, 09/06/14 at 06:42PM
+(NSString *)dateTimeFormattedString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, MM/dd/yy 'at' hh:mma"];
    return [dateFormatter stringFromDate:date];
}




//Getting a formatted string with the start date and time and the end 
//date and time from NSDates
//e.g. Tue, 09/06/14 at 06:42PM to Wed, 09/07/14 at 07:00AM
+(NSString *)dateTimeFormattedStringForStartDate:(NSDate *)startDate EndDate:(NSDate *)endDate
{
    NSString *start = [NSDate dateTimeFormattedString:startDate];
    NSString *end = [NSDate dateTimeFormattedString:endDate];
    start = [start stringByAppendingString:@" - to - "];
    return [start stringByAppendingString:end];
}



//Getting a string that from an NSDate that can be parsed into a 
//javascription Date object 
//(useful for dealing with REST APIs such as facebook)
+(NSString *)javascriptDateObjectFormat:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    return [dateFormatter stringFromDate:date];
}




//Getting a NSDate by parsing a datetime string returned by the 
//facebook Graph API
+(NSDate *)dateFromFacebookDateTime:(NSString *)datetime
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    //2010-12-01T21:35:43+0000
    [df setDateFormat:@"yyyy'-'MM'-'ddHH':'mm':'ssZZZZ"];
    return [df dateFromString:[datetime stringByReplacingOccurrencesOfString:@"T" withString:@""]];
}


//Getting a NSDate by parsing the datetime (where there is only a date and 
//no time) from the facebook Graph API
+(NSDate *)dateFromFacebookDate:(NSString *)datetime
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    //2010-12-01T21:35:43+0000
    [df setDateFormat:@"yyyy'-'MM'-'dd"];
    return [df dateFromString:datetime];
}
@end

