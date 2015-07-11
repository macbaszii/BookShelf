//
//  Book.m
//  TestProject
//
//  Created by Kiattisak Anoochitarom on 7/11/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype)initWithTitle:(NSString *)title andISBN:(NSString *)isbn {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.isbn = isbn;
    }
    
    return self;
}

+ (instancetype)bookWithTitle:(NSString *)title andISBN:(NSString *)isbn {
    return [[Book alloc] initWithTitle:title andISBN:isbn];
}

@end
