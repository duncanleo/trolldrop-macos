//
//  Sharing.h
//  trolldrop-macos
//
//  Created by Duncan Leo on 23/11/19.
//  Copyright © 2019 Duncan Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FIAirDropViewGutsController : NSObject
@property(copy, nonatomic) NSArray *urlsToSend;

- (void)configureForAirDropAvailability;
- (void)personClicked: (void *) perform;
- (void)resumeAirDropDiscovery;
- (void)configureForAirDropAvailability;

- (void)viewDidMoveToWindow;

@end

//@interface FIAirDropListViewController : NSObject
//@property
//@end
