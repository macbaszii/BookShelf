//
//  Book.h
//  TestProject
//
//  Created by Kiattisak Anoochitarom on 7/11/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, strong) NSString *isbn;
@property (nonatomic, strong) NSString *title;

- (instancetype)initWithTitle:(NSString *)title andISBN:(NSString *)isbn;
+ (instancetype)bookWithTitle:(NSString *)title andISBN:(NSString *)isbn;

@end
