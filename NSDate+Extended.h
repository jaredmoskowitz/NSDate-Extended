//
//  NSDate+Extended.h
//  WeParty
//
//  Created by Jared Moskowitz on 6/11/14.
//  Copyright (c) 2014 Richard Kim and Jared Moskowitz. All rights reserved.
//
//+++++++
//Class created to extend the NSDate class with some useful methods
//I created
//+++++++
#import <Foundation/Foundation.h>

@interface NSDate (Extended)

+(BOOL)date:(NSDate *)date1 isBefore:(NSDate *)date2;
+(NSDate *)incrementDay:(NSDate *)day by:(NSUInteger)daysToAdd;
+(NSDate *)startOfDay:(NSDate *)day;
+(NSDate *)yesterday;
+(NSString *)timeFormattedString:(NSDate *)date;
+(NSString *)timeFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate;
+(NSString *)dateFormattedString:(NSDate *)date;
+(NSString *)dateFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate;
+(NSString *)dateTimeFormattedString:(NSDate *)date;
+(NSString *)dateTimeFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate;
+(NSString *)javascriptDateObjectFormat:(NSDate *)date;
+(NSDictionary *)JSONDateFormat:(NSDate *)date;
+(NSDate *)dateFrom:(NSInteger)numberOfDays daysAfter:(NSDate *)date;
+(NSDate *)dateFromFacebookDateTime:(NSString *)datetime;
+(NSDate *)dateFromFacebookDate:(NSString *)datetime;

@end
