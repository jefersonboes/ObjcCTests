/**
* Testes with Objective C
*
* @author Jeferson B.
*/

//gcc main.m `gnustep-config --objc-flags` `gnustep-config --objc-libs` -lobjc -lgnustep-base -o main

#include <objc/Object.h>
#include <Foundation/Foundation.h>

@interface Person : NSObject
{
	NSString *name;
}

- () init:  (NSString *) aname;
- () init;
- (void)speakName;

@end

#include <stdio.h>

@implementation Person

- () init: (NSString *) aname
{	
	name =  aname;
	return self;
}

- () init
{
	return [self init: @"no name"];
}

- (void)speakName
{
	printf("%s\n", [name UTF8String]);
}

@end


@interface Worker : Person
{
	NSString *work;
}
- () init;
- (NSString *) getWork;
- (void) work;
@end

@implementation Worker

- () init
{
	work = @"no work";
	return [super init];
}

- (NSString *) getWork
{
	return work; 
}

- (void) work
{
	printf("%s\n", [[self getWork] UTF8String]);
}

@end


@interface Programmer : Worker
{

}
- () init: (NSString *) aname;
@end

@implementation Programmer
- () init: (NSString *) aname
{
	[super init: aname];
	work = @"programming";
	return self;
}
@end


@interface Tester : Worker
{

}
- () init;
@end

@implementation Tester
- () init
{
	[super init];
	work = @"testing";
	return self;
}
@end

#include <stdlib.h>

int main(void)
{
	Person * person = [[Person alloc] init];
	[person speakName];

	Worker * worker = [[Worker alloc] init];
	[worker speakName];
	[worker work];

	Programmer * programmer = [[Programmer alloc] init: @"John"];
	[programmer speakName];
	[programmer work];

	Tester * tester = [[Tester alloc] init];
	[tester speakName];
	[tester work];

	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSLog( @"Objective-C has ARC now :D");
	[pool drain];

	return EXIT_SUCCESS;
}