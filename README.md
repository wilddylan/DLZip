# DLZip

[![CI Status](http://img.shields.io/travis/Dylan/DLZip.svg?style=flat)](https://travis-ci.org/Dylan/DLZip)
[![Version](https://img.shields.io/cocoapods/v/DLZip.svg?style=flat)](http://cocoapods.org/pods/DLZip)
[![License](https://img.shields.io/cocoapods/l/DLZip.svg?style=flat)](http://cocoapods.org/pods/DLZip)
[![Platform](https://img.shields.io/cocoapods/p/DLZip.svg?style=flat)](http://cocoapods.org/pods/DLZip)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

- Zip files 

```objc

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

```

- UnZip File

```objc

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

```

## Installation

DLZip is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
    pod "DLZip"
```

## Author

Dylan, 3664132@163.com

## License

DLZip is available under the MIT license. See the LICENSE file for more info.
