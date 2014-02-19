//
//  aNote.h
//  Commonplace
//
//  Created by Travis Favaron on 1/13/14.
//  Copyright (c) 2014 Travis Favaron. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface aNote : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * noteTitle;
@property (nonatomic, retain) NSString * noteContent;

@end
