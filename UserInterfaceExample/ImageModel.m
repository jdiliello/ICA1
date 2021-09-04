//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel ()
// declare property
@property (strong, nonatomic) NSDictionary *imageDict;
@property (strong, nonatomic) NSArray *imageNameArray;
@end

@implementation ImageModel

// link the property to the variable
@synthesize imageDict = _imageDict;
@synthesize imageNameArray = _imageNameArray;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

// create an array that is lazily instantiated
// that holds the names of the images we are loading
-(NSArray*)imageNameArray{
    if(!_imageNameArray)
        _imageNameArray = @[@"Eric", @"Jeff", @"Bill"];
    // NSLog(@"%@", _imageNameArray);
    return _imageNameArray;
}


// create a lazy dict from the imageNameArray
// takes each name from imageNameArray as the key
// then stores the UIImage object with that name
// as the value in the dictionary
-(NSDictionary*)imageDict{
    if (!_imageDict)
        _imageDict = @{
            @"Eric":[UIImage imageNamed:@"Eric"],
            @"Jeff":[UIImage imageNamed:@"Jeff"],
            @"Bill":[UIImage imageNamed:@"Bill"]
        // NSLog(@"%@", self.imageNameArray);
        // for (id name in self.imageNameArray){
            // NSLog(@"%@", name);
            // [_imageDict setObject:[UIImage imageNamed:name] forKey:name];
        //    [_imageDict setObject:@"YES" forKey:name];
        };
    NSLog(@"%@", _imageDict);
    return _imageDict;
}

// return the image from the name
-(UIImage*)getImageWithName:(NSString*)name{
    return self.imageDict[name];
}

// get the name by index from the name array
// then return the image using the name
-(UIImage*)getImageWithIndex:(NSInteger)index{
    return self.imageDict[self.imageNameArray[index]];
}

// return the count of keys
-(NSInteger)numberOfImages{
    return [self.imageDict count];
}

// return the image name from the index
-(NSString*)getImageNameForIndex:(NSInteger)index;{
    return self.imageNameArray[index];
}

@end
