//
//  main.m
//  Challenge: regular words and proper names
//
//  Created by Guwanjith Tennekoon on 8/21/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Read in a file as a huge string
        NSString *properNames = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames" encoding:NSUTF8StringEncoding error:NULL];
        
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words/" encoding:NSUTF8StringEncoding error:NULL];
        
        //Break into an array of strings
        NSArray *names = [properNames componentsSeparatedByString:@"\n"];
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];
                //Go through the names one by one
        BOOL isUppercase;
        for(NSString *name in names)
        {
            for(NSString *word in words)
            {
                //Do the comparison (uppercase comes before lowercase)
                if ([name caseInsensitiveCompare: word] == NSOrderedSame && [name compare: word] == NSOrderedAscending)
                {
                    //numberOfInnerIterations++;
                    NSLog(@"The proper name %@ is also the regular word %@", name, word);
                    
                    //Found a match, no need to do any further comparisons
                    break;
                }
            }
        }
    }
    return 0;
}

