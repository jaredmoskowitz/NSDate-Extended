//
//  NSDate+Extended.h
//  
//
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
