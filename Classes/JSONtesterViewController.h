//
//  JSONtesterViewController.h
//  JSONtester
//
//  Created by Pedro Fp on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
- (void)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

@end

@interface JSONtesterViewController : UIViewController <NSURLConnectionDelegate> {
	IBOutlet UIButton *loginButton;
	IBOutlet UIButton *festivalButton;
}

@property (nonatomic, retain) IBOutlet UIButton *loginButton;
@property (nonatomic, retain) IBOutlet UIButton *festivalButton;

- (IBAction)login:(id)sender;
- (IBAction)getFestival:(id)sender;
- (IBAction)logout:(id)sender;
- (IBAction)registerNewUser:(id)sender;
- (IBAction)resetPassword:(id)sender;
- (IBAction)whoAmI:(id)sender;

- (void)logHeadersInHTTPrequest:(NSMutableURLRequest *)request;
- (void)logDetailsOfHTPresponse:(NSURLResponse *)response;

@end
