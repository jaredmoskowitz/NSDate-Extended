NSDate-Extended
===============

This repository contains a category with many useful methods for dealing 
with NSDates in Objective-C.

METHODS INCLUDED:

    //Incrementing a NSDate by a given amount of days
    +(NSDate *)incrementDay:(NSDate *)day by:(NSUInteger)daysToAdd;

    //comparing a date to a second date to get a boolean as to whether the
    //first date is chronologically before the second date
    +(BOOL)date:(NSDate *)date1 isBefore:(NSDate *)date2;

    //Getting the start of a day
    +(NSDate *)startOfDay:(NSDate *)day;

    //Getting yesterday's date
    +(NSDate *)yesterday;

    //Getting a formatted string with the time from an NSDate e.g. 06:42 PM
    +(NSString *)timeFormattedString:(NSDate *)date;

    //Getting a formatted string with the time from a start
    //NSDate and an end NSDate e.g. 06:42PM - 07:00PM
    +(NSString *)timeFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate;M

    //Getting a formatted string with the date from an NSDate e.g. Tue, 09/06/14
    +(NSString *)dateFormattedString:(NSDate *)date;

    //Getting a formatted string with the start date and end date
    //from NSDates e.g. Tue, 09/06/14 - Wed, 09/07/14
    +(NSString *)dateFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate;

    //Getting a formatted string with the date and time from
    //an NSDate e.g. Tue, 09/06/14 at 06:42PM
    +(NSString *)dateTimeFormattedString:(NSDate *)date;

    //Getting a formatted string with the start date and time and the end 
    //date and time from NSDates
    //e.g. Tue, 09/06/14 at 06:42PM to Wed, 09/07/14 at 07:00AM
    +(NSString *)dateTimeFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate;

    //Getting a string that from an NSDate that can be parsed into a 
    //javascription Date object 
    //(useful for dealing with REST APIs such as facebook)
    +(NSString *)javascriptDateObjectFormat:(NSDate *)date;

    //Getting a NSDate by parsing a datetime string returned by the 
    //facebook Graph API
    +(NSDate *)dateFromFacebookDateTime:(NSString *)datetime;

    //Getting a NSDate by parsing the datetime (where there is only a date and 
    //no time) from the facebook Graph API
    +(NSDate *)dateFromFacebookDate:(NSString *)datetime;



EXAMPLE USE:

    #import "NSDate+Extended.h"


    // Use of (BOOL)date:(NSDate *)date1 isBefore:(NSDate *)date2
    NSDate *yesterday = [NSDate yesterday];
    NSDate *today = [[NSDate alloc] init];
    BOOL isBefore = [NSDate date:yesterday isBefore:today]; 


    // Use of (NSDate *)incrementDay:(NSDate *)day by:(NSUInteger)daysToAdd
    NSDate *today = [[NSDate alloc] init];
    NSDate aWeekLater = [NSDate incrementDay:today by:7];


    //Use of (NSDate *)startOfDay:(NSDate *)day
    NSDate *today = [[NSDate alloc] init];
    NSDate *startOfDay = [NSDate startOfDay:today]; //time is 12:00AM


    //Use of (NSDate *)yesterday
    NSDate *yesterday = [NSDate yesterday];


    //Use of (NSString *)timeFormattedString:(NSDate *)date
    NSDate *today = [[NSDate alloc] init];
    NSString *timeString = [NSDate timeFormattedString:today];


    //Use of (NSString *)timeFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate
    NSDate *today = [[NSDate alloc] init];
    NSDate *startOfToday = [NSDate startOfToday:today];
    NSString *stringFromMidnightToCurrentTime = [NSDate timeFormattedStringForStartDate:startOfToday EndDate:today];


    //Use of (NSString *)dateFormattedString:(NSDate *)date
    NSDate *today = [[NSDate alloc] init];
    NSString *dateString = [NSDate dateFormattedString:today];


    //Use of (NSString *)dateFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow = [NSDate incrementDay:today by:1];
    NSString *dateString = [NSDate dateFormattedStringForStartDate:today EndDate:tomrrow];


    //Use of (NSString *)dateTimeFormattedString:(NSDate *)date
    NSDate *today = [[NSDate alloc] init];
    NSString *dateTimeString = [NSDate dateTimeFormattedString:today];


    //(NSString *)dateTimeFormattedStringForStartDate:(NSDate *)startTime EndDate:(NSDate *)endDate
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow = [NSDate incrementDay:today by:1];
    NSDate *dateTimeString = [NSDate dateTimeFormattedStringForStartDate:today EndDate:tomorrow];



    //Use of (NSString *)javascriptDateObjectFormat:(NSDate *)date
    NSDate *today = [[NSDate alloc] init];
    NSString *javascripFormattedString = [NSDate javascriptDateObjectFormat:today];

    //In a file containing javascript
    //
    //  var today = new Date(stringPassedFromClient);
    //






    //Use of (NSDate *)dateFromFacebookDateTime:(NSString *)datetime

    //event is a FBGraphObject returned from a REST get request
    NSString *facebookDateString = [event valueForKey:@"updated_time"];
    NSDate *updatedAt = [NSDate dateFromFacebookDateTime:facebookDateString];







    //Use of (NSDate *)dateFromFacebookDate:(NSString *)datetime

    //event is a FBGraphObject returned from a REST get request
    BOOL isDateOnly = [[event valueForKey:@"is_date_only"] boolValue];

    NSString *facebookTimeString = [event valueForKey:@"start_time"];
    NSDate *date;
    if(isDateOnly) {
        date = [NSDate dateFromFacebookDate:facebookTimeString];
    } else {
        date = [NSDate dateFromFacebookDateTime:facebookTimeString];
    }






FEEL FREE TO ADD YOUR OWN METHODS OR MESSAGE ME WITH 
COMMENTS AND/OR BUG FIXES







