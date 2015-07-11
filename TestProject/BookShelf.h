//
//  BookShelf.h
//  TestProject
//
//  Created by Kiattisak Anoochitarom on 7/11/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Book;

@interface BookShelf : NSObject

@property (strong, nonatomic) NSMutableArray *books;

- (instancetype)initWithBooks:(NSArray *)books;
+ (instancetype)shelfWithBooks:(NSArray *)books;

- (void)addBook:(Book *)book;
- (Book *)bookWithTitle:(NSString *)title;

@end
