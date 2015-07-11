//
//  TestProjectTests.m
//  TestProjectTests
//
//  Created by Kiattisak Anoochitarom on 7/11/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Book.h"
#import "BookShelf.h"

@interface TestProjectTests : XCTestCase

@end

@implementation TestProjectTests

- (void)setUp {
    [super setUp];
}

- (void)testBookShelfShouldHaveDefaultTwoBooks {
    Book *hungerGames = [[Book alloc] initWithTitle:@"Hunger Games"
                                            andISBN:@"ashdayd889832dudhwheu"];
    Book *iosProgramming = [[Book alloc] initWithTitle:@"iOS Programming"
                                               andISBN:@"dsjfs;gkf324rrgioj"];
    
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[hungerGames, iosProgramming]];
    XCTAssertEqual(shelf.books.count, 2);
}

- (void)testAddBookToShelf {
    Book *harryPotter = [Book bookWithTitle:@"Harry Potter" andISBN:@"joi2j3oi4j32o4j234"];
    
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[]];
    NSInteger amountBeforeAdd = shelf.books.count;
    
    [shelf addBook:harryPotter];
    
    BOOL found = NO;
    for (Book *book in shelf.books) {
        if ([book.title isEqualToString:harryPotter.title]) {
            found = YES;
            break;
        }
    }
    
    XCTAssertEqual(shelf.books.count, amountBeforeAdd + 1);
    XCTAssertTrue(found == YES);
}

- (void)testShouldFoundHungerGamesBookInShelf {
    Book *hungerGames = [[Book alloc] initWithTitle:@"Hunger Games"
                                            andISBN:@"ashdayd889832dudhwheu"];
    Book *iosProgramming = [[Book alloc] initWithTitle:@"iOS Programming"
                                               andISBN:@"dsjfs;gkf324rrgioj"];
    
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[hungerGames, iosProgramming]];
    NSInteger amountBeforeTaken = shelf.books.count;
    Book *foundBook = [shelf bookWithTitle:@"Hunger Games"];
    
    XCTAssertEqual(shelf.books.count, amountBeforeTaken - 1);
    XCTAssertNotNil(foundBook);
    XCTAssertTrue([foundBook.title isEqualToString:@"Hunger Games"]);
}

- (void)testShouldNotFoundHarryPotterBookInShelf {
    Book *hungerGames = [[Book alloc] initWithTitle:@"Hunger Games"
                                            andISBN:@"ashdayd889832dudhwheu"];
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[hungerGames]];
    
    Book *notFoundBook = [shelf bookWithTitle:@"Harry Potter"];
    XCTAssertNil(notFoundBook);
}

- (void)testShouldSortByTitleInAscendingOrderAfterAddedNewBook {
    Book *hungerGames = [[Book alloc] initWithTitle:@"Hunger Games"
                                            andISBN:@"ashdayd889832dudhwheu"];
    Book *iosProgramming = [[Book alloc] initWithTitle:@"iOS Programming"
                                               andISBN:@"dsjfs;gkf324rrgioj"];
    
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[iosProgramming]];
    [shelf addBook:hungerGames];
    
    XCTAssertTrue([((Book *)shelf.books.firstObject).title isEqualToString:hungerGames.title]);
    XCTAssertTrue([((Book *)shelf.books.lastObject).title isEqualToString:iosProgramming.title]);
}

@end
