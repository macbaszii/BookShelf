//
//  ViewController.m
//  TestProject
//
//  Created by Kiattisak Anoochitarom on 7/11/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
#import "BookShelf.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Book *hungerGames = [[Book alloc] initWithTitle:@"Hunger Games"
                                            andISBN:@"ashdayd889832dudhwheu"];
    Book *iosProgramming = [[Book alloc] initWithTitle:@"iOS Programming"
                                            andISBN:@"dsjfs;gkf324rrgioj"];

    BookShelf *shelf = [BookShelf shelfWithBooks:@[hungerGames, iosProgramming]];
    
    Book *harryPotter = [Book bookWithTitle:@"Harry Potter"
                                    andISBN:@"asdjqid82038992efjioej"];

    [shelf addBook:harryPotter];
    
    NSLog(@"%@", [shelf description]);
    
    Book *foundBook = [shelf bookWithTitle:@"Harry Potter"];
    NSLog(@"\nFind %@ Found %@\n", harryPotter.title, foundBook.title);
    NSLog(@"%@", [shelf description]);
}

@end
