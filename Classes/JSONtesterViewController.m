//
//  JSONtesterViewController.m
//  JSONtester
//
//  Created by Pedro Fp on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "JSONtesterViewController.h"
#import "MFUtilities.h"

@implementation JSONtesterViewController

@synthesize loginButton, festivalButton;

- (IBAction)logout:(id)sender {
	NSLog(@"Attempting Logout");
	
	NSString *jsonRequest = [NSString stringWithFormat:@"{ 'logout':'please' }"];
	
	NSLog(@"Request: %@", jsonRequest);
	
	NSString *urlString = @"http://59.167.251.9:9292/json/logout";
	
	NSLog(@"URL: %@", urlString);
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
	
	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	//[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];
	
	//[self logHeadersInHTTPrequest:request];
	
	[NSURLConnection connectionWithRequest:[request autorelease] delegate:self];
}

- (IBAction)registerNewUser:(id)sender {
	NSLog(@"Attempting Registration");
 
	NSString *email = @"test_my_festivals_app@davesag.com";
	NSString *password = @"password";
	NSString *jsonRequest = [NSString stringWithFormat:@"{\"email\": \"%@\", \"password\": \"%@\" }",
							 email, [password rot13String]];

	NSLog(@"Request: %@", jsonRequest);

	NSString *urlString = @"http://59.167.251.9:9292/json/registration";

	NSLog(@"URL: %@", urlString);

	NSURL *url = [NSURL URLWithString:urlString];

	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];

	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	//[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];

	//[self logHeadersInHTTPrequest:request];

	[NSURLConnection connectionWithRequest:[request autorelease] delegate:self];
}
														  
- (IBAction)resetPassword:(id)sender {
	NSLog(@"Attempting Password Reset");
	
	NSString *email = @"test_my_festivals_app@davesag.com";
	NSString *jsonRequest = [NSString stringWithFormat:@"{\"email\": \"%@\" }", email];
	
	NSLog(@"Request: %@", jsonRequest);
	
	NSString *urlString = @"http://59.167.251.9:9292/json/reset_password";
	
	NSLog(@"URL: %@", urlString);
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
	
	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];
	
	[NSURLConnection connectionWithRequest:[request autorelease] delegate:self];
}


- (IBAction)whoAmI:(id)sender {
	NSLog(@"Attempting Login");
	
	NSString *urlString = @"http://59.167.251.9:9292/json/who_am_i";
	
	NSLog(@"URL: %@", urlString);
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	
	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	
	[NSURLConnection connectionWithRequest:[request autorelease] delegate:self];
}



- (IBAction)login:(id)sender {
	NSLog(@"Attempting Login");
	
	NSString *username = @"root";
	NSString *password = @"password";
	NSString *jsonRequest = [NSString stringWithFormat:@"{\"username\": \"%@\", \"password\": \"%@\" }",
							 username, [password rot13String]];
	
	NSLog(@"Request: %@", jsonRequest);
	
	NSString *urlString = @"http://59.167.251.9:9292/json/login";
	
	NSLog(@"URL: %@", urlString);
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
	
	[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	//[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];
	
	//[self logHeadersInHTTPrequest:request];
	
	[NSURLConnection connectionWithRequest:[request autorelease] delegate:self];
}

- (IBAction)getFestival:(id)sender {
	NSLog(@"Attempting to get Festival");
	
	NSString *urlString = @"http://59.167.251.9:9292/json/festival/1";
	// myfestivalsadmin.heroku.com/festival_j/1
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	
	//[request setHTTPMethod:@"POST"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	
	//[self logHeadersInHTTPrequest:request];
	
	[NSURLConnection connectionWithRequest:[request autorelease] delegate:self];
}
		   
- (void)logHeadersInHTTPrequest:(NSMutableURLRequest *)request {
	NSArray *headerArray = [NSArray arrayWithObjects:@"Accept", @"Accept-Charset", @"Accept-Encoding", @"Accept-Language",
						@"Authorization", @"Expect", @"From", @"Host", @"If-Match", @"If-Modified-Since",
						@"If-None-Match", @"If-Range", @"If-Unmodified-Since", @"Max-Forwards", @"Proxy-Authorization",
						@"Range", @"Referer", @"TE", @"User-Agent", nil];
	for (NSString *headerName in headerArray) {
		//NSLog(@"hello");
		NSString *headerString = [request valueForHTTPHeaderField:headerName];
		NSLog(@"Header '%@': %@", headerName, headerString);
	}

	//
}

- (void)logDetailsOfHTPresponse:(NSURLResponse *)response {
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog(@"connection: didReceiveData");
	
	NSMutableData *d = [[NSMutableData data] retain];
	[d appendData:data];
	
	// Is the data being returned really ASCII & not UTF?
	NSString *a = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
	
	NSLog(@"Data: %@", a);
	
	[d release];
	[a release];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	NSLog(@"connection: didReceiveAuthenticationChallenge");
	
	if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
		[challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
	}
	
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
	NSLog(@"connection: canAuthenticateAgainstProtectionSpace");
	
	if([[protectionSpace authenticationMethod] isEqualToString:NSURLAuthenticationMethodServerTrust]) {
	//	return YES;
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"Response expectedContentLength:%i", [response expectedContentLength]);
	NSLog(@"Response MIMEType: %@", [response MIMEType]);
	NSLog(@"Response suggestedFilename:%@", [response suggestedFilename]);
	NSLog(@"Response textEncodingName:%@", [response textEncodingName]);
	NSLog(@"Response URL:%@", [[response URL] description]);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[loginButton release];
	[festivalButton release];
	
    [super dealloc];
}

@end
