//
//  NSDate+Extended.m
//  WeParty
//
//  Created by Jared Moskowitz on 6/11/14.
//  Copyright (c) 2014 Richard Kim and Jared Moskowitz. All rights reserved.
//

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


+(NSDate *)incrementDay:(NSDate *)day by:(NSUInteger)daysToAdd
{
    return [day dateByAddingTimeInterval:60*60*24*daysToAdd];
}

+(NSDate *)startOfDay:(NSDate *)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:day];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    return [calendar dateFromComponents:components];
}

+(NSDate *)yesterday
{
    NSDate *startOfDay = [self startOfDay:[NSDate date]];
    return [startOfDay dateByAddingTimeInterval:-(60.0f*60.0f*24.0f)];
}

+(NSString *)timeFormattedString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mma"];
    return [dateFormatter stringFromDate:date];
}

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

+(NSString *)dateFormattedString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, MM/dd/yy"];
    return [dateFormatter stringFromDate:date];
}

+(NSString *)dateFormattedStringForStartDate:(NSDate *)startDate EndDate:(NSDate *)endDate
{
    NSString *startTime = [NSDate dateFormattedString:startDate];
    NSString *endTime = [NSDate dateFormattedString:endDate];
    NSString *composite = [startTime stringByAppendingString:@" - "];
    return [composite stringByAppendingString:endTime];
}

+(NSString *)dateTimeFormattedString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, MM/dd/yy 'at' hh:mma"];
    return [dateFormatter stringFromDate:date];
}


+(NSString *)dateTimeFormattedStringForStartDate:(NSDate *)startDate EndDate:(NSDate *)endDate
{
    NSString *start = [NSDate dateTimeFormattedString:startDate];
    NSString *end = [NSDate dateTimeFormattedString:endDate];
    start = [start stringByAppendingString:@" - to - "];
    return [start stringByAppendingString:end];
}

+(NSString *)javascriptDateObjectFormat:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    return [dateFormatter stringFromDate:date];
}


//+++TODO implement this for more options when dealing with
//dates on the backend
+(NSDictionary *)JSONDateFormat:(NSDate *)date
{
    return nil;
}

+(NSDate *)dateFrom:(NSInteger)numberOfDays daysAfter:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numberOfDays];
    return [gregorian dateByAddingComponents:offsetComponents toDate:date options:0];
}


+(NSDate *)dateFromFacebookDateTime:(NSString *)datetime
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    //2010-12-01T21:35:43+0000
    [df setDateFormat:@"yyyy'-'MM'-'ddHH':'mm':'ssZZZZ"];
    return [df dateFromString:[datetime stringByReplacingOccurrencesOfString:@"T" withString:@""]];
}


+(NSDate *)dateFromFacebookDate:(NSString *)datetime
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    //2010-12-01T21:35:43+0000
    [df setDateFormat:@"yyyy'-'MM'-'dd"];
    return [df dateFromString:datetime];
}
@end

