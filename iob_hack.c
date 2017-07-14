/* A shim to discard messages for stdout, stderr
 *
 * See:
 * https://stackoverflow.com/questions/30412951/unresolved-external-symbol-imp-fprintf-and-imp-iob-func-sdl2#30894349
 * for background
 */

#include <stdio.h>

FILE _my_iob[3];
int _my_iob_null = 0;

_CRTIMP FILE *__cdecl __iob_func(void)
{
    if (_my_iob_null) {
        _my_iob[0] = *fopen("nul", "r");
        _my_iob[1] = *fopen("nul", "w");
        _my_iob[2] = _my_iob[1];
        _my_iob_null = 0;
    }
    return _my_iob;
}
