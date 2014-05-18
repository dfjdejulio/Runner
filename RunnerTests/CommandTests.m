//
//  RunnerTests.m
//  RunnerTests
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Command.h"
#import "HelloSailorCommand.h"

@interface CommandTests : XCTestCase

@end

@implementation CommandTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAbstractCommand
{
    Command *myCommand = [Command new];
    myCommand.input = @"input";
    XCTAssertThrows([myCommand execute], @"The \"abstract\" command should have thrown an exception");
}

- (void)testHelloSailorCommand
{
    NSString *formatString = HELLO_SAILOR_STRING;
    NSString *testInputString = @"Sailor";
    NSString *testOutputString = [NSString stringWithFormat:formatString, testInputString];
    Command *myCommand = [HelloSailorCommand new];
    myCommand.input = @"Sailor";
    [myCommand execute];
    XCTAssertEqualObjects(testOutputString, myCommand.output, @"Expected \"%@\", got \"%@\"", testOutputString, myCommand.output);
}

@end
