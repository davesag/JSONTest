//
//  JSONtesterAppDelegate.h
//  JSONtester
//
//  Created by Pedro Fp on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSONtesterViewController;

@interface JSONtesterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JSONtesterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JSONtesterViewController *viewController;

@end

