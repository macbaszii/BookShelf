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

@property (strong, nonatomic) Book *hungerGames;
@property (strong, nonatomic) Book *iOSProgramming;
@property (strong, nonatomic) Book *harryPotter;

@end

@implementation TestProjectTests

- (void)setUp {
    [super setUp];
    
    self.hungerGames = [Book bookWithTitle:@"Hunger Games"
                                   andISBN:@"ashdayd889832dudhwheu"];
    self.iOSProgramming = [Book bookWithTitle:@"iOS Programming"
                                      andISBN:@"dsjfs;gkf324rrgioj"];
    self.harryPotter = [Book bookWithTitle:@"Harry Potter"
                                   andISBN:@"joi2j3oi4j32o4j234"];

}

- (void)testBookShelfShouldHaveDefaultTwoBooks {
    
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[self.hungerGames, self.iOSProgramming]];
    XCTAssertEqual(shelf.books.count, 2);
}

- (void)testAddBookToShelf {
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[]];
    NSInteger amountBeforeAdd = shelf.books.count;
    
    [shelf addBook:self.harryPotter];
    
    BOOL found = NO;
    for (Book *book in shelf.books) {
        if ([book.title isEqualToString:self.harryPotter.title]) {
            found = YES;
            break;
        }
    }
    
    XCTAssertEqual(shelf.books.count, amountBeforeAdd + 1);
    XCTAssertTrue(found == YES);
}

- (void)testShouldFoundHungerGamesBookInShelf {
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[self.hungerGames,
                                                          self.iOSProgramming]];
    NSInteger amountBeforeTaken = shelf.books.count;
    Book *foundBook = [shelf bookWithTitle:@"Hunger Games"];
    
    XCTAssertEqual(shelf.books.count, amountBeforeTaken - 1);
    XCTAssertNotNil(foundBook);
    XCTAssertTrue([foundBook.title isEqualToString:@"Hunger Games"]);
}

- (void)testShouldNotFoundHarryPotterBookInShelf {
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[self.hungerGames]];

    Book *notFoundBook = [shelf bookWithTitle:@"Harry Potter"];
    XCTAssertNil(notFoundBook);
}

- (void)testShouldSortByTitleInAscendingOrderAfterAddedNewBook {
    BookShelf *shelf = [[BookShelf alloc] initWithBooks:@[self.iOSProgramming]];
    [shelf addBook:self.hungerGames];
    
    XCTAssertTrue([((Book *)shelf.books.firstObject).title isEqualToString:self.hungerGames.title]);
    XCTAssertTrue([((Book *)shelf.books.lastObject).title isEqualToString:self.iOSProgramming.title]);
}

@end
