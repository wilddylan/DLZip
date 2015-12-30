//
//  DLZip.h
//  Pods
//
//  Created by Dylan on 15/12/30.
//
//

#import <Foundation/Foundation.h>

#import "dl_definess.h"

@interface DLZip : NSObject

+ (BOOL)unzipFileAtPath:(NSString *)path
          toDestination:(NSString *)destination
              overwrite:(BOOL)overwrite
               password:(NSString *)password
                  error:(NSError **)error
        progressHandler:(void (^)(NSString *entry, unz_file_info zipInfo, long entryNumber, long total))progressHandler
      completionHandler:(void (^)(NSString *path, BOOL succeeded, NSError *error))completionHandler;

@end
