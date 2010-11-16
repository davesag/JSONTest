//
//  MFUtilities.h
//  myFestivals
//
//  Created by Pedro Fp on 28/10/10.
//  Copyright 2010 myFestivalsApp.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MFUtilities : NSObject {

}

- (NSDate  *)dateFromISOstringAtUTC:(NSString *)ISOstring;

@end

@interface NSString (NSString_Additions)

- (NSString *)rot13String;

@end





