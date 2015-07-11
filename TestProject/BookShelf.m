//
//  BookShelf.m
//  TestProject
//
//  Created by Kiattisak Anoochitarom on 7/11/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import "BookShelf.h"
#import "Book.h"

@implementation BookShelf

- (instancetype)initWithBooks:(NSArray *)books {
    if (self = [super init]) {
        self.books = [books mutableCopy];
    }
    
    return self;
}

+ (instancetype)shelfWithBooks:(NSArray *)books {
    return [[BookShelf alloc] initWithBooks:books];
}

- (void)addBook:(Book *)book {
    [self.books addObject:book];
    [self sortBooks];
}

- (Book *)bookWithTitle:(NSString *)title {
    for (Book *book in self.books) {
        if ([book.title isEqualToString:title]) {
            Book *foundBook = book;
            [self.books removeObject:book];
            
            return foundBook;
        }
    }
    
    return nil;
}

- (void)sortBooks {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title"
                                                                     ascending:YES];
    [self.books sortUsingDescriptors:@[sortDescriptor]];
}

- (NSString *)description {
    NSMutableString *descriptionText = [@"" mutableCopy];
    [self.books enumerateObjectsUsingBlock:^(Book *book, NSUInteger idx, BOOL *stop) {
        [descriptionText appendFormat:@"%lu. %@\n", idx, book.title];
    }];

    return descriptionText;
}

@end
