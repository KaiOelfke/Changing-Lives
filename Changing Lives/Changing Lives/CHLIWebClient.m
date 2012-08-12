//
//  CHLIWebClient.m
//  Changing Lives
//
//  Created by Kai Oelfke on 12.08.12.
//  Copyright (c) 2012 Kai Oelfke. All rights reserved.
//

#import "CHLIWebClient.h"
#import "AFNetworking.h"

#define ChangingLivesBaseURLString @"http://alumni.changing-lives.eu"

@implementation CHLIWebClient : AFHTTPClient
@synthesize isLoggedIn;
+ (id)sharedInstance {
    
    static CHLIWebClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[CHLIWebClient alloc] initWithBaseURL:
                            [NSURL URLWithString:ChangingLivesBaseURLString]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self)
    {
        [self registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    }
    
    return self;
}

- (void)loginWithUser:(NSString*)user password:(NSString*)pass completionBlock:(void (^)(id responseObject, NSError *error))block
{
    /*
    NSArray *xjxargs = @[user,pass];
    NSDictionary *params = @{@"xjxfun":@"encrypt_data",@"xjxargs":xjxargs};
    [self postPath:@"/index.php" parameters:params
           success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         [self getPath:@"/index.php" parameters:nil
               success:^(AFHTTPRequestOperation *operation, id responseObject)
          {
              if ([[operation.response.URL absoluteString] isEqualToString:@"http://www.navendo.de/index.php?menue=passwort"])
              {
                  NSError * loginError = [NSError errorWithDomain:@"de.Navendo" code:403 userInfo:@{ NSLocalizedDescriptionKey : @"Logindaten falsch" }];
                  ACSimpleKeychain *keychain = [ACSimpleKeychain defaultKeychain];
                  if ([keychain deleteCredentialsForIdentifier:kLoginAccountConstant service:kLoginServiceConstant]) NSLog(@"Deleted Credentials");
                  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                  [defaults removeObjectForKey:kLoginUsernameConstant];
                  [defaults synchronize];
                  self.isLoggedIn = NO;
                  block(nil,loginError);
              }
              else
              {
                  self.data = responseObject;
                  ACSimpleKeychain *keychain = [ACSimpleKeychain defaultKeychain];
                  if ([keychain storeUsername:user password:pass identifier:kLoginAccountConstant forService:kLoginServiceConstant])
                  {
                      NSLog(@"SAVED credentials");
                      NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                      [defaults setObject:user forKey:kLoginUsernameConstant];
                      [defaults synchronize];
                  }
                  self.isLoggedIn = YES;
                  block(responseObject,nil);
                  
              }
          }
               failure:^(AFHTTPRequestOperation *operation, NSError *error)
          {
              NSLog(@"responseData: %@", error.debugDescription);
              self.isLoggedIn = NO;
              block(nil,error);
              
          }];
     }
           failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"responseData: %@", error.debugDescription);
         self.isLoggedIn = NO;
         block(nil,error);
         
     }];
     */
}

- (void)logout
{
    if (self.isLoggedIn)
    {
        /*
        [self getPath:@"/index.php?aktion=logout" parameters:nil
              success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             self.isLoggedIn = NO;
         }
              failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             
         }];
        */
    }
    
}

@end
