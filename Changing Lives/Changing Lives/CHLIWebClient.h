//
//  CHLIWebClient.h
//  Changing Lives
//
//  Created by Kai Oelfke on 12.08.12.
//  Copyright (c) 2012 Kai Oelfke. All rights reserved.
//

#import "AFHTTPClient.h"

@interface CHLIWebClient : AFHTTPClient
@property (assign, nonatomic) BOOL isLoggedIn;

+ (id)sharedInstance;
- (void)loginWithUser:(NSString*)user password:(NSString*)pass completionBlock:(void (^)(id responseObject, NSError *error))block;
- (void)logout;
@end
