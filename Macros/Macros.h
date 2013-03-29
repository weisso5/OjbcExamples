//
//  Macros.h
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

//Helpful Macros I use for most projects

#ifndef Macros_h
#define Macros_h


#define IS_PHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_PAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)


#define UD_SET_VALUE(key, value) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define UD_GET_VALUE(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]


#define ADD_OBSERVER(t,s,n,o)[[NSNotificationCenter defaultCenter]addObserver:t selector:s name:n object:o]
#define REMOVE_OBSERVER(t,n,o)[[NSNotificationCenter defaultCenter]removeObserver:t name:n object:o]
#define POST_NOTIFICATION(n,o)[[NSNotificationCenter defaultCenter]postNotificationName:n object:o]

#define NOT_AVAILABLE(m)__attribute__((unavailable(m)))

#define SHARED_APP_DEL [[UIApplication sharedApplication]delegate]

#define SAVE_CONTEXT(ctx) ({NSError *err = nil; [ctx save:&err]; if (err){ NSLog(@"Failed to save ctx(%@) => %@",ctx,err); }})

#define HTTP_DEBUG_LOG(data) ({ NSString *responseStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]; NSLog(@"[HTTPDEBUG (%s) -%d-] Response text => \n %s ",__func__,__LINE__,[responseStr UTF8String]);});

#endif
