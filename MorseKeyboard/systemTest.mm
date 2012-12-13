#import "systemTest.h"

#include <stdlib.h>
#include <stdio.h>

void funcTest()
{
    FILE *lsofFile_p = popen("ls /usr/bin/", "r");
    
    if (!lsofFile_p)
    {
        //return -1;
    }
    
    char buffer[10000];
    fgets(buffer, sizeof(buffer), lsofFile_p);
    pclose(lsofFile_p);
    printf("%s\n", buffer);
}

@implementation systemTest

+(void)runTest
{
    funcTest();
}

@end



