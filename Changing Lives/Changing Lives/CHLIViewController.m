//
//  CHLIViewController.m
//  Changing Lives
//
//  Created by Kai Oelfke on 14.07.12.
//  Copyright (c) 2012 Kai Oelfke. All rights reserved.
//

#import "CHLIViewController.h"
#import "AFNetworking.h"
@interface CHLIViewController ()

@end

@implementation CHLIViewController
@synthesize wView;
@synthesize usernameTextField;
@synthesize passwordTextField;
@synthesize loginButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    }

- (void)viewDidUnload
{
    [self setWView:nil];
    [self setUsernameTextField:nil];
    [self setPasswordTextField:nil];
    [self setLoginButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
    NSString *log = @"k.oelfke@me.com";
    NSString *pwd = @"testiosapp04";
    
    NSString *_wp_original_http_referer = @"%2f";
    NSString *wp_submit = @"Log+In"; //wp-submit ist der Key
    NSString *redirect_to = @"http%3A%2F%2Falumni.changing-lives.eu%2Fwp-admin%2F";
    NSString *testcookie = @"1";
    NSString *instance = @"1";
    
    NSDictionary * loginDict = [NSDictionary dictionaryWithObjectsAndKeys:log,@"log",pwd,@"pwd",_wp_original_http_referer,@"_wp_original_http_referer",wp_submit,@"wp-submit",redirect_to,@"redirect_to",testcookie,@"testcookie",instance,@"instance", nil];
    
    NSString *location = @"Berlin";
    NSString *date = @"03-07-2012";
    NSString *studentsCount = @"1";
    NSString *detailInfo = @"some detail text";
    
    NSURL *baseURL = [NSURL URLWithString:@"http://alumni.changing-lives.eu/"];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    NSMutableURLRequest *loginRequest = [httpClient requestWithMethod:@"POST" path:@"?action=login&instance=1" parameters:loginDict];
    AFHTTPRequestOperation *loginOperation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
    NSString *dataString = [[NSString alloc] initWithData:[loginRequest HTTPBody] encoding:NSUTF8StringEncoding];
    NSLog(@"%@ %@",dataString, [[loginRequest URL] absoluteString]);
    [loginOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) 
     {
         NSLog(@"Success at first POST");
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) 
     {
         
         NSLog(@"%@",error.debugDescription);
     }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperations:[NSArray arrayWithObject:loginOperation] waitUntilFinished:YES];
    
    NSMutableURLRequest *websiteRequest = [httpClient requestWithMethod:@"GET" path:@"" parameters:nil];
    AFHTTPRequestOperation *getWebsiteOperation = [[AFHTTPRequestOperation alloc] initWithRequest:websiteRequest];
    [getWebsiteOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"Success at first GET");
         [self.wView loadData:responseObject MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) 
     {
         NSLog(@"%@",error.debugDescription);
     }];
    
    [queue addOperation:getWebsiteOperation];
    /*
     NSData* sendData = [self.fileName.text dataUsingEncoding:NSUTF8StringEncoding];
     NSDictionary *sendDictionary = [NSDictionary dictionaryWithObject:sendData forKey:@"name"];
     
     NSMutableURLRequest *afRequest = [httpClient multipartFormRequestWithMethod:@"POST" 
     path:@"/photos" 
     parameters:sendDictionary 
     constructingBodyWithBlock:^(id <AFMultipartFormData>formData) 
     {                                     
     [formData appendPartWithFileData:photoImageData 
     name:self.fileName.text 
     fileName:filePath 
     mimeType:@"image/jpeg"]; 
     }
     ];
     
     AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:afRequest];
     [operation setUploadProgressBlock:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
     
     NSLog(@"Sent %d of %d bytes", totalBytesWritten, totalBytesExpectedToWrite);
     
     }];
     
     [operation setCompletionBlock:^{
     NSLog(@"%@", operation.responseString); //Gives a very scary warning
     }];
     
     [operation start]; 
     
     */

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pushLogin:(id)sender {
}
@end
