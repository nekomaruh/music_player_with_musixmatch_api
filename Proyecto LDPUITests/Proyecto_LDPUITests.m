//
//  Proyecto_LDPUITests.m
//  Proyecto LDPUITests
//
//  Created by Johan Esteban Ordenes Galleguillos on 3/25/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Proyecto_LDPUITests : XCTestCase

@end

@implementation Proyecto_LDPUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end