//
//  MFUtilities.m
//  myFestivals
//
//  Created by Pedro Fp on 28/10/10.
//  Copyright 2010 myFestivalsApp.com. All rights reserved.
//

#import "MFUtilities.h"

@implementation MFUtilities

- (NSDate *)dateFromISOstringAtUTC:(NSString *)dateString {
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
	return [dateFormatter dateFromString:dateString];
}


@end

@implementation NSString (NSString_Additions)

-(NSString *)rot13String {
	const char *_string = [self cStringUsingEncoding:NSASCIIStringEncoding];
	int stringLength = [self length];
	char newString[stringLength+1];
	
	int x;
	for( x=0; x<stringLength; x++ ) {
		unsigned int aCharacter = _string[x];
		
		if( 0x40 < aCharacter && aCharacter < 0x5B ) // A - Z
			newString[x] = (((aCharacter - 0x41) + 0x0D) % 0x1A) + 0x41;
		else if( 0x60 < aCharacter && aCharacter < 0x7B ) // a-z
			newString[x] = (((aCharacter - 0x61) + 0x0D) % 0x1A) + 0x61;
		else  // Not an alpha character
			newString[x] = aCharacter;
	}
	
	newString[x] = '\0';
	
	NSString *rotString = [NSString stringWithCString:newString encoding:NSASCIIStringEncoding];
	
	return(rotString);
}

@end
