//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel ()

@property (strong, nonatomic) NSDictionary* images;

@end

@implementation ImageModel

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSDictionary*) images{
    if(!_images)
        _images = @{
            @"Bill":[UIImage imageNamed:@"Bill"],
            @"Eric":[UIImage imageNamed:@"Eric"],
            @"Jeff":[UIImage imageNamed:@"Jeff"],
            @"Jack1":[UIImage imageNamed:@"Jack1"],
            @"Jack2":[UIImage imageNamed:@"Jack2"],
            @"Jack3":[UIImage imageNamed:@"Jack3"],
        };
    
    return _images;
}

- (UIImage*)    getImageWithName:(NSString*)name {
    return self.images[name];
}
- (UIImage*)    getImageWithIndex:(NSInteger)index {
    NSString* name = [self getImageNameForIndex:index];
    
    if (!name)
        return nil;
    return self.images[name];
}
- (NSInteger)  numberOfImages {
    NSInteger count = 0;
    for (id key in self.images) {
        count++;
    }
    return count;
}
- (NSString*)  getImageNameForIndex:(NSInteger) index{
    int i = 0;
    for (id key in self.images) {
        if (i == index)
            return key;
        i++;
    }
    return nil;
}



@end
