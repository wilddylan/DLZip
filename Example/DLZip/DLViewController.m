//
//  DLViewController.m
//  DLZip
//
//  Created by Dylan on 12/30/2015.
//  Copyright (c) 2015 Dylan. All rights reserved.
//

#import "DLViewController.h"
#import "DLZip.h"

@interface DLViewController ()

@end

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)ZipAction:(id)sender {
    
    NSString * filePath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"/Caches"];
    
    NSString * text = @"this is zip file with password pass_value";
    [text writeToFile:[filePath stringByAppendingString:@"/test.text"] atomically:YES];
    
    // zip
    
    // zip with /Caches all Dictionary.
    
    // CREATE:
    
    //! @discussion create method, will create zipFile when call this method. !
    
    BOOL success = [DLZip createZipFileAtPath:[filePath stringByAppendingPathComponent:@"MyCreatedZip.zip"] withContentsOfDirectory:filePath keepParentDirectory:YES withPassword:@"pass_value"];
    
    if (success) {
        
        NSLog(@"create zip file success");
    } else {
        
        NSLog(@"create zip file failure");
    }
}

- (IBAction)unZipAction:(id)sender {
    
    NSString * filePath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"/Caches"];
    
    NSError * error = nil;
    
    // unzip
    
    [DLZip unzipFileAtPath:[[NSBundle mainBundle] pathForResource:@"TestPasswordArchive" ofType:@"zip"] toDestination:filePath overwrite:YES password:@"passw0rd" error:&error progressHandler:^(NSString *entry, unz_file_info zipInfo, long entryNumber, long total) {
        
        NSLog(@"entry : %@", entry);
        NSLog(@"zipInfo: %lu", zipInfo.size_file_comment);
        NSLog(@"entryNumber: %ld", entryNumber);
        NSLog(@"total: %ld", total);
    } completionHandler:^(NSString *path, BOOL succeeded, NSError *error) {
        
        NSLog(@"%@", path);
        
        if (succeeded) {
            
            NSLog(@"unzip success.");
        } else {
            
            NSLog(@"unzip failure.");
        }
        
        if (error) {
            
            NSLog(@"error = %@", error);
        }
    }];
}

- (IBAction)logAction:(id)sender {
    
    NSString * filePath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"/Caches"];
    
    NSDirectoryEnumerator * enuma = [[NSFileManager defaultManager] enumeratorAtPath:filePath];
    while ([enuma nextObject]) {
        
        NSLog(@"%@", enuma.nextObject);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
