#include "stdio.h"
#include "math.h"
#include "string.h"
#include "../backend/free_Memory.h"
#include <string>
#include <iostream>
#include <filesystem>
#include <algorithm>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <signal.h>
#include <stdio.h>
#include "sysy.tab.h"
#include <sys/wait.h>
#include <sys/resource.h>

using namespace std;
extern int yylineno;
extern char *yytext;
extern FILE *yyin;

pid_t p1;
void apply_stack()
{
    struct rlimit limit;
    memset(&limit, 0, sizeof(limit));
    limit.rlim_cur = RLIM_INFINITY; //软限制，表示对资源没有限制
    limit.rlim_max = RLIM_INFINITY; //硬限制，这个参数表示对资源没有限制，一定要大于等于rlim_cur值
    setrlimit(RLIMIT_STACK, &limit);
}
int main(int argc, char *argv[])
{
    apply_stack();
    yyin = fopen(argv[4], "r");
    if (!yyin)
        return 0;
    strcpy(filename, argv[4]);
    strcpy(out_file, argv[3]);

    p1 = fork();
    if (p1 == 0)
    {
        clock_t beginTime = clock();

        //生成语法树；
        yyparse(), fclose(yyin);

        //生成中间代码；
        gen_IR(out_ast);
        putout_IR(out_IR);

        //生成汇编代码；
        translation();

        // print_arm();
        putout_arm();
        //释放内存；
        free_Memory();

        pid_t pid = getpid();
        clock_t endTime = clock();
        cout << "Time: " << (endTime - beginTime) / 1000000.0 << "s" << endl;
        cout << "Mem: ";
        system(string("cat /proc/" + to_string(pid) + "/status | grep VmHWM | awk '{print $2 $3}' > /dev/fd/2 >>../test_out.txt").data());

        return 0;
    }
    else
    {
        wait(NULL);

        return 0;
    }
}