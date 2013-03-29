//
//  GeneralUtils.m
//
//
//  Created by Michael Weissman on 3/27/13.
//  Copyright (c) 2013 Michael Weissman. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// General Utility Functions


#define kMWTempIDKey @"com.weisso.examples.GeneralUtils.TempID"


/*
	Sometimes you might need a "temp" ID before you can get a "real" one from your Data Source.
	This method will generate one for you, without re-using.
*/
+(int)GetNextTempID
{
    NSArray *usedIds = [[NSUserDefaults standardUserDefaults]objectForKey:kMWTempIDKey];
    if (!usedIds) {
        usedIds = [NSArray array];
    }

    NSMutableArray *writeUsedIds = [NSMutableArray arrayWithArray:usedIds];
    int max = INT32_MAX;

    while ([writeUsedIds containsObject:[NSNumber numberWithInt:max]]) {
        max--;
    }

    [writeUsedIds addObject:[NSNumber numberWithInt:max]];
    [[NSUserDefaults standardUserDefaults]setObject:writeUsedIds forKey:kMWTempIDKey];
    return max;
}

/*
	Remove whitespace, newline, and illegal character sets
	Could be made into a Category
*/
+(NSString *)CleanString:(NSString *)strToClean
{
    if(!strToClean) return nil;

    NSString *retVal = [strToClean stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    retVal = [retVal stringByTrimmingCharactersInSet:[NSCharacterSet illegalCharacterSet]];
    return retVal;
}

